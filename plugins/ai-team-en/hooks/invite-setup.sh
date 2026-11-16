#!/bin/sh
# AI Team Starter (English) — SessionStart hook.
# If the open folder has no rules file yet (AGENTS.md / CLAUDE.md), ask the agent to offer the
# `setup` skill. Each folder is invited ONCE. The hook never writes into the user's folder:
# the "invited" marker lives in the plugin's data directory.
# Any error → exit 0 silently; the hook must never block a session.

INPUT=$(cat 2>/dev/null || true)

emit() {
  ESC=$(printf '%s' "$1" | sed 's/\\/\\\\/g; s/"/\\"/g')
  printf '{"hookSpecificOutput":{"hookEventName":"SessionStart","additionalContext":"%s"}}\n' "$ESC"
}

# Cloud session (Claude app): the working directory is a VM, not the user's folder, and each
# session is a fresh machine, so "already invited" cannot be remembered. Let the agent decide.
if [ "${CLAUDE_CODE_REMOTE:-}" = "true" ]; then
  emit "[AI Team Starter] Only if this session works on a folder of the user's (a connected folder on their computer, or a repo) and that folder has no AGENTS.md / CLAUDE.md yet: in your first reply, offer in one short sentence to set up a minimal rules file with the setup skill (about 2 minutes, at most 5 questions). If the session has no user folder, the folder already has rules, or the user declined before, say nothing."
  exit 0
fi

# Working folder: prefer "cwd" from the JSON input, then env vars, then $PWD.
DIR=$(printf '%s' "$INPUT" | sed -n 's/.*"cwd"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/p' | head -n 1)
[ -n "$DIR" ] || DIR="${CLAUDE_PROJECT_DIR:-$PWD}"
[ -d "$DIR" ] || exit 0

# Never invite in the home folder or the root.
case "$DIR" in
  "$HOME" | "$HOME/" | "/") exit 0 ;;
esac

# Rules already exist → nothing to do.
for f in AGENTS.md CLAUDE.md .claude/CLAUDE.md CLAUDE.local.md; do
  [ -f "$DIR/$f" ] && exit 0
done

# Already invited this folder → do not invite again.
DATA="${CLAUDE_PLUGIN_DATA:-${PLUGIN_DATA:-$HOME/.ai-team-starter-en}}"
mkdir -p "$DATA/invited" 2>/dev/null || exit 0
KEY=$(printf '%s' "$DIR" | cksum | cut -d ' ' -f 1)
[ -f "$DATA/invited/$KEY" ] && exit 0
printf '%s\n' "$DIR" > "$DATA/invited/$KEY" 2>/dev/null || exit 0

MSG="[AI Team Starter] This folder has no rules file yet (AGENTS.md / CLAUDE.md). In your first reply of the session, before or together with answering the user, offer in one short sentence to set up a minimal rules file with the setup skill (about 2 minutes, at most 5 questions). Write the offer in the language the user is using. If they agree, run the setup skill. If they decline or ignore it, do not ask again; just mention they can type /setup any time. This offer appears only once for this folder."

emit "$MSG"
exit 0
