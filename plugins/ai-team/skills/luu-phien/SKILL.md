---
name: luu-phien
description: Lưu phiên làm việc vào bộ nhớ của folder — ghi nhật ký phiên, rút bài học vào đúng chỗ (chung / dự án / trợ lý), kiến thức vào chủ đề, điều mới về người dùng vào hồ sơ, cập nhật việc đang dở và trạng thái dự án — để phiên sau trên Claude hay Codex không phải hỏi lại và không lặp lỗi. Dùng cuối mỗi việc có kết quả, khi người dùng nói "lưu", "lưu lại", "kết phiên", "save", "wrap up", "end session", hoặc khi hook nhắc có phiên trước chưa lưu.
---

# luu-phien — Lưu phiên vào bộ nhớ

Bộ nhớ của folder: `bo-nho/`, `du-an/<tên>/bai-hoc.md`, `tro-ly/<tên>/bai-hoc.md`, `nguoi-dung/` (xem Điều 6 trong `AGENTS.md`, bản đồ trong `START-HERE.md`). Skill này **không sửa `AGENTS.md`**.

Chưa có `bo-nho/` → tạo `bo-nho/BO-NHO.md`, `bo-nho/bai-hoc.md`, `bo-nho/chu-de/`, `bo-nho/nhat-ky/` theo mẫu trong `../bat-dau/templates/bo-nho/`, rồi làm tiếp.

## Bước 0 — Lưu phiên nào

- **Phiên hiện tại** (mặc định): dùng chính cuộc trò chuyện này.
- **Phiên trước, hook nhắc** (có đường dẫn transcript): đọc file transcript đó (JSONL — mỗi dòng một sự kiện; chỉ cần lời người dùng, câu trả lời cuối và tên file đã sửa). Ghi ngày giờ của phiên đó, không phải hôm nay. Transcript không đọc được → báo một dòng, không bịa.

## Bước 1 — Có gì đáng nhớ không

Đáng nhớ: việc đã làm xong hoặc dở dang, quyết định của người dùng, file/dự án đã đổi, lỗi đã gặp và cách sửa, điều người dùng sửa lưng AI, sở thích làm việc mới nói ra.

Không có gì (chỉ hỏi đáp vặt, tra cứu một lần) → **không tạo file**, báo "Phiên này không có gì cần lưu." rồi dừng.

## Bước 2 — Viết nhật ký phiên

File mới, mỗi phiên một file (hai phiên chạy song song không ghi đè nhau):
`bo-nho/nhat-ky/YYYY-MM/YYYY-MM-DD-HHMM-<chu-de>.md` — `<chu-de>` viết thường, không dấu, gạch ngang, ≤ 5 từ.

Tối đa ~25 dòng:

```
# <Chủ đề> — YYYY-MM-DD HH:MM
Dự án: <tên hoặc "chung"> · Trợ lý: <tên nếu có>

## Đã làm
- …
## Quyết định (của người dùng)
- …
## Còn dở / bước tiếp
- …
## Bài học (đã ghi vào: <file>)
- …
## Kiến thức / hồ sơ (đã ghi vào: <file>)
- …
## File đã đổi
- …
```

Chỉ ghi điều có thật trong phiên. Quyết định phải là của người dùng — đề xuất của AI mà người dùng chưa chốt thì ghi ở "Còn dở".

## Bước 3 — Bài học vào đúng chỗ

Một bài học = **một dòng cụ thể, kiểm được**, kèm vì sao và ngày: `- <luật> — <vì sao> — <YYYY-MM-DD>`.

| Bài học đúng cho | Ghi vào |
|---|---|
| Mọi việc trong folder | `bo-nho/bai-hoc.md` |
| Một dự án | `du-an/<tên>/bai-hoc.md` (chưa có thì tạo) |
| Một trợ lý | `tro-ly/<tên>/bai-hoc.md` |

- Đọc file đích trước. Trùng → sửa dòng cũ (gộp ý, cập nhật ngày). Mâu thuẫn → hỏi người dùng giữ bên nào.
- Ưu tiên bài học từ **lỗi thật** và **lời người dùng sửa lưng**. Không ghi suy đoán.
- Bài học đúng cho mọi việc và đã lặp lại ≥ 2 lần → thêm một dòng đề xuất ở báo cáo: "Nên nâng thành luật trong AGENTS.md?" — không tự ghi vào `AGENTS.md`.

## Bước 3b — Kiến thức và hồ sơ (khác bài học)

- **Kiến thức dùng lại** (cách làm đã chứng minh chạy được, quy trình, thuật ngữ, thông số hay tra) → `bo-nho/chu-de/<chủ-đề>.md`, mỗi chủ đề một file, tên viết thường không dấu. Đã có file chủ đề → thêm vào đúng mục, không tạo file trùng. File mới → thêm một dòng vào mục lục `chu-de/` trong `BO-NHO.md`.
- **Điều người dùng nói rõ về mình** (vai trò mới, mục tiêu, người hay làm việc cùng) → `nguoi-dung/ve-toi.md`. **Người dùng sửa giọng văn khi viết thay** → `nguoi-dung/van-phong.md` (ghi đúng lời họ, kèm ví dụ nếu có). Không ghi suy đoán.

Bài học = luật rút từ sai lầm ("không làm X vì Y"). Kiến thức = cách làm / sự thật dùng lại. Không lẫn hai loại.

## Bước 4 — Cập nhật trạng thái

- `bo-nho/BO-NHO.md`, mục "Việc đang dở": thêm việc còn dở của phiên (một dòng, kèm link tới file nhật ký); xoá việc đã xong. Giữ mục này ≤ 10 dòng.
- Dự án đổi trạng thái → sửa dòng trạng thái trong `du-an/<tên>/BRIEF.md` và hàng tương ứng trong bảng **Dự án** của `START-HERE.md` (cột Trạng thái + Cập nhật).
- Phiên có tạo thư mục mới ở gốc hoặc đổi cấu trúc mà không qua skill → cập nhật cây thư mục trong `START-HERE.md`.

## Bước 5 — Báo

2–4 dòng: file nhật ký nào, bao nhiêu bài học vào file nào, việc đang dở. Nếu `bo-nho/nhat-ky/` đã có hơn 15 file kể từ lần dọn gần nhất (ghi trong `BO-NHO.md`) → gợi ý chạy `don-bo-nho`.
