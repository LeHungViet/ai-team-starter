---
name: them-tro-ly
description: Thêm một trợ lý AI có tên, vai và cách xưng hô riêng (ví dụ trợ lý marketing, tài chính, pháp lý) vào folder làm việc, theo format chuẩn — mỗi trợ lý một thư mục có VAI.md đủ 9 mục, bai-hoc.md và ket-qua — để sau này chỉ cần gọi tên là AI vào đúng vai. Dùng khi người dùng nói "thêm trợ lý", "thêm agent", "tạo nhân vật AI", "tôi cần một người lo marketing", "add an assistant", "add an agent", "create a persona".
---

# them-tro-ly — Thêm một trợ lý theo format chuẩn

Kết quả:

```
tro-ly/<thư-mục>/
├── VAI.md       ← định nghĩa vai, đủ 9 mục
├── bai-hoc.md   ← bài học riêng của trợ lý
└── ket-qua/     ← kết quả trợ lý làm ra
```

và một dòng mới trong **Danh bạ trợ lý** của `START-HERE.md`, nhánh mới trong cây thư mục ở đó.

Chưa có `AGENTS.md` / `START-HERE.md` → mời chạy `bat-dau` trước, rồi quay lại.

## Bước 1 — Hỏi (gộp tối đa 2 lượt, bỏ câu đã biết)

1. **Trợ lý lo việc gì?** Chưa rõ → đưa vài vai trong `vai-mau.md` (cùng thư mục) làm gợi ý; người dùng có thể tự nghĩ vai khác.
2. **Tên gì?** Tự nghĩ 2–3 tên hợp vai và ngữ cảnh để gợi ý; luôn cho người dùng tự đặt.
3. **Xưng hô thế nào?** Ngang hàng hay trên–dưới.
4. **Khi nào gọi, báo cáo cho ai?** Một câu (mặc định báo cáo cho người dùng; có trợ lý chính thì có thể báo cáo qua trợ lý chính).

## Bước 2 — Viết thư mục trợ lý

1. Tên thư mục: tên trợ lý viết thường, không dấu, nối gạch ngang (`Mai` → `tro-ly/mai/`). Trùng → hỏi có muốn sửa trợ lý cũ không; không ghi đè khi chưa đồng ý.
2. `VAI.md` từ `templates/VAI.template.md`. **Đủ 9 mục, đúng thứ tự, đúng tên mục**: Danh tính · Gọi khi · Tính cách · Chuyên môn · Cách làm việc · Giao tiếp · Không làm · Nguyên tắc riêng · Kết quả để ở đâu.
   - Viết **cụ thể theo vai**, không chung chung. Ví dụ trợ lý tài chính: "luôn nêu giả định của mô hình số", "đưa ba kịch bản tốt / vừa / xấu", "Không làm: không tư vấn đầu tư cá nhân".
   - Mục chưa đủ thông tin → tự đề xuất nội dung hợp vai và nói rõ với người dùng là đề xuất; không để trống.
   - Dưới 100 dòng.
3. `bai-hoc.md` từ `templates/bai-hoc.template.md`; tạo thư mục `ket-qua/` (đặt `.gitkeep`).
4. `START-HERE.md`: thêm một hàng vào **Danh bạ trợ lý** `| Tên | Vai | Xưng hô | Gọi khi | tro-ly/<thư-mục>/ |` (thay dòng "(chưa có …)" nếu có), và cập nhật cây thư mục cho khớp.

## Bước 3 — Kiểm rồi báo

- Đọc lại `VAI.md`: đủ 9 mục, không còn `{{`.
- Báo 2–3 dòng: đã tạo trợ lý nào, gọi thế nào ("Mai ơi, …"), kết quả sẽ nằm ở đâu.
- Mời thử ngay một việc nhỏ. Khi được gọi: đọc `VAI.md` + `bai-hoc.md`, giữ vai, giọng, xưng hô suốt phiên.
