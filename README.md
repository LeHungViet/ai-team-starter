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

Rồi cài **AI Team Starter** trong ứng dụng Codex — Codex chạy bước setup ngay sau khi cài. Cài bằng dòng lệnh cũng được: `codex plugin add ai-team@ai-team-starter`. Trên Codex, skill hiện với tên `ai-team:bat-dau`, `ai-team:them-tro-ly`…; hook mời setup chỉ chạy sau khi bạn duyệt (trust) hook của plugin.

## Cài xong thì sao

1. Mở folder chưa có `AGENTS.md`/`CLAUDE.md` → AI mời: *"Folder này chưa có file luật, dựng nhanh trong 2 phút nhé?"* Mỗi folder chỉ được mời một lần.
2. Đồng ý → AI hỏi tối đa 5 câu: gọi bạn là gì, bạn làm gì, muốn AI làm việc kiểu nào, ngôn ngữ, có đặt tên cho trợ lý chính không.
3. AI tạo:
   - **`AGENTS.md`** — hiến pháp: luật tổng quát duy nhất (Codex và Claude đều đọc). AI không tự sửa file này.
   - **`CLAUDE.md`** — chỉ có dòng `@AGENTS.md` và vài dòng riêng của Claude. Sửa luật ở `AGENTS.md` là cả hai cùng thấy.
   - **`bo-nho/`** — bộ nhớ: bài học, nhật ký từng phiên, việc đang dở. Cuối mỗi việc AI chạy `luu-phien` để ghi vào đây.
4. Từ chối cũng được; lúc nào cần thì gõ `/bat-dau`.

Không thấy lời mời (ví dụ trên Windows, hoặc nền tảng chưa chạy hook)? Gõ `/bat-dau` (Claude) hoặc `$ai-team:bat-dau` (Codex), hoặc nói "dựng file luật cho folder này".

## Các skill

| Skill | Làm gì |
|---|---|
| `bat-dau` | Dựng (hoặc cập nhật) `AGENTS.md` + `CLAUDE.md`. **Bắt buộc, chạy đầu tiên.** |
| `them-tro-ly` | Thêm trợ lý có tên, vai, cách xưng hô riêng (marketing, tài chính, pháp lý…). Gọi tên là AI vào vai. |
| `them-du-an` | Tạo dự án với `BRIEF.md`; dự án có code thì kèm khối **NGUỒN SỰ THẬT**. |
| `sap-xep-thu-muc` | Dựng hoặc dọn cấu trúc thư mục. Đề xuất trước, chỉ chuyển khi bạn đồng ý, **không bao giờ xoá**. |
| `luu-phien` | Lưu phiên: nhật ký, bài học (chung / dự án / trợ lý), việc đang dở. AI tự chạy cuối mỗi việc; hook nhắc lưu bù phiên bị quên. |
| `ghi-bai-hoc` | Ghi ngay một bài học rút từ sai lầm vào bộ nhớ (không vào `AGENTS.md`). |
| `don-bo-nho` | Gộp bài học trùng, tóm tắt nhật ký cũ theo tháng, đề xuất bài học nào nên nâng thành luật. Không xoá. |
| `kiem-tra` | Rà xem folder có đang chạy đúng luật không. Chỉ đọc. |

## Cấu trúc sau khi dùng đủ

```
folder-cua-ban/
├── AGENTS.md          ← hiến pháp: luật tổng quát (bản duy nhất)
├── CLAUDE.md          ← @AGENTS.md
├── bo-nho/
│   ├── BO-NHO.md      ← mục lục + việc đang dở
│   ├── bai-hoc.md     ← bài học chung
│   └── nhat-ky/       ← mỗi phiên một file
├── tro-ly/mai.md      ← mỗi trợ lý một file
├── du-an/<ten>/
│   ├── BRIEF.md       ← mục tiêu, trạng thái, NGUỒN SỰ THẬT
│   └── bai-hoc.md     ← bài học riêng dự án
├── tai-lieu/
└── archive/           ← thứ đã dọn; không xoá gì
```

## Vì sao làm như vậy

- **Một file luật, hai nền tảng.** Claude Code đọc được `AGENTS.md`; `CLAUDE.md` chỉ cần import nó. Không phải giữ hai bản luật rồi để chúng lệch nhau.
- **Hiến pháp tách khỏi bộ nhớ.** `AGENTS.md` chỉ giữ luật tổng quát, ngắn, ít đổi — AI không tự sửa. Bài học và nhật ký nằm trong `bo-nho/` và `bai-hoc.md` của từng dự án; bài học lặp lại nhiều lần mới được đề xuất nâng thành luật.
- **Bộ nhớ riêng, không phó mặc memory có sẵn.** Memory của Claude/Codex không chia sẻ giữa hai nền tảng, có thể bỏ sót, và phiên sau vẫn lặp lỗi. Nên cuối mỗi việc AI chạy `luu-phien`; phiên nào kết thúc mà quên lưu thì hook nhắc lưu bù ở phiên sau (Claude Code, Codex sau khi duyệt hook).
- **Nguồn sự thật nằm ngay trong BRIEF.** Với dự án có code, đầu BRIEF ghi code ở đâu, bản đang chạy ở đâu, deploy thế nào. Đổi thì sửa ngay trong BRIEF, không để ghi chú rời bên cạnh — một ghi chú rời khiến AI đọc đúng chỗ mà vẫn làm sai.
- **Chỉ hỏi khi đáng hỏi.** Luật mặc định: AI tự làm, chỉ hỏi trước khi chi tiền, gửi ra ngoài, hoặc làm việc không đảo ngược được.

## An toàn

- Không skill nào xoá file. Dọn = chuyển vào `archive/`.
- Không ghi đè file luật có sẵn khi bạn chưa đồng ý; bản cũ được chép vào `archive/` trước khi sửa.
- Hook chỉ đọc folder và chỉ in lời nhắc; nó không ghi gì vào folder của bạn (dấu "đã mời", giờ bắt đầu phiên, dấu "chưa lưu" nằm trong thư mục dữ liệu của plugin).

---

## English summary

**AI Team Starter** sets up a personal AI team in your working folder, for Claude (Claude Code, Claude desktop) and Codex. Right after install, the agent offers a short onboarding (up to 5 questions) and writes a single rules file, `AGENTS.md`, plus a `CLAUDE.md` that just imports it — so Claude and Codex share one source of rules. Optional skills: `them-tro-ly` (add a named assistant/persona), `them-du-an` (create a project with a source-of-truth brief), `sap-xep-thu-muc` (organize folders, never deletes), `ghi-bai-hoc` (record a rule that must always hold), `kiem-tra` (read-only health check). Skill names are Vietnamese; skills understand English requests too. `AGENTS.md` is kept as a short constitution the agent never edits on its own; lessons and session logs live in a `bo-nho/` memory folder. `luu-phien` saves each session (log, lessons, open items), a SessionStart/SessionEnd hook catches sessions that ended unsaved, and `don-bo-nho` consolidates periodically.

## License

MIT
