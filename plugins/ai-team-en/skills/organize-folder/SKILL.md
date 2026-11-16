---
name: organize-folder
description: Set up a tidy folder structure for a working folder, or clean up a messy one — propose first, move only with the user's consent, never delete (cleaning up = moving to archive/). Use when the user says "organize my folder", "clean up files", "this folder is a mess", "set up folders", "sắp xếp thư mục", "dọn folder".
---

# organize-folder — Set up or clean up folders

## Standard structure

```
<folder>/
├── AGENTS.md          ← constitution (general rules)
├── CLAUDE.md          ← @AGENTS.md + @START-HERE.md
├── START-HERE.md      ← folder map: tree, task → file, assistants, projects
├── about-me.md        ← user profile + voice
├── memory/            ← MEMORY.md, lessons.md, topics/, sessions/
├── assistants/<name>/ ← ROLE.md, lessons.md, outputs/
├── projects/<name>/   ← BRIEF.md, lessons.md + all project files
├── docs/              ← shared documents that belong to no project
└── archive/           ← things cleaned up; nothing is deleted
```

If the user already has a structure that works → keep it and just write the rules down clearly. Don't force folder renames.

## Step 1 — Look and propose (move nothing yet)

1. List the root and one level below. Skip system folders (`.git`, `.claude`, `.codex`, `node_modules`, `.venv`…) and anything that looks like passwords or secret keys.
2. Make a proposal table: `| File/folder | Now in | Move to | Why |`.
   - Clearly belongs to a project → `projects/<name>/`.
   - Temporary files, old versions, duplicates → `archive/`.
   - Unsure → leave it, mark "ask the user".
3. A folder that is a git repo (has `.git`) → do **not** move files inside it; propose at folder level only.

## Step 2 — Act after consent

1. The user can approve all, some, or edit the proposal.
2. Only **move**. Never delete. **Keep file names**; rename only when a name clashes at the destination (add a date suffix, never overwrite) or when the user approved a specific rename listed in the Step 1 table.
3. Count files before and after; the two numbers must match.
4. Update the **tree** in `START-HERE.md` to match the real structure, including folders the user keeps (one line of explanation per branch). No `START-HERE.md` → offer `setup`.

## Step 3 — Report

Start with **DONE —** or **NOT DONE —**: how many items moved, file count before/after, which items still await the user's decision.
