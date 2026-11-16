---
name: health-check
description: Check whether the working folder follows its rules and its map — AGENTS.md too long or mixed with tables or lessons, CLAUDE.md still importing AGENTS.md and START-HERE.md, START-HERE matching the real folder tree, assistants in the 9-section format, code projects missing a SOURCE OF TRUTH, memory saved regularly, files in the wrong place. Read-only, changes nothing. Use when the user says "health check", "check my setup", "audit", "is my folder OK", "kiểm tra".
---

# health-check — Does the folder match its rules and its map?

**Read-only.** Don't edit, move or delete anything. At the end propose fixes and ask whether the user wants them.

## What to check

| # | Check | How |
|---|---|---|
| 1 | Framework exists | `AGENTS.md` and `START-HERE.md` exist. Missing → stop, offer `setup` (upgrade if it's an older folder). |
| 2 | `CLAUDE.md` imports | `CLAUDE.md` has `@AGENTS.md` and `@START-HERE.md`. A `CLAUDE.md` that copies the rules instead → report "the two copies will drift apart". |
| 3 | Lean constitution | `AGENTS.md` under 120 lines; no assistant/project tables, detailed profile, lessons or logs (those belong in `START-HERE.md`, `about-me.md`, `memory/`). |
| 4 | Leftover placeholders | No `{{` or `[NAME` in any `.md` of the framework. |
| 5 | Contradicting rules | Read the articles and lessons; point out pairs that say opposite things. |
| 6 | Map matches reality | Every branch in the `START-HERE.md` tree exists; every root folder appears in the tree (skip `.git`, `.claude`, `.codex`, `node_modules`…). List mismatches. |
| 7 | Assistants | Every row in the **Assistant directory** has `assistants/<name>/` with `ROLE.md`, `lessons.md`, `outputs/`; every folder in `assistants/` has a row. Old-style files `assistants/<name>.md` → propose upgrading with `setup`. |
| 8 | Assistant format | Every `ROLE.md` has all 9 sections by name: Identity · Call when · Personality · Expertise · How to work · Communication · Does not do · Own principles · Where results go. List missing sections per assistant. |
| 9 | Projects | Every row in **Projects** has `BRIEF.md` and `lessons.md`. A code project (`package.json`, `.git`, `requirements.txt`, `Dockerfile`… or the BRIEF mentions a repo) without a SOURCE OF TRUTH block → report. Verification older than 90 days → remind. A file like "READ-FIRST", "SUPERSEDED", "NOTE-moved" saying the source changed while the BRIEF didn't → report as high. |
| 10 | User profile | `about-me.md` exists, including "Voice when writing on their behalf". |
| 11 | Memory | `memory/MEMORY.md`, `memory/lessons.md`, `memory/topics/`, `memory/sessions/` exist. Newest session log older than 14 days while the folder has recent changes → "sessions may not be getting saved". More than 15 logs since the last tidy-up → suggest `tidy-memory`. A file in `topics/` missing from the `MEMORY.md` index → report. |
| 12 | Clean root | The root holds only `AGENTS.md`, `CLAUDE.md`, `START-HERE.md`, `about-me.md` and the folders in the tree; list stray files. |

## Report

Start with **DONE —** (everything checked) or **NOT DONE —** (some checks couldn't be done, say why).

Table: `| # | Check | Level (✅ / ⚠️ / ❌) | Evidence (file, line, numbers) |`. Only what you actually saw.

End: at most 3 fixes to do first, one line each, with the right skill (`setup`, `organize-folder`, `add-assistant`, `add-project`, `add-lesson`, `save-session`, `tidy-memory`). Ask whether the user wants them done.
