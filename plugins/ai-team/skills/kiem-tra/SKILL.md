---
name: kiem-tra
description: Rà folder làm việc xem có đang chạy đúng luật trong AGENTS.md không — file luật quá dài hay mâu thuẫn, CLAUDE.md còn import AGENTS.md không, dự án có code mà thiếu NGUỒN SỰ THẬT, file nằm sai chỗ, trợ lý thiếu file. Chỉ đọc, không tự sửa. Dùng khi người dùng nói "kiểm tra", "rà soát", "audit", "folder có ổn không", "check my setup", "health check".
---

# kiem-tra — Rà xem folder có đúng luật

**Chỉ đọc.** Không sửa, không di chuyển, không xoá gì. Cuối cùng đề xuất cách sửa và hỏi người dùng có muốn làm không.

## Kiểm những gì

| # | Kiểm | Cách kiểm |
|---|---|---|
| 1 | Có file luật | `AGENTS.md` tồn tại. Không có → dừng, mời chạy `bat-dau`. |
| 2 | `CLAUDE.md` import `AGENTS.md` | `CLAUDE.md` có dòng `@AGENTS.md`. Có `CLAUDE.md` chép lại nội dung luật thay vì import → báo "hai bản luật sẽ lệch nhau". |
| 3 | Độ dài | `AGENTS.md` dưới 200 dòng. |
| 4 | Chỗ giữ chỗ còn sót | Không còn `{{` hay `[TÊN` trong file luật, BRIEF, file trợ lý. |
| 5 | Luật mâu thuẫn | Đọc các điều và bài học; chỉ ra cặp nào nói ngược nhau. |
| 6 | Trợ lý | Mỗi hàng trong bảng **Trợ lý** có file `tro-ly/<ten>.md` (trừ hàng có vai "Trợ lý chính" — định nghĩa ngay trong `AGENTS.md`); mỗi file trong `tro-ly/` có hàng trong bảng. |
| 7 | Dự án | Mỗi hàng trong bảng **Dự án** có `BRIEF.md`. Dự án có code (có `package.json`, `.git`, `requirements.txt`, `Dockerfile`… hoặc BRIEF nhắc tới repo) mà thiếu khối NGUỒN SỰ THẬT → báo. Ngày xác minh quá 90 ngày → nhắc. |
| 8 | Gốc folder sạch | Gốc chỉ có file luật và các thư mục trong mục **Thư mục** của `AGENTS.md`; liệt kê thứ nằm ngoài. Thư mục được nhắc mà chưa tạo thì không phải lỗi (tạo khi cần). |
| 9 | Ghi chú cạnh BRIEF | Trong thư mục dự án có file kiểu "ĐỌC-TRƯỚC", "SUPERSEDED", "NOTE-moved" nói nguồn đã đổi mà BRIEF không đổi → báo mức cao. |

## Báo cáo

Mở đầu bằng **HOÀN THÀNH —** (đã kiểm hết) hoặc **CHƯA HOÀN THÀNH —** (có mục không kiểm được, nói vì sao).

Bảng: `| Luật | Mức (✅ / ⚠️ / ❌) | Bằng chứng (file, dòng, số liệu) |`. Chỉ ghi điều đã thấy tận mắt; không đoán.

Cuối: tối đa 3 việc nên sửa trước, mỗi việc một dòng, kèm skill phù hợp (`sap-xep-thu-muc`, `them-du-an`, `ghi-bai-hoc`, `bat-dau`). Hỏi người dùng có muốn sửa không.
