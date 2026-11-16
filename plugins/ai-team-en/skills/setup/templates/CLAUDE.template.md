@AGENTS.md

## Claude only

- Ask choices with the built-in question tool (`AskUserQuestion`) when available; at most one question at a time.
- Work that needs a later check (deploys, background jobs, waiting for a reply) → schedule a reminder if a tool for it exists.
