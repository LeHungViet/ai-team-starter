---
name: tidy-memory
description: Consolidate and clean up the folder's memory periodically — merge duplicate lessons, summarize old session logs by month, move originals to archive (never delete), fix the index, and propose which lessons should become rules in AGENTS.md. Use when the user says "tidy memory", "clean up memory", "consolidate memory", "monthly review", "dọn bộ nhớ", or when save-session suggests it because logs have piled up.
---

# tidy-memory — Consolidate and clean up memory

**Never delete anything.** Old material moves to `archive/`. **Never edit `AGENTS.md`** without the user's approval.

No `memory/MEMORY.md` → say "This folder has no memory yet", suggest `setup` or `save-session`, then stop.

## Step 1 — Survey

Count: session logs per month, lines in `memory/lessons.md` and each `projects/*/lessons.md`, lines under "Open items". Give the user a one-line overview before changing anything.

## Step 2 — Lessons

- Merge lines that say the same thing into one (keep the newest date).
- Two lines that contradict → ask the user which to keep (one question, list both).
- A lesson that really belongs to one project → move it to `projects/<name>/lessons.md`.
- A lesson no longer valid (project closed, tool dropped) → move it under a `## No longer in effect` section at the end of the file; don't delete it.
- Do the same for `assistants/*/lessons.md`.

## Step 2b — Topics

- `memory/topics/`: merge files on the same topic (originals to `archive/`), fix the index in `MEMORY.md`, mark outdated parts.
- A "lesson" that is really knowledge (not a rule) → move it to the right topic file.

## Step 3 — Session logs

For each month with logs **older than 30 days**:
1. Write `memory/sessions/YYYY-MM/SUMMARY.md` (≤ 40 lines): main work done, important decisions, lessons drawn (link to the lesson files), items still open.
2. Move that month's original logs to `archive/sessions/YYYY-MM/`.
3. Keep the last 30 days of logs as they are.

## Step 4 — Index and open items

- `memory/MEMORY.md`: remove open items that are done (check the logs), fix broken links, update the line "Last tidy-up: YYYY-MM-DD".
- `START-HERE.md`: the tree matches the real folder; the assistant directory and project table match the real folders.

## Step 5 — Propose rule promotions

Lessons that keep repeating **or** hold for all work → list at most 3 proposals: "Promote to a rule in AGENTS.md: <rule>". Write to `AGENTS.md` only when the user approves each line; before writing, copy `AGENTS.md` to `archive/AGENTS-<YYYY-MM-DD>.md`, put the rule in the right article, keep the file under 120 lines, then move that lesson line to "No longer in effect" with the note "promoted to a rule".

## Step 6 — Report

Start with **DONE —**. 3–5 lines: how many lessons merged/moved, which months summarized, how many files moved to `archive/`, which proposals await approval.
