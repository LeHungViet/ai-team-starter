---
name: add-assistant
description: Add a named AI assistant with its own role and tone (e.g. a marketing, finance or legal assistant) to the working folder, so calling its name puts the AI into that role. Use when the user says "add an assistant", "add an agent", "create a persona", "I need someone for marketing", "thêm trợ lý".
---

# add-assistant — Add a named assistant

Result: a file `assistants/<name>.md` and a new row in the **Assistants** table of `AGENTS.md`.

No `AGENTS.md` yet → offer to run `setup` first, then come back.

## Step 1 — Ask (at most 2 rounds)

1. **What does the assistant handle?** If the user isn't sure, offer a few roles from `roles.md` (same folder) as ideas; they can invent their own.
2. **Name?** Suggest 2–3 names that fit the role and the user's context; always let the user choose. No fixed name list.
3. **Tone?** Peer-to-peer or more formal.
4. **When should this assistant be called?** One sentence.

If the user already described everything ("add Mia for marketing, casual tone") → don't ask again.

## Step 2 — Write the file

1. File name: the assistant's name, lowercase, hyphenated, no accents (`Mia` → `assistants/mia.md`). Name taken → ask whether to update the existing assistant; never overwrite without consent.
2. Use `templates/assistant.template.md`. Write expertise and working method **specific to the role** (a finance assistant always states model assumptions, gives three scenarios…), not generic. Under 80 lines.
3. Add a row to the **Assistants** table in `AGENTS.md`: `| Name | Role | Tone | Call when |`. If the table has a "(none yet …)" row, replace it.

## Step 3 — Report

- 2–3 lines: which assistant was created, how to call it ("Mia, …").
- Invite the user to try it now with a small task. When called, read `assistants/<name>.md` and keep the role, voice and tone for the whole session.
