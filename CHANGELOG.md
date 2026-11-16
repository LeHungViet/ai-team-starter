# Changelog

## 0.3.1 — 2026-11-16
- **Điều 7 — Máy, trình duyệt và việc chờ** / Article 7 — Computer, browser and follow-ups trong `AGENTS.md`: AI tự thao tác trên máy theo thứ tự kết nối của app → trình duyệt → computer use; dùng trình duyệt thật với hồ sơ đã đăng nhập để khỏi đăng nhập lại; không xin mật khẩu trong chat, chỉ nhờ người dùng đúng bước đăng nhập; tự đặt lịch kiểm lại việc dở, việc cần test thêm. `CLAUDE.md` có dòng áp Điều 7 cho Claude (Claude in Chrome, computer use, scheduled task). `bat-dau` / `setup` thêm Điều 7 khi nâng cấp folder cũ.
- **Gộp hồ sơ người dùng thành một file** `nguoi-dung.md` / `about-me.md` ở gốc folder (thay thư mục `nguoi-dung/` gồm `ve-toi.md` + `van-phong.md` / `about-me/` gồm `profile.md` + `voice.md`); giọng văn khi viết thay thành một mục trong file. Gốc folder giữ 4 file. `bat-dau` / `setup` gộp tự động khi nâng cấp folder bản 0.3.0, thư mục cũ vào `archive/`.
- README: mục **Thói quen nên có** / Routines (lưu phiên, ghi bài học khi AI làm sai hoặc làm tốt, dọn bộ nhớ hằng tuần, kiểm tra). `don-bo-nho` / `tidy-memory` nhận thêm "dream", "memory dream"; `luu-phien` gợi ý dọn khi đã ≥ 7 ngày và ≥ 5 phiên.
- Sơ đồ cấu trúc `docs/cau-truc.png` / `docs/structure.png` (kèm tên skill), gắn vào README.

## 0.3.0 — 2026-11-16
- **`START-HERE.md` — bản đồ folder** / folder map: cây thư mục, bảng "việc gì → đọc file nào", danh bạ trợ lý, bảng dự án (chuyển ra khỏi `AGENTS.md`). `CLAUDE.md` import `@AGENTS.md` + `@START-HERE.md`. Skill đổi cấu trúc tự cập nhật bản đồ.
- **Hồ sơ người dùng** `nguoi-dung/` (`ve-toi.md`, `van-phong.md`) / `about-me/` (`profile.md`, `voice.md`); `AGENTS.md` chỉ giữ 2 dòng tóm tắt.
- **Trợ lý theo format chuẩn**: mỗi trợ lý một thư mục `tro-ly/<tên>/` (`VAI.md` 9 mục, `bai-hoc.md`, `ket-qua/`) / `assistants/<name>/` (`ROLE.md`, `lessons.md`, `outputs/`). Trợ lý chính cũng có thư mục.
- **Kiến thức theo chủ đề** `bo-nho/chu-de/` / `memory/topics/`; `luu-phien` / `save-session` tách bài học và kiến thức.
- `kiem-tra` / `health-check`: bản đồ khớp cây thật, trợ lý đủ 9 mục, hiến pháp dưới 120 dòng. `bat-dau` / `setup` nâng cấp folder bản cũ.

## 0.2.2 — 2026-11-16
- Sửa: mô tả skill `ghi-bai-hoc` / `add-lesson` có dấu `<…>` khiến claude.ai bỏ qua skill khi đồng bộ. Mô tả skill không được chứa `<` hoặc `>`.

## 0.2.1 — 2026-11-16
- **Bản tiếng Anh `ai-team-en`** (English edition): cùng tính năng với bản tiếng Việt; skill `setup`, `add-assistant`, `add-project`, `organize-folder`, `save-session`, `add-lesson`, `tidy-memory`, `health-check`; thư mục `memory/`, `projects/`, `assistants/`, `docs/`. Cài **một trong hai** bản.
- Bản tiếng Việt `ai-team`: `sap-xep-thu-muc` thêm `bo-nho/` vào cấu trúc chuẩn; tên hiển thị trên Codex thành "AI Team Starter (Tiếng Việt)".

## 0.2.0 — 2026-11-16
- **Bộ nhớ riêng.** `AGENTS.md` thành hiến pháp: chỉ luật tổng quát, AI không tự sửa. Bài học và nhật ký chuyển sang `bo-nho/` (`BO-NHO.md`, `bai-hoc.md`, `nhat-ky/`) và `du-an/<tên>/bai-hoc.md`.
- Skill mới `luu-phien`: cuối mỗi việc ghi nhật ký phiên, bài học vào đúng chỗ, việc đang dở, trạng thái dự án.
- Skill mới `don-bo-nho`: gộp bài học trùng, tóm tắt nhật ký cũ theo tháng (bản gốc vào `archive/`), đề xuất bài học nâng thành luật.
- Hook `nhac-luu-phien.sh` (SessionStart + SessionEnd): phiên kết thúc mà chưa lưu → phiên sau nhắc lưu bù từ transcript, đúng một lần.
- `ghi-bai-hoc` ghi vào bộ nhớ, không vào `AGENTS.md`; `them-du-an` tạo thêm `bai-hoc.md`; `kiem-tra` kiểm thêm hiến pháp gọn và bộ nhớ có được lưu đều; `bat-dau` tạo `bo-nho/` và nâng cấp folder dựng bằng bản 0.1.

## 0.1.2 — 2026-11-16
- Hook: trên phiên cloud của app Claude (không có folder thật, không nhớ được "đã mời") chỉ nhắc AI mời khi phiên có folder người dùng chưa có file luật; không mời ở mọi chat mới nữa.

## 0.1.1 — 2026-11-16
- `sap-xep-thu-muc`: giữ nguyên tên file khi dọn; chỉ đổi tên khi trùng ở đích hoặc người dùng duyệt đề xuất đổi tên.
- README: cài trên Codex bằng dòng lệnh, tên skill có tiền tố `ai-team:`, hook Codex cần duyệt trước khi chạy.

## 0.1.0 — 2026-11-16
- Bản đầu tiên: skill `bat-dau` (dựng AGENTS.md + CLAUDE.md), `them-tro-ly`, `them-du-an`, `sap-xep-thu-muc`, `ghi-bai-hoc`, `kiem-tra`.
- Hook SessionStart mời setup một lần cho mỗi folder chưa có file luật (Claude; Codex desktop khi cài tay).
- Codex: `bat-dau` là onboarding skill, chạy ngay sau khi cài.
