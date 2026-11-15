#!/bin/sh
# AI Team Starter — SessionStart hook.
# Nếu folder đang mở chưa có file luật (AGENTS.md / CLAUDE.md), nhắc AI mời người dùng
# chạy skill `bat-dau`. Mỗi folder chỉ mời MỘT lần. Hook không ghi gì vào folder người dùng:
# dấu "đã mời" nằm trong thư mục dữ liệu của plugin.
# Lỗi gì cũng thoát 0 và im lặng — hook không bao giờ được chặn phiên làm việc.

INPUT=$(cat 2>/dev/null || true)

emit() {
  ESC=$(printf '%s' "$1" | sed 's/\\/\\\\/g; s/"/\\"/g')
  printf '{"hookSpecificOutput":{"hookEventName":"SessionStart","additionalContext":"%s"}}\n' "$ESC"
}

# Phiên chạy trên cloud (app Claude): thư mục hiện tại là máy ảo, không phải folder của người dùng,
# và mỗi phiên là một máy mới nên không nhớ được "đã mời". Chỉ nhắc AI tự xét điều kiện.
if [ "${CLAUDE_CODE_REMOTE:-}" = "true" ]; then
  emit "[AI Team Starter] Chỉ khi phiên này làm việc trên một folder của người dùng (folder trên máy họ đã kết nối, hoặc repo) mà folder đó chưa có AGENTS.md / CLAUDE.md: ở câu trả lời đầu tiên, mời họ một câu ngắn dựng file luật tối thiểu bằng skill bat-dau (khoảng 2 phút, tối đa 5 câu hỏi). Nếu phiên không có folder nào của người dùng, folder đã có file luật, hoặc người dùng từng từ chối, thì không nhắc gì."
  exit 0
fi

# Thư mục đang làm việc: ưu tiên trường "cwd" trong JSON đầu vào, rồi biến môi trường, rồi $PWD.
DIR=$(printf '%s' "$INPUT" | sed -n 's/.*"cwd"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/p' | head -n 1)
[ -n "$DIR" ] || DIR="${CLAUDE_PROJECT_DIR:-$PWD}"
[ -d "$DIR" ] || exit 0

# Không mời ở thư mục home hoặc thư mục gốc.
case "$DIR" in
  "$HOME" | "$HOME/" | "/") exit 0 ;;
esac

# Đã có file luật → không làm gì.
for f in AGENTS.md CLAUDE.md .claude/CLAUDE.md CLAUDE.local.md; do
  [ -f "$DIR/$f" ] && exit 0
done

# Đã mời folder này rồi → không mời lại.
DATA="${CLAUDE_PLUGIN_DATA:-${PLUGIN_DATA:-$HOME/.ai-team-starter}}"
mkdir -p "$DATA/da-moi" 2>/dev/null || exit 0
KEY=$(printf '%s' "$DIR" | cksum | cut -d ' ' -f 1)
[ -f "$DATA/da-moi/$KEY" ] && exit 0
printf '%s\n' "$DIR" > "$DATA/da-moi/$KEY" 2>/dev/null || exit 0

MSG="[AI Team Starter] Folder này chưa có file luật (AGENTS.md / CLAUDE.md). Ở câu trả lời đầu tiên của phiên, trước hoặc cùng lúc trả lời yêu cầu của người dùng, hãy mời họ một câu ngắn: dựng file luật tối thiểu bằng skill bat-dau (khoảng 2 phút, hỏi tối đa 5 câu). Viết lời mời bằng ngôn ngữ người dùng đang dùng. Nếu họ đồng ý thì chạy skill bat-dau. Nếu họ từ chối hoặc bỏ qua thì không nhắc lại; chỉ nói họ có thể gõ /bat-dau khi cần. Lời mời này chỉ xuất hiện một lần cho folder này."

emit "$MSG"
exit 0
