---
name: ghi-bai-hoc
description: Ghi ngay một bài học (thường rút ra từ một sai lầm hoặc khi người dùng sửa lưng AI) vào bộ nhớ của folder — bo-nho/bai-hoc.md nếu dùng chung, bai-hoc.md của dự án nếu thuộc một dự án — để mọi phiên sau, trên Claude lẫn Codex, đều làm theo. Không ghi vào AGENTS.md trừ khi người dùng duyệt nâng thành luật. Dùng khi người dùng nói "ghi lại bài học", "nhớ luật này", "lần sau đừng làm vậy nữa", "remember this", "add a lesson".
---

# ghi-bai-hoc — Ghi một bài học vào bộ nhớ

`AGENTS.md` là hiến pháp: chỉ luật tổng quát, không sửa bừa. Bài học nằm trong bộ nhớ (Điều 6 của `AGENTS.md`). Memory có sẵn của Claude/Codex không chia sẻ giữa hai công cụ và không chắc được nạp — nên bài học phải nằm trong file.

## Bước 1 — Rút thành một dòng

- Hành vi cụ thể, kiểm được. Tốt: "Không deploy sau 16h thứ Sáu." Chưa tốt: "Cẩn thận khi deploy."
- Kèm **vì sao** (sự cố gì) và ngày.
- Không rõ luật là gì → hỏi lại đúng một câu.

Định dạng: `- <luật> — <vì sao> — <YYYY-MM-DD>`

## Bước 2 — Chọn chỗ ghi

| Bài học đúng cho | Ghi vào |
|---|---|
| Mọi việc trong folder | `bo-nho/bai-hoc.md` |
| Một dự án | `du-an/<tên>/bai-hoc.md` (chưa có thì tạo; bẫy kỹ thuật thì thêm vào "Bẫy đã biết" trong BRIEF) |
| Một trợ lý | `tro-ly/<tên>.md`, mục "Nguyên tắc riêng" |

Chưa có `bo-nho/` → tạo theo mẫu `../bat-dau/templates/bo-nho/`.

## Bước 3 — Giữ gọn

- Đọc file đích trước. Trùng → sửa dòng cũ. Mâu thuẫn → hỏi người dùng giữ bên nào.
- Xoá dòng "_(chưa có)_" khi thêm bài học đầu tiên.
- Người dùng muốn đây là **luật hiến pháp** (đúng cho mọi việc, phải luôn nằm trong `AGENTS.md`) → nhắc lại luật một dòng và hỏi duyệt. Được duyệt: chép `AGENTS.md` vào `archive/AGENTS-<YYYY-MM-DD>.md`, ghi vào điều phù hợp, giữ file dưới 200 dòng.

## Bước 4 — Báo

Một dòng: đã ghi luật gì, vào file nào.
