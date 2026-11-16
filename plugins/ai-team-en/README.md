# AI Team Starter (plugin `ai-team-en`, English)

Set up your own AI team in a working folder, on Claude and Codex. After install, the agent asks you at most 5 questions, then builds:

- `AGENTS.md` — constitution: general rules shared by Claude and Codex; the AI never edits it on its own
- `CLAUDE.md` — only `@AGENTS.md` + `@START-HERE.md`
- `START-HERE.md` — folder map: tree, task → file table, assistant directory, project table
- `about-me/` — your profile (`profile.md`) and writing voice (`voice.md`)
- `memory/` — lessons, knowledge by topic, one log per session, open items

Add more when needed: `add-assistant` (assistants in a 9-section standard format), `add-project` (projects with a source of truth), `organize-folder` (never deletes), `save-session` (the agent runs it at the end of each task), `add-lesson`, `tidy-memory`, `health-check` (read-only). No invitation? Type `/setup`.

Full guide: README at the repo root.
