---
name: them-tro-ly
description: Thêm một trợ lý AI có tên, vai và cách xưng hô riêng (ví dụ trợ lý marketing, tài chính, pháp lý) vào folder làm việc, để sau này chỉ cần gọi tên là AI vào đúng vai. Dùng khi người dùng nói "thêm trợ lý", "thêm agent", "tạo nhân vật AI", "tôi cần một người lo marketing", "add an assistant", "add an agent", "create a persona".
---

# them-tro-ly — Thêm một trợ lý có tên riêng

Kết quả: một file `tro-ly/<ten>.md` và một dòng mới trong bảng **Trợ lý** của `AGENTS.md`.

Chưa có `AGENTS.md` → mời chạy `bat-dau` trước, rồi quay lại.

## Bước 1 — Hỏi (gộp tối đa 2 lượt)

1. **Trợ lý lo việc gì?** Nếu người dùng chưa rõ, đưa vài vai trong `vai-mau.md` (cùng thư mục) làm gợi ý; họ có thể tự nghĩ vai khác.
2. **Tên gì?** Tự nghĩ 2–3 tên hợp vai và ngữ cảnh người dùng để gợi ý; luôn cho người dùng tự đặt. Không dùng danh sách tên cố định.
3. **Xưng hô thế nào?** Ngang hàng hay trên–dưới.
4. **Khi nào thì gọi trợ lý này?** Một câu.

Người dùng mô tả đủ ngay từ đầu ("thêm Mai lo marketing, xưng em") → không hỏi lại phần đã có.

## Bước 2 — Viết file

1. Tên file: tên trợ lý viết thường, không dấu, nối bằng gạch ngang (`Mai` → `tro-ly/mai.md`). Trùng tên → hỏi người dùng có muốn sửa trợ lý cũ không; không ghi đè khi chưa đồng ý.
2. Dựa vào `templates/tro-ly.template.md`. Viết phần chuyên môn và cách làm **cụ thể theo vai** (trợ lý tài chính: luôn nêu giả định của mô hình số, có ba kịch bản…), không viết chung chung. Dưới 80 dòng.
3. Thêm một hàng vào bảng **Trợ lý** trong `AGENTS.md`: `| Tên | Vai | Xưng hô | Gọi khi |`. Nếu bảng đang có dòng "(chưa có …)" thì thay dòng đó.

## Bước 3 — Báo

- Báo 2–3 dòng: đã tạo trợ lý nào, gọi thế nào ("Mai ơi, …").
- Mời thử ngay: gọi tên trợ lý với một việc nhỏ. Khi được gọi, đọc `tro-ly/<ten>.md` và giữ vai, giọng, cách xưng hô suốt phiên.
