---
name: bat-dau
description: Dựng bộ khung làm việc tối thiểu cho folder — AGENTS.md (hiến pháp), CLAUDE.md, START-HERE.md (bản đồ folder), hồ sơ người dùng nguoi-dung/ và bộ nhớ bo-nho/ — để AI hiểu người dùng là ai, folder có gì và làm việc theo cách nào. Dùng ngay sau khi cài AI Team Starter, khi folder chưa có AGENTS.md/CLAUDE.md, khi nâng cấp folder dựng bằng bản cũ, hoặc khi người dùng nói "bắt đầu", "setup", "dựng team AI", "tạo CLAUDE.md", "tạo AGENTS.md", "set up my AI team", "onboarding".
---

# bat-dau — Dựng bộ khung tối thiểu

Kết quả sau khoảng 2 phút:

| File | Là gì |
|---|---|
| `AGENTS.md` | Hiến pháp — luật tổng quát, ngắn. Claude và Codex cùng đọc |
| `CLAUDE.md` | Chỉ `@AGENTS.md` + `@START-HERE.md` + vài dòng riêng của Claude |
| `START-HERE.md` | Bản đồ folder: cây thư mục, việc gì đọc file nào, danh bạ trợ lý, bảng dự án |
| `nguoi-dung/ve-toi.md`, `nguoi-dung/van-phong.md` | Hồ sơ người dùng và giọng văn khi viết thay |
| `bo-nho/` | `BO-NHO.md`, `bai-hoc.md`, `chu-de/`, `nhat-ky/` |
| `tro-ly/<tên>/` | Chỉ khi người dùng đặt tên trợ lý chính |

Chỉ làm phần tối thiểu này. Thêm trợ lý, dự án, sắp xếp thư mục là việc của skill khác; chỉ **gợi ý** chúng ở cuối.

## Bước 1 — Xem folder trước khi hỏi

Kiểm tra folder đang mở có `AGENTS.md`, `CLAUDE.md`, `.claude/CLAUDE.md`, `CLAUDE.local.md`, `START-HERE.md` chưa.

- **Chưa có file luật nào** → sang Bước 2.
- **Có file luật không do AI Team Starter tạo** → KHÔNG ghi đè. Tóm tắt 2–3 dòng file đang nói gì, rồi đề xuất: chỉ bổ sung phần còn thiếu (liệt kê cụ thể), hoặc viết lại theo mẫu. Chỉ sửa khi người dùng đồng ý; trước khi sửa, chép bản cũ vào `archive/<tên-file>-<YYYY-MM-DD>.md`.
- **Folder dựng bằng AI Team Starter bản cũ** (AGENTS.md có dòng "bằng AI Team Starter") → đề xuất **nâng cấp**, liệt kê đúng những việc sẽ làm, chỉ làm khi người dùng đồng ý, chép bản cũ vào `archive/` trước:
  - chưa có `START-HERE.md` → tạo; chuyển bảng **Trợ lý**, **Dự án**, **Thư mục**, **Skill** từ AGENTS.md sang START-HERE.md;
  - chưa có `nguoi-dung/` → tạo từ mục "Người bạn làm việc cùng"; AGENTS.md chỉ giữ 2 dòng tóm tắt;
  - AGENTS.md còn mục "Bài học" / "Ghi nhớ" → chuyển dòng bài học sang `bo-nho/bai-hoc.md`, thay bằng Điều 6 của mẫu;
  - trợ lý dạng file `tro-ly/<tên>.md` → chuyển thành thư mục `tro-ly/<tên>/VAI.md` theo format chuẩn (giữ nội dung cũ, bổ sung mục thiếu thành "chưa có") + `bai-hoc.md` + `ket-qua/`;
  - thêm `bo-nho/chu-de/`; `CLAUDE.md` thêm `@START-HERE.md`.
  Giữ nguyên mọi phần người dùng đã điền.
- **Có `CLAUDE.md` mà không có `AGENTS.md`** và người dùng đồng ý → chuyển nội dung luật sang `AGENTS.md`, để `CLAUDE.md` theo mẫu.

## Bước 2 — Hỏi tối đa 5 câu

Hỏi bằng ngôn ngữ người dùng đang dùng. Dùng công cụ hỏi lựa chọn nếu nền tảng có (ví dụ `AskUserQuestion`), luôn để người dùng tự gõ câu trả lời riêng. Gộp câu khi được; đừng hỏi điều đã biết.

1. **Gọi bạn là gì, xưng hô thế nào?** (ví dụ: anh Tuấn – em; chị Lan – em; John – I/you)
2. **Bạn làm gì, folder này dùng cho việc gì?** Một hai câu.
3. **Muốn AI làm việc kiểu nào?** Gợi ý: "tự làm luôn, xong thì báo" · "hỏi trước khi làm việc lớn" · "ngắn gọn, đi thẳng kết quả" · "giải thích kỹ cho người mới".
4. **Ngôn ngữ làm việc?** Tiếng Việt / English / trộn.
5. **Muốn đặt tên cho trợ lý chính không?** Không bắt buộc. Nếu có, tự nghĩ 2–3 tên hợp ngữ cảnh để gợi ý.

