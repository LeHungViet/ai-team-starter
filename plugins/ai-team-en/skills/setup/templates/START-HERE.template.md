# START HERE — Folder map for {{NAME}}

> Read after `AGENTS.md`, at the start of every session. This file is a **map**, not rules: what the folder holds, where things live, what to read for which task, who does what.
> When the structure changes (new project, new assistant, reorganizing), the matching skill updates this file right away. Last updated: {{DATE}}.

## 1. What this folder is

{{FOLDER_DESCRIPTION}}

## 2. Folder tree

```
{{FOLDER_NAME}}/
├── AGENTS.md            ← constitution: general rules (Claude + Codex)
├── CLAUDE.md            ← @AGENTS.md + @START-HERE.md
├── START-HERE.md        ← this map
├── about-me.md          ← user profile + voice when the AI writes on their behalf
├── memory/              ← shared memory
│   ├── MEMORY.md        ← index + open items
│   ├── lessons.md       ← lessons for all work
│   ├── topics/          ← reusable knowledge, one file per topic
│   └── sessions/        ← one log per session, by month
├── assistants/<name>/   ← one folder per assistant
│   ├── ROLE.md          ← role definition (standard format)
│   ├── lessons.md       ← the assistant's own lessons
│   └── outputs/         ← what the assistant produces
├── projects/<name>/     ← one folder per project
│   ├── BRIEF.md         ← goal, status, SOURCE OF TRUTH
│   ├── lessons.md       ← project lessons
│   └── …                ← all project files
├── docs/                ← shared documents that belong to no project
└── archive/             ← cleaned-up items, old versions; nothing is deleted
```

The root holds only the 4 files above and these folders. New file → put it in the right branch; unsure → pick the best-fitting branch, mark "⚠️ Assumption" and tell the user (Article 2.2).

## 3. Task → read

| Task | Read |
|---|---|
| Every session | `AGENTS.md` → this file → `memory/MEMORY.md` → `memory/lessons.md` |
| Working on project X | `projects/x/BRIEF.md` → `projects/x/lessons.md` |
| User calls an assistant by name | `assistants/<name>/ROLE.md` → `assistants/<name>/lessons.md` |
| Writing on the user's behalf | `about-me.md` → "Voice when writing on their behalf" |
| Need to understand the user better | `about-me.md` |
| Need an established method (process, terms) | `memory/topics/` |
| Look up past work | `memory/sessions/` |

## 4. Assistant directory

Call by name → read the assistant's `ROLE.md` + `lessons.md` → stay in role for the session → results go to the assistant's `outputs/` (unless they belong to a project).

| Name | Role | Tone | Call when | Folder |
|---|---|---|---|---|
{{ASSISTANT_TABLE}}

## 5. Projects

| Project | Folder | Status | Updated |
|---|---|---|---|
| _(none yet — use the `add-project` skill)_ | | | |

## 6. Skills you can call

| Skill | Use when |
|---|---|
| `save-session` | End of a task / session: log, lessons, knowledge, open items |
| `add-lesson` | Record a lesson from a mistake right away |
| `tidy-memory` | Merge and clean up memory periodically |
| `add-assistant` | Add a named assistant in the standard format |
| `add-project` | Create a new project |
| `organize-folder` | Set up or clean up the folder structure |
| `health-check` | Check the folder against its rules and this map |
| `setup` | Rebuild or upgrade this set of files |
