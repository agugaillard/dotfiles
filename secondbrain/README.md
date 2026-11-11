# Obsidian second brain

Agent skill to read and update an Obsidian vault, plus a starter vault in `vault/`. The
live vault stays at `~/.secondbrain/Second Brain` (or `SECONDBRAIN_ROOT`). Skill
instructions are English; vault content is Spanish with English technical terms.

## Install

```bash
mkdir -p ~/.agents/skills/secondbrain \
         ~/.claude/skills/secondbrain ~/.config/opencode/skills/secondbrain

cp -R skills/secondbrain/. ~/.agents/skills/secondbrain/ # Codex, OpenCode
cp -R skills/secondbrain/. ~/.claude/skills/secondbrain/ # Claude

# Required: consult the vault at session start, before selecting the skill.
cat skills/secondbrain/references/global-instructions.md >> ~/.codex/AGENTS.md # Codex
cat skills/secondbrain/references/global-instructions.md >> ~/.claude/CLAUDE.md # Claude
cat skills/secondbrain/references/global-instructions.md >> ~/.config/opencode/AGENTS.md # OpenCode
```

## Vault

```bash
mkdir -p ~/.secondbrain/"Second Brain"
cp -R vault/. ~/.secondbrain/"Second Brain"/
```

