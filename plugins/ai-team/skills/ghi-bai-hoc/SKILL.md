---
name: ghi-bai-hoc
description: Ghi một bài học hoặc luật phải luôn đúng (thường rút ra từ một sai lầm) vào đúng chỗ — AGENTS.md nếu dùng chung, BRIEF.md nếu thuộc một dự án — để mọi phiên sau, kể cả trên Claude lẫn Codex, đều làm theo. Dùng khi người dùng nói "ghi lại bài học", "nhớ luật này", "lần sau đừng làm vậy nữa", "ghi vào luật", "remember this rule", "add a lesson".
---

# ghi-bai-hoc — Ghi luật phải luôn đúng

Memory có sẵn của Claude/Codex nhớ chuyện thường ngày, nhưng nó **không chia sẻ** giữa Claude và Codex, giữa các máy, và **không đảm bảo** luôn được nạp. Luật nào phải luôn đúng thì ghi vào file.

## Bước 1 — Xác định luật

- Rút thành **một dòng**: hành vi cụ thể, kiểm được. Tốt: "Không deploy sau 16h thứ Sáu." Chưa tốt: "Cẩn thận khi deploy."
- Kèm **vì sao**: một vế ngắn (sự cố gì, ngày nào).
- Không rõ luật là gì → hỏi lại đúng một câu.

## Bước 2 — Chọn chỗ ghi

| Luật áp dụng cho | Ghi vào |
|---|---|
| Mọi việc trong folder | `AGENTS.md`, mục **Bài học** |
| Một dự án | `du-an/<ten>/BRIEF.md`, mục **Bài học của dự án** (hoặc **Bẫy đã biết** nếu là bẫy kỹ thuật) |
| Một trợ lý | `tro-ly/<ten>.md`, mục **Nguyên tắc riêng** |

Định dạng mỗi dòng: `- <luật> — <vì sao> — <YYYY-MM-DD>`

## Bước 3 — Giữ file gọn

- Có luật cũ trùng hoặc mâu thuẫn → sửa luật cũ thay vì thêm dòng mới; mâu thuẫn thì hỏi người dùng giữ bên nào.
- `AGENTS.md` sẽ vượt 200 dòng → đề xuất gộp các luật gần nhau hoặc chuyển phần thuộc dự án sang BRIEF, rồi mới thêm.
- Xoá dòng mục "(Chưa có …)" khi thêm bài học đầu tiên.

## Bước 4 — Báo

Một dòng: đã ghi luật gì, vào file nào.
