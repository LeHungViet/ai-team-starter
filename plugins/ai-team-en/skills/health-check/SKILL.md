---
name: health-check
description: Check whether the working folder follows the rules in AGENTS.md — rules file too long or contradictory, memory saved regularly or not, CLAUDE.md still importing AGENTS.md, code projects missing a SOURCE OF TRUTH, files in the wrong place, assistants missing files. Read-only, changes nothing. Use when the user says "health check", "check my setup", "audit", "is my folder OK", "kiểm tra".
---

# health-check — Does the folder follow its rules?

**Read-only.** Don't edit, move or delete anything. At the end propose fixes and ask whether the user wants them.

## What to check

| # | Check | How |
|---|---|---|
| 1 | Rules file exists | `AGENTS.md` exists. Missing → stop, offer `setup`. |
| 2 | `CLAUDE.md` imports `AGENTS.md` | `CLAUDE.md` contains `@AGENTS.md`. A `CLAUDE.md` that copies the rules instead of importing → report "the two copies will drift apart". |
| 3 | Length | `AGENTS.md` under 200 lines. |
| 4 | Leftover placeholders | No `{{` or `[NAME` in the rules file, briefs, assistant files. |
| 5 | Contradicting rules | Read the articles and lessons; point out pairs that say opposite things. |
| 6 | Assistants | Every row in the **Assistants** table has `assistants/<name>.md` (except the "Main assistant" row — defined in `AGENTS.md`); every file in `assistants/` has a row. |
| 7 | Projects | Every row in **Projects** has a `BRIEF.md`. A code project (`package.json`, `.git`, `requirements.txt`, `Dockerfile`… or the BRIEF mentions a repo) without a SOURCE OF TRUTH block → report. Verification date older than 90 days → remind. |
| 8 | Clean root | The root holds only the rules files and the folders listed under **Folders** in `AGENTS.md`; list anything else. A listed folder that doesn't exist yet is not an error (created when needed). |
| 9 | Notes next to a BRIEF | A project folder has a file like "READ-FIRST", "SUPERSEDED", "NOTE-moved" saying the source changed while the BRIEF didn't → report as high. |
| 10 | Lean constitution | `AGENTS.md` holds no lessons or logs (a "## Lessons" section with specific rules and incident dates) — those belong in `memory/`. Found → propose moving them to `memory/lessons.md`. |
| 11 | Memory | `memory/MEMORY.md`, `memory/lessons.md`, `memory/sessions/` exist; every project has `lessons.md`. Newest session log older than 14 days while the folder has recently changed files → report "sessions may not be getting saved". More than 15 logs since the last tidy-up → suggest `tidy-memory`. |

## Report

Start with **DONE —** (everything checked) or **NOT DONE —** (some checks couldn't be done, say why).

Table: `| Rule | Level (✅ / ⚠️ / ❌) | Evidence (file, line, numbers) |`. Only what you actually saw; no guessing.

End: at most 3 fixes to do first, one line each, with the right skill (`organize-folder`, `add-project`, `add-lesson`, `save-session`, `tidy-memory`, `setup`). Ask whether the user wants them done.
