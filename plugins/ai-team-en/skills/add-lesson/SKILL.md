---
name: add-lesson
description: Record a lesson right away (usually from a mistake, or when the user corrects the AI) into the folder's memory — memory/lessons.md if it holds for all work, the project's lessons.md if it belongs to one project — so every later session, on Claude and Codex, follows it. Does not write to AGENTS.md unless the user approves promoting it to a rule. Use when the user says "remember this lesson", "add a lesson", "don't do that again", "remember this rule", "ghi lại bài học".
---

# add-lesson — Record a lesson in memory

`AGENTS.md` is the constitution: general rules only, never edited casually. Lessons live in memory (Article 6 of `AGENTS.md`). Claude/Codex built-in memory isn't shared between the two tools and isn't guaranteed to load — so lessons must be in files.

## Step 1 — Make it one line

- Specific, checkable behaviour. Good: "No deploys after 4 pm on Fridays." Not good: "Be careful with deploys."
- Include **why** (what went wrong) and the date.
- Unclear what the rule is → ask exactly one question.

Format: `- <rule> — <why> — <YYYY-MM-DD>`

## Step 2 — Choose where

| Lesson holds for | Write to |
|---|---|
| All work in the folder | `memory/lessons.md` |
| One project | `projects/<name>/lessons.md` (create if missing; technical traps also go under "Known traps" in the BRIEF) |
| One assistant | `assistants/<name>/lessons.md` |

No `memory/` yet → create it from the templates in `../setup/templates/memory/`.

## Step 3 — Keep it tidy

- Read the target file first. Duplicate → edit the old line. Contradiction → ask which to keep.
- Remove the "_(none yet)_" line when adding the first lesson.
- The user wants this to be a **constitutional rule** (true for all work, must always sit in `AGENTS.md`) → restate the rule in one line and ask for approval. Approved: copy `AGENTS.md` to `archive/AGENTS-<YYYY-MM-DD>.md`, add the rule to the right article, keep the file under 120 lines.

## Step 4 — Report

One line: which rule, written to which file.
