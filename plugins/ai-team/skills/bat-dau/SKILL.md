---
name: bat-dau
description: Dựng file luật tối thiểu (AGENTS.md + CLAUDE.md) cho folder làm việc để AI hiểu người dùng là ai và làm việc theo cách nào. Dùng ngay sau khi cài AI Team Starter, khi folder chưa có AGENTS.md/CLAUDE.md, hoặc khi người dùng nói "bắt đầu", "setup", "dựng team AI", "tạo CLAUDE.md", "tạo AGENTS.md", "set up my AI team", "onboarding".
---

# bat-dau — Dựng file luật tối thiểu

Mục tiêu: sau khoảng 2 phút, folder có **`AGENTS.md`** (bản luật duy nhất) và **`CLAUDE.md`** (chỉ import `AGENTS.md` + vài dòng riêng của Claude). Claude và Codex cùng đọc một nội dung; sửa một nơi là đủ.

Chỉ làm đúng phần tối thiểu này. Thêm trợ lý, dự án, sắp xếp thư mục là việc của skill khác; chỉ **gợi ý** chúng ở cuối.

## Bước 1 — Xem folder trước khi hỏi

Kiểm tra folder đang mở có `AGENTS.md`, `CLAUDE.md`, `.claude/CLAUDE.md`, `CLAUDE.local.md` chưa.

- **Chưa có file nào** → sang Bước 2.
- **Đã có** → KHÔNG ghi đè. Đọc file, tóm tắt 2–3 dòng nó đang nói gì, rồi đề xuất một trong hai:
  - Chỉ bổ sung phần còn thiếu so với mẫu (liệt kê cụ thể phần nào).
  - Viết lại theo mẫu này.
  Chỉ sửa khi người dùng đồng ý. Trước khi sửa, chép bản cũ vào `archive/<tên-file>-<YYYY-MM-DD>.md`.
- **Có `CLAUDE.md` mà không có `AGENTS.md`** và người dùng đồng ý chuyển → chuyển nội dung sang `AGENTS.md`, để `CLAUDE.md` chỉ còn `@AGENTS.md` + phần riêng của Claude.

## Bước 2 — Hỏi tối đa 5 câu

Hỏi bằng ngôn ngữ người dùng đang dùng. Dùng công cụ hỏi lựa chọn nếu nền tảng có (ví dụ `AskUserQuestion`), luôn để người dùng tự gõ câu trả lời riêng. Gộp câu khi được; đừng hỏi điều đã biết từ cuộc trò chuyện hoặc từ memory có sẵn của nền tảng.

1. **Gọi bạn là gì, xưng hô thế nào?** (ví dụ: anh Tuấn – em; chị Lan – em; John – I/you)
2. **Bạn làm gì?** Một câu: công việc, công ty/lĩnh vực, nơi làm việc (nếu muốn).
3. **Muốn AI làm việc kiểu nào?** Gợi ý vài lựa chọn: "tự làm luôn, xong thì báo" · "hỏi trước khi làm việc lớn" · "ngắn gọn, đi thẳng kết quả" · "giải thích kỹ cho người mới".
4. **Ngôn ngữ làm việc?** Tiếng Việt / English / trộn.
5. **Muốn đặt tên cho trợ lý chính không?** Không bắt buộc. Nếu có, tự nghĩ 2–3 tên hợp ngữ cảnh người dùng vừa kể để gợi ý; không dùng danh sách tên cố định.

Người dùng trả lời "tuỳ bạn" hoặc bỏ qua câu nào → chọn mặc định hợp lý, ghi vào file và nói rõ đã chọn gì.

## Bước 3 — Viết hai file

1. Đọc `templates/AGENTS.template.md` và `templates/CLAUDE.template.md` trong thư mục skill này.
2. Điền các chỗ giữ chỗ:

   | Chỗ giữ chỗ | Điền gì |
   |---|---|
   | `{{TEN_GOI}}`, `{{XUNG_HO}}` | Câu 1 |
   | `{{CONG_VIEC}}` | Câu 2, một câu |
   | `{{PHONG_CACH}}` | Câu 3, viết thành hành vi cụ thể |
   | `{{CACH_TRA_LOI}}` | Suy từ câu 3, ví dụ "Ngắn, đi thẳng kết quả." hoặc "Giải thích từng bước bằng lời dễ hiểu." |
   | `{{NGON_NGU}}` | Câu 4 |
   | `{{DONG_TRO_LY_CHINH}}` | Có tên ở câu 5 → `- **Trợ lý chính:** <Tên> — trợ lý làm mọi việc, xưng <…>.` Không có → xoá cả dòng |
   | `{{BANG_TRO_LY}}` | Có trợ lý chính → một hàng `\| <Tên> \| Trợ lý chính \| <xưng hô> \| Mọi việc \|`. Không có → `\| _(chưa có — dùng skill them-tro-ly)_ \| \| \| \|` |
   | `{{NGAY}}` | Ngày hôm nay, `YYYY-MM-DD` |

   Điền bằng câu trả lời thật. Viết bằng ngôn ngữ người dùng đã chọn (nếu là English thì dịch cả phần luật). Xoá mọi chỗ giữ chỗ `{{…}}`; không để lại chữ nào kiểu `[TÊN]`.
3. Giữ `AGENTS.md` **dưới 200 dòng**. Luật viết cụ thể, kiểm được ("hỏi trước khi gửi email ra ngoài"), không viết chung chung ("làm việc tốt").
4. Ghi `AGENTS.md` và `CLAUDE.md` vào gốc folder. Dòng nội dung đầu tiên của `CLAUDE.md` phải là `@AGENTS.md`.

## Bước 4 — Kiểm tra rồi báo

- Đọc lại hai file vừa ghi. Kiểm: không còn `{{`, `CLAUDE.md` có `@AGENTS.md`, `AGENTS.md` dưới 200 dòng.
- Báo người dùng 3–5 dòng: đã tạo gì, AI sẽ làm việc với họ thế nào.
- Nói rõ: file có hiệu lực đầy đủ từ **phiên mới**; muốn sửa thì mở `AGENTS.md` sửa trực tiếp hoặc nhờ AI sửa.
- Gợi ý (không tự chạy), mỗi dòng một skill:
  - `/them-tro-ly` — thêm trợ lý có tên và chuyên môn riêng (marketing, tài chính…)
  - `/them-du-an` — tạo một dự án có tài liệu gốc
  - `/sap-xep-thu-muc` — dựng hoặc dọn cấu trúc thư mục
  - `/ghi-bai-hoc` — ghi lại một luật rút ra từ sai lầm
  - `/kiem-tra` — xem folder đang chạy đúng luật chưa

Trên Codex, nếu lệnh gạch chéo không có thì gọi skill bằng tên (ví dụ `$them-tro-ly`) hoặc nói bằng lời.
