# START HERE — Bản đồ folder của {{TEN_GOI}}

> Đọc sau `AGENTS.md`, đầu mỗi phiên. File này là **bản đồ**, không phải luật: folder có gì, nằm ở đâu, việc gì thì đọc file nào, ai làm gì.
> Cấu trúc đổi (thêm dự án, thêm trợ lý, sắp xếp thư mục) → skill tương ứng cập nhật file này ngay. Cập nhật lần cuối: {{NGAY}}.

## 1. Folder này là gì

{{MO_TA_FOLDER}}

## 2. Cây thư mục

```
{{TEN_FOLDER}}/
├── AGENTS.md            ← hiến pháp: luật tổng quát (Claude + Codex)
├── CLAUDE.md            ← @AGENTS.md + @START-HERE.md
├── START-HERE.md        ← bản đồ này
├── nguoi-dung/          ← hồ sơ người dùng
│   ├── ve-toi.md        ← là ai, công việc, cách nghĩ, mục tiêu
│   └── van-phong.md     ← giọng văn khi AI viết thay
├── bo-nho/              ← bộ nhớ chung
│   ├── BO-NHO.md        ← mục lục + việc đang dở
│   ├── bai-hoc.md       ← bài học dùng cho mọi việc
│   ├── chu-de/          ← kiến thức dùng lại, mỗi chủ đề một file
│   └── nhat-ky/         ← mỗi phiên một file, theo tháng
├── tro-ly/<tên>/        ← mỗi trợ lý một thư mục
│   ├── VAI.md           ← định nghĩa vai (format chuẩn)
│   ├── bai-hoc.md       ← bài học riêng của trợ lý
│   └── ket-qua/         ← kết quả trợ lý làm ra
├── du-an/<tên>/         ← mỗi dự án một thư mục
│   ├── BRIEF.md         ← mục tiêu, trạng thái, NGUỒN SỰ THẬT
│   ├── bai-hoc.md       ← bài học riêng dự án
│   └── …                ← mọi file của dự án
├── tai-lieu/            ← tài liệu dùng chung, không thuộc dự án nào
└── archive/             ← đồ đã dọn, bản cũ; không xoá gì
```

Gốc folder chỉ giữ 3 file trên và các thư mục này. File mới → đặt vào đúng nhánh; không chắc → chọn nhánh hợp nhất, ghi "⚠️ Giả định" và báo người dùng (Điều 2.2).

## 3. Việc gì → đọc file nào

| Việc | Đọc |
|---|---|
| Mọi phiên | `AGENTS.md` → file này → `bo-nho/BO-NHO.md` → `bo-nho/bai-hoc.md` |
| Làm với dự án X | `du-an/x/BRIEF.md` → `du-an/x/bai-hoc.md` |
| Người dùng gọi tên trợ lý | `tro-ly/<tên>/VAI.md` → `tro-ly/<tên>/bai-hoc.md` |
| Viết thay người dùng | `nguoi-dung/van-phong.md` |
| Cần hiểu người dùng sâu hơn | `nguoi-dung/ve-toi.md` |
| Cần cách làm đã có (quy trình, thuật ngữ) | `bo-nho/chu-de/` |
| Tra lại việc cũ | `bo-nho/nhat-ky/` |

## 4. Danh bạ trợ lý

Gọi tên → đọc `VAI.md` + `bai-hoc.md` của trợ lý → giữ vai suốt phiên → kết quả vào `ket-qua/` của trợ lý (trừ khi thuộc một dự án).

| Tên | Vai | Xưng hô | Gọi khi | Thư mục |
|---|---|---|---|---|
{{BANG_TRO_LY}}

## 5. Dự án

| Dự án | Thư mục | Trạng thái | Cập nhật |
|---|---|---|---|
| _(chưa có — dùng skill `them-du-an`)_ | | | |

## 6. Skill có thể gọi

| Skill | Dùng khi |
|---|---|
| `luu-phien` | Cuối việc / cuối phiên: nhật ký, bài học, kiến thức, việc đang dở |
| `ghi-bai-hoc` | Ghi ngay một bài học rút từ sai lầm |
| `don-bo-nho` | Gộp và dọn bộ nhớ định kỳ |
| `them-tro-ly` | Thêm trợ lý có tên, theo format chuẩn |
| `them-du-an` | Tạo một dự án mới |
| `sap-xep-thu-muc` | Dựng hoặc dọn cấu trúc thư mục |
| `kiem-tra` | Xem folder có đúng luật và đúng bản đồ không |
| `bat-dau` | Dựng lại hoặc nâng cấp bộ file này |
