# AI Team Starter

Dựng **đội AI riêng** trong folder làm việc của bạn — chạy được trên **Claude** (Claude Code, Claude desktop) và **Codex**.

Cài xong, AI tự mời bạn trả lời vài câu (tối đa 5), rồi viết sẵn file luật **`AGENTS.md`** cho folder. Từ đó, mỗi phiên AI đều biết bạn là ai, làm việc theo cách nào, việc gì phải hỏi trước. Các thứ khác — trợ lý có tên riêng, dự án, sắp xếp thư mục — bạn gọi thêm khi cần.

*English summary at the end.*

---

## Cài đặt

> Thay `LeHungViet` bằng tài khoản GitHub chứa repo này.

**Claude Code**

```
/plugin marketplace add LeHungViet/ai-team-starter
/plugin install ai-team@ai-team-starter
```

Mở phiên mới trong folder bạn muốn dùng.

**Claude desktop:** thêm marketplace `LeHungViet/ai-team-starter` trong phần quản lý plugin, cài plugin **ai-team**, rồi chọn folder làm việc.

**Codex**

```
codex plugin marketplace add LeHungViet/ai-team-starter
```

Rồi cài **AI Team Starter** trong ứng dụng Codex. Codex chạy bước setup ngay sau khi cài.

## Cài xong thì sao

1. Mở folder chưa có `AGENTS.md`/`CLAUDE.md` → AI mời: *"Folder này chưa có file luật, dựng nhanh trong 2 phút nhé?"* Mỗi folder chỉ được mời một lần.
2. Đồng ý → AI hỏi tối đa 5 câu: gọi bạn là gì, bạn làm gì, muốn AI làm việc kiểu nào, ngôn ngữ, có đặt tên cho trợ lý chính không.
3. AI tạo:
   - **`AGENTS.md`** — bản luật duy nhất (Codex và Claude đều đọc).
   - **`CLAUDE.md`** — chỉ có dòng `@AGENTS.md` và vài dòng riêng của Claude. Sửa luật ở `AGENTS.md` là cả hai cùng thấy.
4. Từ chối cũng được; lúc nào cần thì gõ `/bat-dau`.

Không thấy lời mời (ví dụ trên Windows, hoặc nền tảng chưa chạy hook)? Gõ `/bat-dau` (Claude) hoặc `$bat-dau` (Codex), hoặc nói "dựng file luật cho folder này".

## Các skill

| Skill | Làm gì |
|---|---|
| `bat-dau` | Dựng (hoặc cập nhật) `AGENTS.md` + `CLAUDE.md`. **Bắt buộc, chạy đầu tiên.** |
| `them-tro-ly` | Thêm trợ lý có tên, vai, cách xưng hô riêng (marketing, tài chính, pháp lý…). Gọi tên là AI vào vai. |
| `them-du-an` | Tạo dự án với `BRIEF.md`; dự án có code thì kèm khối **NGUỒN SỰ THẬT**. |
| `sap-xep-thu-muc` | Dựng hoặc dọn cấu trúc thư mục. Đề xuất trước, chỉ chuyển khi bạn đồng ý, **không bao giờ xoá**. |
| `ghi-bai-hoc` | Ghi một luật phải luôn đúng (thường rút từ sai lầm) vào đúng file. |
| `kiem-tra` | Rà xem folder có đang chạy đúng luật không. Chỉ đọc. |

## Cấu trúc sau khi dùng đủ

```
folder-cua-ban/
├── AGENTS.md          ← luật (bản duy nhất)
├── CLAUDE.md          ← @AGENTS.md
├── tro-ly/mai.md      ← mỗi trợ lý một file
├── du-an/<ten>/BRIEF.md
├── tai-lieu/
└── archive/           ← thứ đã dọn; không xoá gì
```

## Vì sao làm như vậy

- **Một file luật, hai nền tảng.** Claude Code đọc được `AGENTS.md`; `CLAUDE.md` chỉ cần import nó. Không phải giữ hai bản luật rồi để chúng lệch nhau.
- **Không tự chế memory.** Claude và Codex đã tự ghi nhớ chuyện thường ngày. Nhưng memory đó không chia sẻ giữa hai nền tảng, giữa các máy, và không đảm bảo luôn được nạp. Vì vậy, **điều gì phải luôn đúng thì ghi vào file** (`AGENTS.md` hoặc `BRIEF.md`) — đó là việc của `ghi-bai-hoc`.
- **Nguồn sự thật nằm ngay trong BRIEF.** Với dự án có code, đầu BRIEF ghi code ở đâu, bản đang chạy ở đâu, deploy thế nào. Đổi thì sửa ngay trong BRIEF, không để ghi chú rời bên cạnh — một ghi chú rời khiến AI đọc đúng chỗ mà vẫn làm sai.
- **Chỉ hỏi khi đáng hỏi.** Luật mặc định: AI tự làm, chỉ hỏi trước khi chi tiền, gửi ra ngoài, hoặc làm việc không đảo ngược được.

## An toàn

- Không skill nào xoá file. Dọn = chuyển vào `archive/`.
- Không ghi đè file luật có sẵn khi bạn chưa đồng ý; bản cũ được chép vào `archive/` trước khi sửa.
- Hook chỉ đọc folder và chỉ in một lời nhắc; nó không ghi gì vào folder của bạn (dấu "đã mời" nằm trong thư mục dữ liệu của plugin).

---

## English summary

**AI Team Starter** sets up a personal AI team in your working folder, for Claude (Claude Code, Claude desktop) and Codex. Right after install, the agent offers a short onboarding (up to 5 questions) and writes a single rules file, `AGENTS.md`, plus a `CLAUDE.md` that just imports it — so Claude and Codex share one source of rules. Optional skills: `them-tro-ly` (add a named assistant/persona), `them-du-an` (create a project with a source-of-truth brief), `sap-xep-thu-muc` (organize folders, never deletes), `ghi-bai-hoc` (record a rule that must always hold), `kiem-tra` (read-only health check). Skill names are Vietnamese; skills understand English requests too. No custom memory system — it relies on the platforms' built-in memory and keeps must-always-hold rules in files.

## License

MIT
