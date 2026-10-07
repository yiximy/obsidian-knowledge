# 知识库使用规则

## 目录

- 问题知识库：`Knowledge/Problems`
- 资料库：`Knowledge/Resources`
- 脚本库：`Knowledge/Scripts`
- 问题模板：`Knowledge/Problems/_template.md`
- 统一入口：`Knowledge/Home.md`

## 分类与防乱

- 每个问题笔记必须有 `domain`。允许领域：
  `codex`、`obsidian`、`windows`、`mcp`、`embedded-ai`、`python`、`database`、`network`、`tooling`、`other`
- 新增领域前先检查已有领域，不要创建近义领域。
- 标签用于横向检索，不替代 `domain`。
- 一个稳定问题对应一篇笔记；不同案例追加到「案例记录」。
- 一个问题的脚本统一放在 `Knowledge/Scripts/<问题标识>/`。
- 资料类笔记必须包含 `type: resource`、`domain`、`tags`。
- 统一从 `Knowledge/Home.md` 进入知识库。

## 检索

处理技术问题时：

1. 先通过 Obsidian MCP 搜索错误原文、栈帧、库名、版本号、项目名和标签。
2. 找到已有笔记后先读取，再按已有方案验证。
3. 不要直接新建重复笔记。

## 更新

问题解决后：

1. 更新 `last_verified`、`confidence`、`recurrence`。
2. 把本次环境和版本差异追加到「案例记录」。
3. 方案变化时更新「解决步骤」，旧方案移入「无效方案 / 已废弃方案」。
4. 新问题使用 `_template.md` 新建。
5. `aliases` 中写入原始错误文本，方便搜索。

## 脚本

1. 脚本保存到 `Knowledge/Scripts/<问题标识>/<脚本文件>`。
2. 在问题笔记的 `scripts` 中登记：
   - `path`
   - `tool`：`powershell`、`bash`、`python`、`node`、`sql`、`other`
   - `purpose`
   - `entrypoint`
   - `risk`：`read-only`、`write`、`destructive`
   - `verified`
3. 问题笔记只保留说明和链接，不粘贴完整脚本正文。
4. 修改脚本后更新 `verified`。

## 深度排障模式

复杂问题或概念性查询按以下顺序：

1. 复述问题、影响范围和成功标准。
2. 检索知识库。
3. 收集版本、配置、日志、复现步骤等证据。
4. 提出 2-5 个可验证假设，按成本从低到高验证。
5. 记录每个假设的结果和排除依据。
6. 找到根因后做最小修复并验证。
7. 把调查过程、根因、修复和验证写回知识库。