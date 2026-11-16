---
name: them-du-an
description: Tạo một dự án mới trong folder làm việc với tài liệu gốc BRIEF.md; dự án có code hoặc app đang chạy thì kèm khối NGUỒN SỰ THẬT (code ở đâu, bản đang chạy ở đâu, deploy thế nào). Dùng khi người dùng nói "tạo dự án", "dự án mới", "bắt đầu project", "new project", "set up a project", hoặc khi bắt đầu một việc lớn chưa có thư mục riêng.
---

# them-du-an — Tạo một dự án

Kết quả: `du-an/<ten>/BRIEF.md`, `du-an/<ten>/bai-hoc.md` (bài học riêng của dự án) và một dòng mới trong bảng **Dự án** của `START-HERE.md` (kèm nhánh mới trong cây thư mục ở đó).

Chưa có `AGENTS.md` / `START-HERE.md` → mời chạy `bat-dau` trước.

## Bước 1 — Hỏi ngắn (tối đa 3 câu, bỏ câu đã biết)

1. Dự án tên gì, làm gì, cho ai?
2. Có code / app / web đang chạy không?
3. Nếu có: code chính nằm ở đâu (repo, thư mục), bản đang chạy ở đâu?

## Bước 2 — Tạo BRIEF

1. Thư mục: `du-an/<ten>/`, tên viết thường, không dấu, nối bằng gạch ngang. Đã có thì không ghi đè; đề xuất cập nhật BRIEF cũ.
2. Dựa vào `templates/BRIEF.template.md`.
3. **Dự án có code hoặc app:** khối NGUỒN SỰ THẬT ở đầu file là **bắt buộc**. Tự tìm trước (đọc thư mục, `git remote -v`, file cấu hình deploy) rồi mới hỏi. Dòng nào chưa xác minh được → ghi "chưa xác minh", không đoán, không bỏ trống. Ghi ngày xác minh.
4. **Dự án chỉ là tài liệu:** thay khối NGUỒN SỰ THẬT bằng một dòng: "Không có code — không áp dụng."
5. Tạo `du-an/<ten>/bai-hoc.md` từ `templates/bai-hoc.template.md`.
6. `START-HERE.md`: thêm một hàng vào bảng **Dự án** `| Tên | du-an/<ten>/ | Mới | YYYY-MM-DD |` (thay dòng "(chưa có …)" nếu có) và thêm nhánh `du-an/<ten>/` vào cây thư mục.

## Luật cần nhắc người dùng (một lần)

- Khi nguồn sự thật thay đổi (đổi repo, đổi nơi deploy) → **sửa ngay trong BRIEF**, không tạo file mới bên cạnh. Một file ghi chú nằm cạnh mà BRIEF không đổi sẽ khiến AI đọc đúng chỗ mà vẫn làm sai.
- Bài học riêng của dự án nằm trong `bai-hoc.md` của dự án; `luu-phien` và `ghi-bai-hoc` tự ghi vào đó. AI đọc file này mỗi khi làm việc với dự án.
- Mỗi lần mất nhiều thời gian vì một "bẫy" (lệnh deploy lấy nhầm nguồn, lệnh restart không restart thật…) → ghi vào mục "Bẫy đã biết".

## Bước 3 — Báo

2–3 dòng: đã tạo gì; dòng nào trong NGUỒN SỰ THẬT còn "chưa xác minh".
