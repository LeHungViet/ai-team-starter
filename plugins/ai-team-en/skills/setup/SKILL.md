---
name: setup
description: Set up the minimal working framework for a folder — AGENTS.md (constitution), CLAUDE.md, START-HERE.md (folder map), the about-me/ user profile and the memory/ folder — so the AI knows who the user is, what the folder holds and how to work. Use right after installing AI Team Starter, when the folder has no AGENTS.md/CLAUDE.md, when upgrading a folder built with an older version, or when the user says "set up", "get started", "onboarding", "set up my AI team", "create CLAUDE.md", "create AGENTS.md", "bắt đầu", "dựng team AI".
---

# setup — Minimal working framework

Result in about 2 minutes:

| File | What it is |
|---|---|
| `AGENTS.md` | Constitution — short, general rules. Claude and Codex both read it |
| `CLAUDE.md` | Only `@AGENTS.md` + `@START-HERE.md` + a few Claude-only lines |
| `START-HERE.md` | Folder map: tree, task → file table, assistant directory, project table |
| `about-me/profile.md`, `about-me/voice.md` | User profile and the voice for writing on their behalf |
| `memory/` | `MEMORY.md`, `lessons.md`, `topics/`, `sessions/` |
| `assistants/<name>/` | Only if the user names a main assistant |

Do only this minimum. Assistants, projects and folder structure belong to other skills; only **suggest** them at the end.

## Step 1 — Look at the folder before asking

Check whether the open folder has `AGENTS.md`, `CLAUDE.md`, `.claude/CLAUDE.md`, `CLAUDE.local.md`, `START-HERE.md`.

- **No rules files** → go to Step 2.
- **Rules files not created by AI Team Starter** → do NOT overwrite. Summarize in 2–3 lines what they say, then propose: add only what's missing (list exactly what), or rewrite following the templates. Change only with consent; before changing, copy the old file to `archive/<file-name>-<YYYY-MM-DD>.md`.
- **Folder built by an older AI Team Starter** (AGENTS.md contains "with AI Team Starter") → propose an **upgrade**, list exactly what will change, act only with consent, copy old files to `archive/` first:
  - no `START-HERE.md` → create it; move the **Assistants**, **Projects**, **Folders** and **Skills** tables from AGENTS.md into it;
  - no `about-me/` → create it from "Who you work with"; AGENTS.md keeps only a 2-line summary;
  - AGENTS.md still has "Lessons" / "Memory" sections with lessons → move them to `memory/lessons.md`, replace with Article 6 of the template;
  - assistants as single files `assistants/<name>.md` → turn each into a folder `assistants/<name>/ROLE.md` in the standard format (keep the old content, fill missing sections with "none yet") + `lessons.md` + `outputs/`;
  - add `memory/topics/`; add `@START-HERE.md` to `CLAUDE.md`.
  Keep everything the user already filled in.
- **`CLAUDE.md` without `AGENTS.md`** and the user agrees → move the rules into `AGENTS.md`, make `CLAUDE.md` follow the template.

## Step 2 — Ask at most 5 questions

Ask in the language the user is using. Use the platform's choice tool if it has one (e.g. `AskUserQuestion`), always allowing a free-text answer. Combine questions; don't ask what you already know.

1. **What should I call you, and what tone?** (e.g. "John, casual"; "Ms. Lan, formal")
2. **What do you do, and what is this folder for?** One or two sentences.
3. **How should the AI work with you?** Suggest: "just do it, report when done" · "ask before big changes" · "short, straight to the result" · "explain carefully, I'm new to this".
4. **Working language?** English / Tiếng Việt / mixed.
5. **Want to name your main assistant?** Optional. If yes, suggest 2–3 names that fit the context.

"Up to you" or skipped → choose a sensible default, write it in the files and say what you chose.

## Step 3 — Write the files

1. Read the templates in this skill's `templates/`: `AGENTS.template.md`, `CLAUDE.template.md`, `START-HERE.template.md`, `about-me/*.template.md`, `memory/*.template.md`.
2. Fill the placeholders:

   | Placeholder | Fill with |
   |---|---|
   | `{{NAME}}`, `{{TONE}}` | Question 1 |
   | `{{WORK}}` | Question 2, one sentence about their work |
   | `{{FOLDER_DESCRIPTION}}` | Question 2, what the folder is for (1–2 sentences) |
   | `{{FOLDER_NAME}}` | Name of the open folder |
   | `{{STYLE}}` | Question 3, as concrete behaviour |
   | `{{REPLY_STYLE}}` | From question 3, e.g. "Short, straight to the result." |
   | `{{LANGUAGE}}` | Question 4 |
   | `{{MAIN_ASSISTANT_LINE}}` | Named in question 5 → `- **Main assistant:** <Name> — see assistants/<folder>/ROLE.md.` None → delete the line |
   | `{{ASSISTANT_TABLE}}` (START-HERE) | Main assistant → `\| <Name> \| Main assistant \| <tone> \| All work \| assistants/<folder>/ \|`. None → `\| _(none yet — use the add-assistant skill)_ \| \| \| \| \|` |
   | `{{DATE}}` | Today, `YYYY-MM-DD` |

   Write in the language the user chose (if Vietnamese, translate the rules too). Leave no `{{…}}` or `[NAME]`.
3. `AGENTS.md` **under 120 lines**, general rules only; specific, checkable rules. No tables, directories or profile in it.
4. Write `AGENTS.md`, `CLAUDE.md`, `START-HERE.md` to the folder root. The first two lines of `CLAUDE.md` are `@AGENTS.md` and `@START-HERE.md`.
5. Create (only if missing): `about-me/profile.md`, `about-me/voice.md`, `memory/MEMORY.md`, `memory/lessons.md`, folders `memory/topics/` and `memory/sessions/` (put a `.gitkeep` in each empty folder).
6. Main assistant named → create `assistants/<folder>/` exactly as the `add-assistant` skill does (templates in `../add-assistant/templates/`): `ROLE.md` with all 9 sections, role "Main assistant — handles all work, coordinates other assistants", `lessons.md`, `outputs/`.
7. The tree in `START-HERE.md` must match the real folder: no assistants yet → `assistants/  ← (none yet — use add-assistant)`; no projects yet → `projects/  ← (none yet — use add-project)`; a main assistant → its real folder name.

## Step 4 — Check, then report

- Re-read the files. Check: no `{{`; `CLAUDE.md` has `@AGENTS.md` and `@START-HERE.md`; `AGENTS.md` under 120 lines with no assistant/project tables; every file from Step 3.5 exists.
- Tell the user in 3–5 lines what was created; `START-HERE.md` is the map the AI uses to know where things are; the AI runs `save-session` at the end of each task; `AGENTS.md` changes only with their approval.
- Say it takes full effect in a **new session**.
- Suggest (don't run), one line each: `/add-assistant`, `/add-project`, `/organize-folder`, `/save-session`, `/add-lesson`, `/health-check`.

On Codex, if slash commands aren't available, call the skill by name (e.g. `$ai-team-en:add-assistant`) or just ask in words.
