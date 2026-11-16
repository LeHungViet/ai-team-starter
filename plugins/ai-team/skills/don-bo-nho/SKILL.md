---
name: don-bo-nho
description: Gom và dọn bộ nhớ của folder định kỳ — gộp bài học trùng, tóm tắt nhật ký cũ theo tháng, chuyển bản gốc vào archive (không xoá), sửa mục lục, và đề xuất bài học nào nên nâng thành luật trong AGENTS.md. Dùng khi người dùng nói "dọn bộ nhớ", "gom bộ nhớ", "tổng kết tháng", "consolidate memory", "clean up memory", hoặc khi luu-phien gợi ý vì nhật ký đã nhiều.
---

# don-bo-nho — Gom và dọn bộ nhớ

**Không xoá gì.** Đồ cũ chuyển vào `archive/`. **Không sửa `AGENTS.md`** khi người dùng chưa duyệt.

Chưa có `bo-nho/` → báo "Folder chưa có bộ nhớ", gợi ý `bat-dau` hoặc `luu-phien`, rồi dừng.

## Bước 1 — Xem hiện trạng

Đếm: số file nhật ký theo tháng, số dòng trong `bo-nho/bai-hoc.md` và từng `du-an/*/bai-hoc.md`, số dòng "Việc đang dở". Báo người dùng một dòng tổng quan trước khi làm.

## Bước 2 — Bài học

- Gộp dòng trùng ý thành một dòng (giữ ngày mới nhất).
- Hai dòng ngược nhau → hỏi người dùng giữ bên nào (một câu, liệt kê cả hai).
- Bài học thật ra chỉ thuộc một dự án → chuyển sang `du-an/<tên>/bai-hoc.md`.
- Bài học không còn đúng (dự án đã đóng, công cụ đã bỏ) → chuyển xuống mục `## Hết hiệu lực` cuối file, không xoá.

## Bước 3 — Nhật ký

Với mỗi tháng có nhật ký **cũ hơn 30 ngày**:
1. Viết `bo-nho/nhat-ky/YYYY-MM/TOM-TAT.md` (≤ 40 dòng): việc chính đã xong, quyết định quan trọng, bài học đã rút (link tới file bài học), việc còn treo.
2. Chuyển các file nhật ký gốc của tháng đó vào `archive/nhat-ky/YYYY-MM/`.
3. Giữ nguyên nhật ký 30 ngày gần nhất.

## Bước 4 — Mục lục và việc đang dở

- `bo-nho/BO-NHO.md`: bỏ việc đang dở đã xong (đối chiếu nhật ký), sửa link hỏng, cập nhật dòng "Lần dọn gần nhất: YYYY-MM-DD".

## Bước 5 — Đề xuất nâng thành luật

Bài học nào lặp lại nhiều lần **hoặc** đúng cho mọi việc → liệt kê tối đa 3 đề xuất: "Nâng thành luật trong AGENTS.md: <luật>". Chỉ ghi vào `AGENTS.md` khi người dùng duyệt từng dòng; trước khi ghi, chép `AGENTS.md` vào `archive/AGENTS-<YYYY-MM-DD>.md`, ghi vào điều phù hợp, giữ file dưới 200 dòng, rồi chuyển dòng bài học đó xuống "Hết hiệu lực" với ghi chú "đã nâng thành luật".

## Bước 6 — Báo

Mở đầu **HOÀN THÀNH —**. 3–5 dòng: bao nhiêu bài học gộp/chuyển, tháng nào đã tóm tắt, bao nhiêu file chuyển vào `archive/`, các đề xuất đang chờ duyệt.
