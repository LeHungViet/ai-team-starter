---
name: kiem-tra
description: Rà folder làm việc xem có đang chạy đúng luật và đúng bản đồ không — AGENTS.md quá dài hay lẫn bảng/bài học, CLAUDE.md còn import AGENTS.md và START-HERE.md không, START-HERE có khớp cây thư mục thật không, trợ lý có đủ format 9 mục không, dự án có code mà thiếu NGUỒN SỰ THẬT, bộ nhớ có được lưu đều không, file nằm sai chỗ. Chỉ đọc, không tự sửa. Dùng khi người dùng nói "kiểm tra", "rà soát", "audit", "folder có ổn không", "check my setup", "health check".
---

# kiem-tra — Rà xem folder có đúng luật và đúng bản đồ

**Chỉ đọc.** Không sửa, không di chuyển, không xoá gì. Cuối cùng đề xuất cách sửa và hỏi người dùng có muốn làm không.

## Kiểm những gì

| # | Kiểm | Cách kiểm |
|---|---|---|
| 1 | Có bộ khung | Có `AGENTS.md` và `START-HERE.md`. Thiếu → dừng, mời chạy `bat-dau` (nâng cấp nếu là folder bản cũ). |
| 2 | `CLAUDE.md` import đúng | `CLAUDE.md` có `@AGENTS.md` và `@START-HERE.md`. `CLAUDE.md` chép lại nội dung luật thay vì import → báo "hai bản luật sẽ lệch nhau". |
| 3 | Hiến pháp gọn | `AGENTS.md` dưới 120 dòng; không chứa bảng trợ lý/dự án, hồ sơ chi tiết, bài học hay nhật ký (những thứ đó thuộc `START-HERE.md`, `nguoi-dung.md`, `bo-nho/`). |
| 4 | Chỗ giữ chỗ còn sót | Không còn `{{` hay `[TÊN` trong mọi file `.md` của bộ khung. |
| 5 | Luật mâu thuẫn | Đọc các điều và bài học; chỉ ra cặp nào nói ngược nhau. |
| 6 | Bản đồ khớp thật | Mọi nhánh trong cây của `START-HERE.md` tồn tại; mọi thư mục ở gốc folder có trong cây (bỏ qua `.git`, `.claude`, `.codex`, `node_modules`…). Liệt kê chỗ lệch. |
| 7 | Trợ lý | Mỗi hàng trong **Danh bạ trợ lý** có thư mục `tro-ly/<tên>/` với `VAI.md`, `bai-hoc.md`, `ket-qua/`; mỗi thư mục trong `tro-ly/` có hàng trong danh bạ. Còn file kiểu cũ `tro-ly/<tên>.md` → đề xuất nâng cấp bằng `bat-dau`. |
| 8 | Format trợ lý | Mỗi `VAI.md` có đủ 9 mục đúng tên: Danh tính · Gọi khi · Tính cách · Chuyên môn · Cách làm việc · Giao tiếp · Không làm · Nguyên tắc riêng · Kết quả để ở đâu. Liệt kê mục thiếu theo từng trợ lý. |
| 9 | Dự án | Mỗi hàng trong bảng **Dự án** có `BRIEF.md` và `bai-hoc.md`. Dự án có code (`package.json`, `.git`, `requirements.txt`, `Dockerfile`… hoặc BRIEF nhắc tới repo) mà thiếu khối NGUỒN SỰ THẬT → báo. Ngày xác minh quá 90 ngày → nhắc. Trong thư mục dự án có file kiểu "ĐỌC-TRƯỚC", "SUPERSEDED", "NOTE-moved" nói nguồn đã đổi mà BRIEF không đổi → báo mức cao. |
| 10 | Hồ sơ người dùng | Có `nguoi-dung.md`, gồm cả mục "Giọng văn khi viết thay". |
| 11 | Bộ nhớ | Có `bo-nho/BO-NHO.md`, `bo-nho/bai-hoc.md`, `bo-nho/chu-de/`, `bo-nho/nhat-ky/`. Nhật ký mới nhất cũ hơn 14 ngày trong khi folder vẫn có file mới sửa → báo "có thể đang không lưu phiên". Hơn 15 nhật ký từ lần dọn gần nhất → gợi ý `don-bo-nho`. File trong `chu-de/` không có trong mục lục `BO-NHO.md` → báo. |
| 12 | Gốc folder sạch | Gốc chỉ có `AGENTS.md`, `CLAUDE.md`, `START-HERE.md`, `nguoi-dung.md` và các thư mục trong cây; liệt kê file lạc ở gốc. |

## Báo cáo

Mở đầu bằng **HOÀN THÀNH —** (đã kiểm hết) hoặc **CHƯA HOÀN THÀNH —** (có mục không kiểm được, nói vì sao).

Bảng: `| # | Kiểm | Mức (✅ / ⚠️ / ❌) | Bằng chứng (file, dòng, số liệu) |`. Chỉ ghi điều đã thấy tận mắt; không đoán.

Cuối: tối đa 3 việc nên sửa trước, mỗi việc một dòng, kèm skill phù hợp (`bat-dau`, `sap-xep-thu-muc`, `them-tro-ly`, `them-du-an`, `ghi-bai-hoc`, `luu-phien`, `don-bo-nho`). Hỏi người dùng có muốn sửa không.
