---
tipo: "captura"
estado: "borrador"
creado: "2026-11-10"
actualizado: "2026-11-10"
origen: "chat: instalación de la skill secondbrain en otra máquina y persistencia de instrucciones"
ejemplo: false
tags:
  - herramientas
  - opencode
  - codex
---

# Instalación de la skill secondbrain

Repo `~/orca/projects/secondbrain` (skill) y bóveda `~/.secondbrain/Second Brain` (datos, fuera del repo).

## Estado

```bash
cd ~/orca/projects/secondbrain
git ls-files | wc -l   # 0: todo el working tree sin commitear
git remote -v          # vacío: sin backup remoto
```

Los globales se instalaron copiando el bloque de `skills/secondbrain/references/global-instructions.md`:

- `~/.codex/AGENTS.md`
- `~/.claude/CLAUDE.md`
- OpenCode: sin `AGENTS.md` global; descubre la skill por `~/.agents/skills/secondbrain`.

## Instalar en otra máquina

```bash
DEST=usuario@maquina   # ajustar
scp -r "$HOME/orca/projects/secondbrain" "$HOME/.secondbrain" "$DEST:~/"

ssh "$DEST" '
  mkdir -p ~/.agents/skills ~/.codex/skills ~/.claude/skills ~/.config/opencode/skills
  for d in ~/.agents/skills ~/.codex/skills ~/.claude/skills ~/.config/opencode/skills; do
    ln -sfn ~/secondbrain/skills/secondbrain "$d/secondbrain"
  done'
```

Instrucciones globales por agente: Codex `~/.codex/AGENTS.md`, Claude Code `~/.claude/CLAUDE.md`, OpenCode `~/.config/opencode/AGENTS.md` (V2 no lee `CLAUDE.md`).

## Propuesta

1. Commitear `README.md` y `skills/`: sin eso no sobreviven un clone ni la pérdida del disco.
2. Pasar la instalación a `scripts/install.sh` idempotente (symlinks + bloque con marcador `secondbrain:start`) e invocarlo desde el README.
3. En OpenCode evitar copiar el bloque: `"instructions": ["~/secondbrain/skills/secondbrain/references/global-instructions.md"]` en `~/.config/opencode/opencode.jsonc`. Codex y Claude Code no tienen include: siguen necesitando append o symlink.
4. Agregar remote para persistir el repo fuera de la máquina.
5. Deduplicar instrucciones: resuelto eliminando `AGENTS.md` y `CLAUDE.md` (ver Decisión).

## `AGENTS.md` del repo

Carga en cada turno para sesiones abiertas bajo `~/orca/projects/secondbrain`; no aplica fuera de ese árbol. Su función real es el caso en que la skill **no** se carga: editar la skill no cumple su `description`, así que un agente puede entrar al repo sin leer `SKILL.md`.

Duplicación medida: 10 de sus 11 reglas ya están en `SKILL.md`. Único aporte propio: identidad del repo (la skill no la bóveda), el bootstrap "leé `SKILL.md`" y el no commitear.

Versión mínima propuesta:

```markdown
# Second brain

Este repo contiene la skill del second brain (`skills/secondbrain/`), no la bóveda:
la memoria vive en `~/.secondbrain/Second Brain`.

- Antes de tocar la skill o la bóveda, leé `skills/secondbrain/SKILL.md`.
- Instrucciones y metadatos de la skill en inglés; contenido de la bóveda en español.
- No commitees ni publiques sin pedido explícito.
```

`CLAUDE.md` depende de este archivo: si se borra, hay que actualizarlo.

## Decisión (2026-11-10)

Se eliminaron `AGENTS.md` y `CLAUDE.md`: 10 de 11 reglas duplicaban `SKILL.md` y ninguno estaba commiteado, así que no había historial que preservar. El repo queda sin instrucciones de proyecto; se acepta el costo de que un agente que edite la skill no tenga bootstrap propio (el bloque global sigue aplicando). README reducido a instalación y estructura de la bóveda.

## Pendiente

- ¿Remote y visibilidad del repo?
- ¿`Plantillas/` sigue en la bóveda o se versiona en el repo?
