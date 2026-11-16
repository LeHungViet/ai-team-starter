#!/bin/sh
# AI Team Starter (English) — session save reminder.
#   session-reminder.sh start  (SessionStart): record when the session started; if this folder has
#                              earlier sessions that ended unsaved → remind the agent to run save-session
#                              (each unsaved session is reminded only once).
#   session-reminder.sh end    (SessionEnd):   session wrote no log into memory/sessions/ → mark it "unsaved".
# Only for folders that already have memory/MEMORY.md. Never writes into the user's folder; state lives
# in the plugin's data directory. Must finish fast (SessionEnd has ~1.5 s).

MODE="${1:-start}"
INPUT=$(cat 2>/dev/null || true)

# Cloud sessions are fresh machines; markers cannot persist → skip (rely on Article 6 of AGENTS.md).
[ "${CLAUDE_CODE_REMOTE:-}" = "true" ] && exit 0

field() {
  printf '%s' "$INPUT" | sed -n "s/.*\"$1\"[[:space:]]*:[[:space:]]*\"\([^\"]*\)\".*/\1/p" | head -n 1
}

DIR=$(field cwd)
[ -n "$DIR" ] || DIR="${CLAUDE_PROJECT_DIR:-$PWD}"
[ -f "$DIR/memory/MEMORY.md" ] || exit 0

SID=$(field session_id)
[ -n "$SID" ] || exit 0
TP=$(field transcript_path)

DATA="${CLAUDE_PLUGIN_DATA:-${PLUGIN_DATA:-$HOME/.ai-team-starter-en}}"
KEY=$(printf '%s' "$DIR" | cksum | cut -d ' ' -f 1)
STARTED="$DATA/started"
UNSAVED="$DATA/unsaved/$KEY"
mkdir -p "$STARTED" "$UNSAVED" 2>/dev/null || exit 0

emit() {
  ESC=$(printf '%s' "$1" | sed 's/\\/\\\\/g; s/"/\\"/g')
  printf '{"hookSpecificOutput":{"hookEventName":"SessionStart","additionalContext":"%s"}}\n' "$ESC"
}

case "$MODE" in
start)
  # Record the start time (keep the first one if the session is resumed).
  [ -f "$STARTED/$SID" ] || printf '%s\n' "$DIR" > "$STARTED/$SID" 2>/dev/null
  # This session was resumed → drop its own "unsaved" mark; it is re-checked at the end.
  rm -f "$UNSAVED/$SID" 2>/dev/null

  LIST=""
  N=0
  for M in $(ls -t "$UNSAVED" 2>/dev/null); do
    F="$UNSAVED/$M"
    [ -f "$F" ] || continue
    N=$((N + 1))
    if [ "$N" -le 3 ]; then
      LINE=$(head -n 1 "$F")
      WHEN=${LINE%%|*}
      PATHT=${LINE#*|}
      LIST="$LIST ($N) session ended at $WHEN — transcript: $PATHT;"
    fi
    rm -f "$F" 2>/dev/null   # remind once only
  done
  [ "$N" -gt 0 ] || exit 0
  EXTRA=""
  [ "$N" -gt 3 ] && EXTRA=" $((N - 3)) older session(s) not listed."
  emit "[AI Team Starter] This folder has $N earlier session(s) that ended without being saved to memory:$LIST$EXTRA Before starting new work: tell the user in one short sentence, then run the save-session skill for each session above (read the transcript file; date the log by that session's time). If the user says to skip it, skip it and do not remind again."
  ;;
end)
  START="$STARTED/$SID"
  [ -f "$START" ] || exit 0
  # Saved? Any session log newer than the session start.
  if [ -n "$(find "$DIR/memory/sessions" -type f -newer "$START" 2>/dev/null | head -n 1)" ]; then
    rm -f "$START"
    exit 0
  fi
  # Very short sessions are not worth a reminder.
  LINES=0
  if [ -n "$TP" ] && [ -f "$TP" ]; then
    LINES=$(wc -l < "$TP" 2>/dev/null | tr -d ' ')
  fi
  if [ "${LINES:-0}" -ge 6 ]; then
    printf '%s|%s\n' "$(date '+%Y-%m-%d %H:%M')" "$TP" > "$UNSAVED/$SID" 2>/dev/null
  fi
  rm -f "$START"
  ;;
esac
exit 0
