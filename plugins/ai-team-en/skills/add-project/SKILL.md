---
name: add-project
description: Create a new project in the working folder with a BRIEF.md; projects with code or a running app also get a SOURCE OF TRUTH block (where the code lives, where the live version runs, how to deploy). Use when the user says "new project", "create a project", "start a project", "set up a project", "tạo dự án", or when starting a big piece of work that has no folder yet.
---

# add-project — Create a project

Result: `projects/<name>/BRIEF.md`, `projects/<name>/lessons.md` (the project's own lessons) and a new row in the **Projects** table of `AGENTS.md`.

No `AGENTS.md` yet → offer to run `setup` first.

## Step 1 — Ask briefly (at most 3 questions, skip what you know)

1. What is the project called, what does it do, for whom?
2. Is there code / an app / a website running?
3. If so: where is the main code (repo, folder), and where does the live version run?

## Step 2 — Create the BRIEF

1. Folder: `projects/<name>/`, lowercase, hyphenated, no accents. Already exists → don't overwrite; propose updating the existing BRIEF.
2. Use `templates/BRIEF.template.md`.
3. **Project with code or an app:** the SOURCE OF TRUTH block at the top is **mandatory**. Look first (read the folder, `git remote -v`, deploy config files) before asking. Anything you can't verify → write "not verified", don't guess, don't leave it blank. Record the verification date.
4. **Documents-only project:** replace the SOURCE OF TRUTH block with one line: "No code — not applicable."
5. Create `projects/<name>/lessons.md` from `templates/lessons.template.md`.
6. Add a row to the **Projects** table in `AGENTS.md`: `| Name | projects/<name>/ | New |`. If the table has a "(none yet …)" row, replace it.

## Tell the user once

- When the source of truth changes (new repo, new deploy target) → **edit the BRIEF right away**; don't drop a new note file next to it. A side note while the BRIEF stays unchanged makes the AI read the right place and still do the wrong thing.
- The project's lessons live in its `lessons.md`; `save-session` and `add-lesson` write there. The AI reads it whenever it works on the project.
- Every time a "trap" costs real time (deploy pulling the wrong source, a restart that doesn't really restart…) → add it to "Known traps".

## Step 3 — Report

2–3 lines: what was created; which SOURCE OF TRUTH lines are still "not verified".
