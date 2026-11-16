---
name: save-session
description: Save the working session into the folder's memory — write a session log, route lessons to the right place (general / project / assistant), knowledge to topics, new facts about the user to the profile, update open items and project status — so the next session on Claude or Codex doesn't have to ask again or repeat mistakes. Use at the end of every task with a result, when the user says "save", "save this", "wrap up", "end session", "lưu", "kết phiên", or when the hook reports an earlier session that ended unsaved.
---

# save-session — Save the session to memory

The folder's memory: `memory/`, `projects/<name>/lessons.md`, `assistants/<name>/lessons.md`, `about-me/` (see Article 6 of `AGENTS.md`, map in `START-HERE.md`). This skill **never edits `AGENTS.md`**.

No `memory/MEMORY.md` yet → create `memory/MEMORY.md`, `memory/lessons.md`, `memory/topics/`, `memory/sessions/` from the templates in `../setup/templates/memory/`, then continue.

## Step 0 — Which session

- **Current session** (default): use this conversation.
- **An earlier session the hook reported** (with a transcript path): read that transcript file (JSONL — one event per line; you only need the user's messages, the final answers and the names of files changed). Date the log by that session's time, not today. Transcript unreadable → say so in one line; don't invent anything.

## Step 1 — Anything worth keeping?

Worth keeping: work finished or left half-done, decisions the user made, files/projects changed, errors met and how they were fixed, corrections the user gave the AI, newly stated work preferences.

Nothing (small talk, a one-off lookup) → **create no file**, say "Nothing to save from this session." and stop.

## Step 2 — Write the session log

New file, one per session (two sessions running in parallel never overwrite each other):
`memory/sessions/YYYY-MM/YYYY-MM-DD-HHMM-<topic>.md` — `<topic>` lowercase, hyphenated, ≤ 5 words.

At most ~25 lines:

```
# <Topic> — YYYY-MM-DD HH:MM
Project: <name or "general"> · Assistant: <name if any>

## Done
- …
## Decisions (by the user)
- …
## Open / next steps
- …
## Lessons (written to: <file>)
- …
## Knowledge / profile (written to: <file>)
- …
## Files changed
- …
```

Only what really happened. Decisions must be the user's — AI proposals the user hasn't confirmed go under "Open".

## Step 3 — Route lessons

One lesson = **one specific, checkable line**, with why and date: `- <rule> — <why> — <YYYY-MM-DD>`.

| Lesson holds for | Write to |
|---|---|
| All work in the folder | `memory/lessons.md` |
| One project | `projects/<name>/lessons.md` (create if missing) |
| One assistant | `assistants/<name>/lessons.md` |

- Read the target file first. Duplicate → edit the old line (merge, update date). Contradiction → ask the user which to keep.
- Prefer lessons from **real errors** and **user corrections**. Don't record guesses.
- A lesson that holds for all work and has repeated ≥ 2 times → add one proposal line to the report: "Promote to a rule in AGENTS.md?" — never write to `AGENTS.md` yourself.

## Step 3b — Knowledge and profile (not lessons)

- **Reusable knowledge** (methods proven to work, processes, terms, values you look up again) → `memory/topics/<topic>.md`, one file per topic, lowercase-hyphenated. Topic file exists → add to the right section, don't create a duplicate. New file → add one line to the `topics/` index in `MEMORY.md`.
- **Things the user states about themselves** (new role, goals, people they work with) → `about-me/profile.md`. **The user corrects the voice of something written on their behalf** → `about-me/voice.md` (their exact words, with examples if given). No guesses.

Lesson = a rule drawn from a mistake ("don't do X because Y"). Knowledge = a method or fact to reuse. Don't mix them.

## Step 4 — Update status

- `memory/MEMORY.md`, "Open items": add the session's open items (one line each, linking to the log); remove finished ones. Keep ≤ 10 lines.
- A project changed status → update the status line in `projects/<name>/BRIEF.md` and the matching row in the **Projects** table of `START-HERE.md` (Status + Updated).
- The session created a new root folder or changed the structure without a skill → update the tree in `START-HERE.md`.

## Step 5 — Report

2–4 lines: which log file, how many lessons into which files, open items. If `memory/sessions/` has more than 15 logs since the last tidy-up (noted in `MEMORY.md`) → suggest running `tidy-memory`.
