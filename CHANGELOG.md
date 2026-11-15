# Changelog

## 0.1.1 — 2026-11-16
- `sap-xep-thu-muc`: giữ nguyên tên file khi dọn; chỉ đổi tên khi trùng ở đích hoặc người dùng duyệt đề xuất đổi tên.
- README: cài trên Codex bằng dòng lệnh, tên skill có tiền tố `ai-team:`, hook Codex cần duyệt trước khi chạy.

## 0.1.0 — 2026-11-16
- Bản đầu tiên: skill `bat-dau` (dựng AGENTS.md + CLAUDE.md), `them-tro-ly`, `them-du-an`, `sap-xep-thu-muc`, `ghi-bai-hoc`, `kiem-tra`.
- Hook SessionStart mời setup một lần cho mỗi folder chưa có file luật (Claude; Codex desktop khi cài tay).
- Codex: `bat-dau` là onboarding skill, chạy ngay sau khi cài.
