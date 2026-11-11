
<!-- secondbrain:start -->
## Second brain

Before starting project or ticket work, use the installed `secondbrain` skill and
consult the local Obsidian vault at `~/.secondbrain/Second Brain` (or
`SECONDBRAIN_ROOT` when configured).

Identify the project and ticket from the request, code path, module, branch,
worktree, and workspace references. Read only the matching project/ticket notes
and relevant linked material before planning, editing code, or choosing commands.
Use recorded commands, queries, decisions, and TODOs as context, checking them
against the current request and code. If the project or ticket is ambiguous, ask only
for the missing information; do not guess.

Allow vault writes only inside its top-level `Diario/` directory for daily summaries
and their history or temporary files. Every other vault path is strictly read-only,
including project and ticket notes, Inbox, templates, indexes, and root history.
Resolve write destinations to keep them within `Diario/`. Return findings and
summaries in chat, in Spanish with English technical terms, and save daily summaries
in `Diario/` unless the user requests chat only. Respect task scope and repository
instructions. If the skill or vault is unavailable, say so and continue using the
context that is available.
<!-- secondbrain:end -->
