---
name: add-assistant
description: Add a named AI assistant with its own role and tone (e.g. a marketing, finance or legal assistant) to the working folder in the standard format — one folder per assistant with a 9-section ROLE.md, lessons.md and outputs — so calling its name puts the AI into that role. Use when the user says "add an assistant", "add an agent", "create a persona", "I need someone for marketing", "thêm trợ lý".
---

# add-assistant — Add an assistant in the standard format

Result:

```
assistants/<folder>/
├── ROLE.md      ← role definition, all 9 sections
├── lessons.md   ← the assistant's own lessons
└── outputs/     ← what the assistant produces
```

plus a new row in the **Assistant directory** of `START-HERE.md` and a new branch in its tree.

No `AGENTS.md` / `START-HERE.md` yet → offer to run `setup` first, then come back.

## Step 1 — Ask (at most 2 rounds, skip what you know)

1. **What does the assistant handle?** Not sure → offer a few roles from `roles.md` (same folder); they can invent their own.
2. **Name?** Suggest 2–3 names that fit; always let the user choose.
3. **Tone?** Peer-to-peer or more formal.
4. **When to call it, who does it report to?** One sentence (default: reports to the user; with a main assistant it may report through them).

## Step 2 — Write the assistant folder

1. Folder name: the assistant's name, lowercase, hyphenated, no accents (`Mia` → `assistants/mia/`). Taken → ask whether to update the existing one; never overwrite without consent.
2. `ROLE.md` from `templates/ROLE.template.md`. **All 9 sections, in order, with these exact names**: Identity · Call when · Personality · Expertise · How to work · Communication · Does not do · Own principles · Where results go.
   - Write it **specific to the role**, not generic. A finance assistant: "always state the model's assumptions", "give good / base / bad scenarios", "Does not do: personal investment advice".
   - Not enough information for a section → propose content that fits the role and tell the user it's a proposal; never leave it blank.
   - Under 100 lines.
3. `lessons.md` from `templates/lessons.template.md`; create `outputs/` (with a `.gitkeep`).
4. `START-HERE.md`: add a row to the **Assistant directory** `| Name | Role | Tone | Call when | assistants/<folder>/ |` (replace a "(none yet …)" row), and update the tree to match.

## Step 3 — Check, then report

- Re-read `ROLE.md`: all 9 sections, no `{{`.
- 2–3 lines: which assistant was created, how to call it ("Mia, …"), where its results will go.
- Invite the user to try a small task now. When called: read `ROLE.md` + `lessons.md`, keep role, voice and tone for the session.
