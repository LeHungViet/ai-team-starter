#!/bin/sh
# AI Team Starter — nhắc lưu phiên.
#   nhac-luu-phien.sh start  (SessionStart): ghi giờ bắt đầu phiên; nếu folder có phiên trước
#                            kết thúc mà chưa lưu → chèn nhắc chạy luu-phien (mỗi phiên chỉ nhắc một lần).
#   nhac-luu-phien.sh end    (SessionEnd):   phiên không ghi nhật ký nào vào bo-nho/nhat-ky/ → đánh dấu "chưa lưu".
# Chỉ chạy với folder đã có bo-nho/. Không ghi gì vào folder người dùng; dữ liệu nằm trong thư mục data của plugin.
# Phải xong nhanh (SessionEnd chỉ có ~1,5 giây).

MODE="${1:-start}"
INPUT=$(cat 2>/dev/null || true)

# Phiên cloud: mỗi phiên là máy mới, dấu không giữ được → bỏ qua (dựa vào Điều 6 của AGENTS.md).
[ "${CLAUDE_CODE_REMOTE:-}" = "true" ] && exit 0

field() {
  printf '%s' "$INPUT" | sed -n "s/.*\"$1\"[[:space:]]*:[[:space:]]*\"\([^\"]*\)\".*/\1/p" | head -n 1
}

DIR=$(field cwd)
[ -n "$DIR" ] || DIR="${CLAUDE_PROJECT_DIR:-$PWD}"
[ -d "$DIR/bo-nho" ] || exit 0

SID=$(field session_id)
[ -n "$SID" ] || exit 0
TP=$(field transcript_path)

DATA="${CLAUDE_PLUGIN_DATA:-${PLUGIN_DATA:-$HOME/.ai-team-starter}}"
KEY=$(printf '%s' "$DIR" | cksum | cut -d ' ' -f 1)
PHIEN="$DATA/phien"
CHUA="$DATA/chua-luu/$KEY"
mkdir -p "$PHIEN" "$CHUA" 2>/dev/null || exit 0

emit() {
  ESC=$(printf '%s' "$1" | sed 's/\\/\\\\/g; s/"/\\"/g')
  printf '{"hookSpecificOutput":{"hookEventName":"SessionStart","additionalContext":"%s"}}\n' "$ESC"
}

case "$MODE" in
start)
  # Ghi giờ bắt đầu (giữ mốc đầu tiên nếu phiên được mở lại).
  [ -f "$PHIEN/$SID" ] || printf '%s\n' "$DIR" > "$PHIEN/$SID" 2>/dev/null
  # Phiên này được mở lại → bỏ dấu "chưa lưu" của chính nó; cuối phiên sẽ xét lại.
  rm -f "$CHUA/$SID" 2>/dev/null

  LIST=""
  N=0
  for M in $(ls -t "$CHUA" 2>/dev/null); do
    F="$CHUA/$M"
    [ -f "$F" ] || continue
    N=$((N + 1))
    if [ "$N" -le 3 ]; then
      LINE=$(head -n 1 "$F")
      WHEN=${LINE%%|*}
      PATHT=${LINE#*|}
      LIST="$LIST ($N) phiên kết thúc lúc $WHEN — transcript: $PATHT;"
    fi
    rm -f "$F" 2>/dev/null   # nhắc một lần rồi thôi
  done
  [ "$N" -gt 0 ] || exit 0
  EXTRA=""
  [ "$N" -gt 3 ] && EXTRA=" Còn $((N - 3)) phiên cũ hơn không liệt kê."
  emit "[AI Team Starter] Folder này có $N phiên trước kết thúc mà chưa lưu vào bộ nhớ:$LIST$EXTRA Trước khi làm việc mới: báo người dùng một câu ngắn, rồi chạy skill luu-phien cho từng phiên trên (đọc file transcript; ghi theo ngày giờ của phiên đó). Người dùng bảo bỏ qua thì thôi, không nhắc lại."
  ;;
end)
  START="$PHIEN/$SID"
  [ -f "$START" ] || exit 0
  # Đã lưu? Có file nhật ký nào mới hơn mốc bắt đầu phiên.
  if [ -n "$(find "$DIR/bo-nho/nhat-ky" -type f -newer "$START" 2>/dev/null | head -n 1)" ]; then
    rm -f "$START"
    exit 0
  fi
  # Phiên quá ngắn (vài dòng) thì không đáng nhắc.
  LINES=0
  if [ -n "$TP" ] && [ -f "$TP" ]; then
    LINES=$(wc -l < "$TP" 2>/dev/null | tr -d ' ')
  fi
  if [ "${LINES:-0}" -ge 6 ]; then
    printf '%s|%s\n' "$(date '+%Y-%m-%d %H:%M')" "$TP" > "$CHUA/$SID" 2>/dev/null
  fi
  rm -f "$START"
  ;;
esac
exit 0
