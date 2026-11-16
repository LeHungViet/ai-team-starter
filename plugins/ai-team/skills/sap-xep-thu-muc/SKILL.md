---
name: sap-xep-thu-muc
description: Dựng cấu trúc thư mục gọn cho folder làm việc, hoặc dọn một folder đang lộn xộn — đề xuất trước, chỉ di chuyển khi người dùng đồng ý, không bao giờ xoá (dọn = chuyển vào archive/). Dùng khi người dùng nói "sắp xếp thư mục", "dọn folder", "tổ chức file", "folder lộn xộn quá", "organize my folder", "clean up files".
---

# sap-xep-thu-muc — Dựng hoặc dọn thư mục

## Cấu trúc chuẩn

```
<folder>/
├── AGENTS.md        ← hiến pháp (luật tổng quát)
├── CLAUDE.md        ← @AGENTS.md + @START-HERE.md
├── START-HERE.md    ← bản đồ folder: cây, việc gì đọc gì, danh bạ trợ lý, dự án
├── nguoi-dung.md    ← hồ sơ người dùng + giọng văn
├── bo-nho/          ← BO-NHO.md, bai-hoc.md, chu-de/, nhat-ky/
├── tro-ly/<tên>/    ← VAI.md, bai-hoc.md, ket-qua/
├── du-an/<tên>/     ← BRIEF.md, bai-hoc.md + mọi file của dự án
├── tai-lieu/        ← tài liệu dùng chung, không thuộc dự án nào
└── archive/         ← thứ đã dọn; không xoá gì
```

Người dùng đã có cấu trúc riêng đang chạy tốt → giữ cấu trúc đó, chỉ ghi lại luật cho rõ. Không ép đổi tên thư mục.

## Bước 1 — Xem và đề xuất (chưa di chuyển gì)

1. Liệt kê gốc folder và một tầng con. Bỏ qua thư mục hệ thống (`.git`, `.claude`, `.codex`, `node_modules`, `.venv`…) và mọi thứ có vẻ là mật khẩu hay khoá bí mật.
2. Lập bảng đề xuất: `| File/thư mục | Đang ở | Đề xuất chuyển tới | Lý do |`.
   - File rõ thuộc một dự án → `du-an/<ten>/`.
   - File tạm, bản cũ, bản trùng → `archive/`.
   - Không chắc → giữ nguyên, đánh dấu "hỏi người dùng".
3. Thư mục là một repo git (có `.git`) → **không** chuyển file bên trong repo; chỉ đề xuất ở mức thư mục.

## Bước 2 — Làm sau khi được đồng ý

1. Người dùng có thể đồng ý tất cả, một phần, hoặc sửa đề xuất.
2. Chỉ dùng thao tác **di chuyển**. Không xoá. **Giữ nguyên tên file**; chỉ đổi tên khi trùng tên ở đích (thêm hậu tố ngày, không ghi đè) hoặc khi người dùng đồng ý một đề xuất đổi tên cụ thể đã nằm trong bảng ở Bước 1.
3. Đếm số file trước và sau; hai số phải bằng nhau.
4. Cập nhật **cây thư mục** trong `START-HERE.md` cho khớp cấu trúc thật, kể cả thư mục riêng người dùng giữ lại (mỗi nhánh một dòng giải thích). Chưa có `START-HERE.md` → mời chạy `bat-dau`.

## Bước 3 — Báo

Bắt đầu bằng **HOÀN THÀNH —** hoặc **CHƯA HOÀN THÀNH —**: đã chuyển bao nhiêu mục, số file trước/sau, còn mục nào chờ người dùng quyết.
