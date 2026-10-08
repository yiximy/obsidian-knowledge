---
name: obsidian-knowledge-workflow
description: Use when the user wants to save, update, or query knowledge points in an Obsidian knowledge base. Triggers include 保存知识点, 记录问题, 更新知识库, 查询知识库, 整理知识库, 把这个问题记下来.
---

# Obsidian Knowledge Workflow

Use the Obsidian MCP server and this vault structure:

```text
Knowledge/
├─ Problems/
├─ Resources/
├─ Scripts/
└─ Home.md
```

## Initialize a vault

If `Knowledge/` does not exist, copy the bundled assets into the vault:

1. Copy `assets/AGENTS.md` to the vault root as `AGENTS.md` if missing.
2. Copy `assets/CLAUDE.md` to the vault root as `CLAUDE.md` if missing.
3. Create `Knowledge/Problems`, `Knowledge/Resources`, and `Knowledge/Scripts`.
4. Copy `assets/Home.md` to `Knowledge/Home.md`.
5. Copy `assets/_template.md` to `Knowledge/Problems/_template.md`.
6. Copy `assets/problems.base` to `Knowledge/Problems/_index.base`.
7. Copy `assets/resources.base` to `Knowledge/Resources/_index.base`.
8. Copy `assets/scripts-README.md` to `Knowledge/Scripts/README.md`.

Do not overwrite existing files.

## Save a knowledge point

1. Search `Knowledge/Problems` first, using the exact error text, stack frame, library name, version, project and tags.
2. If a matching note exists:
   - Read it.
   - Verify the existing solution.
   - Update `last_verified`, `confidence`, and `recurrence`.
   - Append the new environment and version differences to `案例记录`.
   - Move superseded solutions to `无效方案 / 已废弃方案`.
3. If no matching note exists:
   - Copy `Knowledge/Problems/_template.md`.
   - Create a stable problem title, not a dated title.
   - Fill `domain`, `tags`, `aliases`, symptoms, investigation, root cause, solution and verification.
4. If the solution generated scripts:
   - Save them under `Knowledge/Scripts/<problem-id>/`.
   - Register each script in the problem note's `scripts` frontmatter:
     `path`, `tool`, `purpose`, `entrypoint`, `risk`, `verified`.
   - Add links in `关联脚本`.
5. If the item is only a resource or URL:
   - Save it under `Knowledge/Resources/`.
   - Use `type: resource`, `domain`, `tags`, and `source`.

## Query

- Troubleshooting questions: search `Knowledge/Problems` first.
- Concepts and general knowledge: search `Knowledge/wiki` first.
- External references: search `Knowledge/Resources`.
- Scripts: inspect the `scripts` property of the matching problem note.

## Classification rules

- Every problem note must have a `domain`.
- Reuse existing domains and tags before creating new ones.
- One stable problem equals one note; do not create duplicate notes for each incident.
- Keep one script per generated tool under the matching problem directory.
- Verify YAML frontmatter after editing.