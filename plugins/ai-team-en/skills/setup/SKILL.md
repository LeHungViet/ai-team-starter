---
name: setup
description: Set up a minimal rules file (AGENTS.md + CLAUDE.md) and a memory/ folder for a working folder, so the AI knows who the user is and how they like to work. Use right after installing AI Team Starter, when the folder has no AGENTS.md/CLAUDE.md, or when the user says "set up", "get started", "onboarding", "set up my AI team", "create CLAUDE.md", "create AGENTS.md", "bắt đầu", "dựng team AI".
---

# setup — Minimal rules file and memory

Goal: in about 2 minutes the folder has **`AGENTS.md`** (the constitution — the only general rules file), **`CLAUDE.md`** (only imports `AGENTS.md` plus a few Claude-only lines) and **`memory/`** (lessons, session logs, open items). Claude and Codex read the same content; edit in one place.

Do only this minimum. Assistants, projects and folder structure belong to other skills; only **suggest** them at the end.

## Step 1 — Look at the folder before asking

Check whether the open folder has `AGENTS.md`, `CLAUDE.md`, `.claude/CLAUDE.md`, `CLAUDE.local.md`.

- **None** → go to Step 2.
- **Some exist** → do NOT overwrite. Read them, summarize in 2–3 lines what they say, then propose one of:
  - Only add what is missing compared with the template (list exactly what).
  - Rewrite following this template.
  Change only with the user's consent. Before changing, copy the old file to `archive/<file-name>-<YYYY-MM-DD>.md`.
- **`CLAUDE.md` exists without `AGENTS.md`** and the user agrees → move the content to `AGENTS.md`, leaving `CLAUDE.md` with only `@AGENTS.md` plus Claude-only lines.

## Step 2 — Ask at most 5 questions

Ask in the language the user is using. Use the platform's choice tool if it has one (e.g. `AskUserQuestion`), always allowing a free-text answer. Combine questions where possible; don't ask what you already know from the conversation or the platform's memory.

1. **What should I call you, and what tone?** (e.g. "John, casual"; "Ms. Lan, formal"; "anh Tuấn – em")
2. **What do you do?** One sentence: job, company/field, location (optional).
3. **How should the AI work with you?** Suggest a few: "just do it, report when done" · "ask before big changes" · "short, straight to the result" · "explain carefully, I'm new to this".
4. **Working language?** English / Tiếng Việt / mixed.
5. **Want to name your main assistant?** Optional. If yes, suggest 2–3 names that fit what the user just told you; don't use a fixed name list.

If the user says "up to you" or skips a question → choose a sensible default, write it in the file and say what you chose.

## Step 3 — Write the files

1. Read `templates/AGENTS.template.md` and `templates/CLAUDE.template.md` in this skill folder.
2. Fill the placeholders:

   | Placeholder | Fill with |
   |---|---|
   | `{{NAME}}`, `{{TONE}}` | Question 1 |
   | `{{WORK}}` | Question 2, one sentence |
   | `{{STYLE}}` | Question 3, written as concrete behaviour |
   | `{{REPLY_STYLE}}` | Derived from question 3, e.g. "Short, straight to the result." or "Explain step by step in plain words." |
   | `{{LANGUAGE}}` | Question 4 |
   | `{{MAIN_ASSISTANT_LINE}}` | Name given in question 5 → `- **Main assistant:** <Name> — handles all work, tone <…>.` None → delete the whole line |
   | `{{ASSISTANT_TABLE}}` | Main assistant → one row `\| <Name> \| Main assistant \| <tone> \| All work \|`. None → `\| _(none yet — use the add-assistant skill)_ \| \| \| \|` |
   | `{{DATE}}` | Today, `YYYY-MM-DD` |

   Use the user's real answers. Write in the language they chose (if Vietnamese, translate the rules too). Remove every `{{…}}`; leave nothing like `[NAME]`.
3. Keep `AGENTS.md` **under 200 lines**. Rules must be specific and checkable ("ask before emailing anyone outside"), not vague ("do good work").
4. Write `AGENTS.md` and `CLAUDE.md` to the folder root. The first content line of `CLAUDE.md` must be `@AGENTS.md`.
5. Create memory (only if missing; keep what exists): `memory/MEMORY.md` from `templates/memory/MEMORY.template.md`, `memory/lessons.md` from `templates/memory/lessons.template.md`, and the folder `memory/sessions/` (put an empty `.gitkeep` inside so it doesn't vanish).

## Step 4 — Check, then report

- Re-read the files you wrote. Check: no `{{` left, `CLAUDE.md` contains `@AGENTS.md`, `AGENTS.md` under 200 lines, `memory/MEMORY.md` and `memory/lessons.md` exist.
- Tell the user in 3–5 lines what was created and how the AI will work with them. Explain memory: at the end of each task the AI runs `save-session` to log the session and lessons in `memory/`; `AGENTS.md` changes only with their approval.
- Say the rules take full effect in a **new session**; to change them, edit `AGENTS.md` directly or ask the AI.
- Suggest (don't run), one line each:
  - `/add-assistant` — add a named assistant with its own expertise (marketing, finance…)
  - `/add-project` — create a project with a brief
  - `/organize-folder` — set up or clean up the folder structure
  - `/save-session` — save the session: log, lessons, open items (the AI runs it at the end of each task)
  - `/add-lesson` — record a lesson from a mistake right away
  - `/health-check` — check whether the folder follows its rules

On Codex, if slash commands aren't available, call the skill by name (e.g. `$ai-team-en:add-assistant`) or just ask in words.