Người dùng trả lời "tuỳ bạn" hoặc bỏ qua → chọn mặc định hợp lý, ghi vào file và nói rõ đã chọn gì.

## Bước 3 — Viết các file

1. Đọc mẫu trong `templates/` của skill này: `AGENTS.template.md`, `CLAUDE.template.md`, `START-HERE.template.md`, `nguoi-dung/*.template.md`, `bo-nho/*.template.md`.
2. Điền chỗ giữ chỗ:

   | Chỗ giữ chỗ | Điền gì |
   |---|---|
   | `{{TEN_GOI}}`, `{{XUNG_HO}}` | Câu 1 |
   | `{{CONG_VIEC}}` | Câu 2, một câu về công việc |
   | `{{MO_TA_FOLDER}}` | Câu 2, folder dùng cho việc gì (1–2 câu) |
   | `{{TEN_FOLDER}}` | Tên thư mục đang mở |
   | `{{PHONG_CACH}}` | Câu 3, viết thành hành vi cụ thể |
   | `{{CACH_TRA_LOI}}` | Suy từ câu 3, ví dụ "Ngắn, đi thẳng kết quả." |
   | `{{NGON_NGU}}` | Câu 4 |
   | `{{DONG_TRO_LY_CHINH}}` | Có tên ở câu 5 → `- **Trợ lý chính:** <Tên> — xem tro-ly/<thư-mục>/VAI.md.` Không có → xoá cả dòng |
   | `{{BANG_TRO_LY}}` (START-HERE) | Có trợ lý chính → `\| <Tên> \| Trợ lý chính \| <xưng hô> \| Mọi việc \| tro-ly/<thư-mục>/ \|`. Không có → `\| _(chưa có — dùng skill them-tro-ly)_ \| \| \| \| \|` |
   | `{{NGAY}}` | Hôm nay, `YYYY-MM-DD` |

   Viết bằng ngôn ngữ người dùng chọn (English thì dịch cả phần luật). Không để sót `{{…}}` hay chữ kiểu `[TÊN]`.
3. `AGENTS.md` **dưới 120 dòng**, chỉ luật tổng quát; luật viết cụ thể, kiểm được. Không đưa bảng, danh bạ, hồ sơ vào đây.
4. Ghi `AGENTS.md`, `CLAUDE.md`, `START-HERE.md` vào gốc folder. Hai dòng đầu của `CLAUDE.md` là `@AGENTS.md` và `@START-HERE.md`.
5. Tạo (chưa có mới tạo, có rồi giữ nguyên): `nguoi-dung/ve-toi.md`, `nguoi-dung/van-phong.md`, `bo-nho/BO-NHO.md`, `bo-nho/bai-hoc.md`, thư mục `bo-nho/chu-de/` và `bo-nho/nhat-ky/` (mỗi thư mục rỗng đặt một file `.gitkeep`).
6. Có trợ lý chính → tạo `tro-ly/<thư-mục>/` theo đúng cách của skill `them-tro-ly` (mẫu `../them-tro-ly/templates/`): `VAI.md` đủ 9 mục với vai "Trợ lý chính — làm mọi việc, điều phối trợ lý khác", `bai-hoc.md`, `ket-qua/`.
7. Cây thư mục trong `START-HERE.md` phải khớp folder thật: chưa có trợ lý thì nhánh trợ lý ghi `tro-ly/  ← (chưa có — dùng them-tro-ly)`; chưa có dự án thì `du-an/  ← (chưa có — dùng them-du-an)`; có trợ lý chính thì ghi đúng tên thư mục của nó.

## Bước 4 — Kiểm tra rồi báo

- Đọc lại các file vừa ghi. Kiểm: không còn `{{`; `CLAUDE.md` có `@AGENTS.md` và `@START-HERE.md`; `AGENTS.md` dưới 120 dòng và không có bảng trợ lý/dự án; có đủ file ở Bước 3.5.
- Báo người dùng 3–5 dòng: đã tạo gì; `START-HERE.md` là bản đồ để AI biết tìm gì ở đâu; cuối mỗi việc AI chạy `luu-phien`; `AGENTS.md` chỉ đổi khi họ duyệt.
- Nói rõ: có hiệu lực đầy đủ từ **phiên mới**.
- Gợi ý (không tự chạy), mỗi dòng một skill: `/them-tro-ly`, `/them-du-an`, `/sap-xep-thu-muc`, `/luu-phien`, `/ghi-bai-hoc`, `/kiem-tra`.

Trên Codex, nếu lệnh gạch chéo không có thì gọi skill bằng tên (ví dụ `$ai-team:them-tro-ly`) hoặc nói bằng lời.
