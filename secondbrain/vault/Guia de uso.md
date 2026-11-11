---
tipo: "guia"
creado: "2026-11-09"
actualizado: "2026-11-10"
ejemplo: false
---

# Cómo usar esta bóveda

Español con términos técnicos en inglés. Code, comandos y queries primero; comentarios breves junto al bloque. Evitá párrafos que repitan lo mismo.

## Proyecto

[[Plantillas/Proyecto]]: información reutilizable, Links, Run, Tests, Deploys, SQL, Kubernetes y Accesos.

- Puede ser un repo completo o un módulo de un monorepo.
- Configuración y preparación junto al comando que las necesita.
- Kubernetes sólo con procedimientos propios del proyecto; Accesos sin configuración de Git.
- El home no lista ni referencia tickets.

## Ticket

[[Plantillas/Ticket]]: objetivo, TODO, commands del caso, unit tests relacionados y HTTP directamente en Markdown, con curl o sintaxis JetBrains HTTP. Indicá qué verificar en comentarios o assertions.

La nota y `design.md` (si hay un diseño) van juntos en `Tickets/<ticket>/`. Incluí los requests HTTP en el Markdown del ticket; para bloques largos, usá `<details>`. Las decisiones y avances quedan dentro de la nota. No se crean carpetas por tipo de contenido.

## Diario

[[Plantillas/Diario]]: snapshot del pase diario. Los pasos van como checkboxes y se leen los resúmenes anteriores para arrastrar lo que quedó abierto.

## Uso

- Insertá una plantilla con **Templates: Insert template**.
- Los templates son orientativos: conservá sólo las secciones con datos reales. Omití las que no apliquen, sin texto de relleno.
- Run lleva comandos ejecutables; Tests sólo si existen tests aplicables. No reemplazarlos por explicaciones dentro de un bloque de code.
- La skill identifica proyecto/ticket por path, módulo, branch, worktree y workspace.
- Si falta contexto, usa [[Inbox/Inbox|Inbox]] y pregunta sólo lo necesario.
- Actualizá la nota existente y sus TODOs al avanzar. Conservá cada dato una sola vez.

## Activación

Las instrucciones globales de Codex (`~/.codex/AGENTS.md`) y Claude (`~/.claude/CLAUDE.md`) cargan la skill al trabajar. El bloque portable está en `references/global-instructions.md` dentro de la skill. Para otra máquina, copiá skill y plantillas, agregá el bloque y abrí una sesión nueva.

Las versiones anteriores de las notas se conservan en `.history/`.

[[Inicio|Volver al inicio]]
