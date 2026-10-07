# Obsidian AI Knowledge Kit

一套让 Codex、Claude Code 等 AI 在 Obsidian 中记录、检索和维护知识点的可复用模板。可以作为 Git 仓库分享，也可以把内置 Agent Skill 安装到支持 Agent Skills 的客户端。

## 包含

```text
Knowledge/
├─ Home.md
├─ Problems/       问题、根因、解决方案、案例记录
├─ Resources/      外部资料和网址
├─ Scripts/        与问题关联的脚本
├─ raw/            可选：LLM Wiki 原始资料
└─ wiki/           可选：LLM Wiki 编译后的知识页
AGENTS.md          AI 操作规则
install.ps1        把模板复制进现有 Vault
skills/
└─ obsidian-knowledge-workflow/
   ├─ SKILL.md       Agent Skill
   └─ assets/        初始化 Vault 所需的模板
```

## 使用 Git 仓库

```bash
git clone <你的仓库地址>
cd obsidian-knowledge-kit
```

把 `Knowledge/` 和 `AGENTS.md` 复制进你的 Obsidian Vault，或者运行：

```powershell
.\install.ps1 -VaultPath "D:\你的Vault"
```

## 安装 Agent Skill

如果客户端支持 Agent Skills，可以安装内置 skill。

Codex：

```text
复制 skills/obsidian-knowledge-workflow 到 C:\Users\<用户名>\.agents\skills\
```

Claude Code：

```text
复制 skills/obsidian-knowledge-workflow 到 C:\Users\<用户名>\.claude\skills\
```

发布到 GitHub 后，也可以使用：

```bash
npx skills add <owner>/<repo>
```

Skill 安装后，可以直接对 AI 说：

```text
把这个知识点保存到知识库。
记录一下这个问题的根因和解决步骤。
查询知识库中关于 MCP 的资料。
```

## 保存一个知识点

1. 先搜索 `Knowledge/Problems`，确认是否已有相同问题。
2. 如果已有：更新 `last_verified`、`confidence`、`recurrence`，并把本次差异追加到「案例记录」。
3. 如果没有：复制 `Knowledge/Problems/_template.md`，填写：
   - `domain`：领域
   - `tags`：横向检索标签
   - 症状、调查过程、根因、解决步骤、验证
4. 如果生成脚本：保存到 `Knowledge/Scripts/<问题标识>/`，并在问题笔记的 `scripts` 中登记。
5. 如果只是资料或网址：保存到 `Knowledge/Resources/`，使用 `type: resource`。
6. 定期检查重复标签、孤立笔记和失效链接。

## 领域分类

当前建议领域：

```text
codex
obsidian
windows
mcp
embedded-ai
python
database
network
tooling
other
```

新增领域前先检查已有领域，不要创建近义领域。

## 发布到 GitHub

```bash
git branch -M main
git remote add origin https://github.com/<owner>/<repo>.git
git push -u origin main
```

发布后，其他人可以直接 clone：

```bash
git clone https://github.com/<owner>/<repo>.git
```

也可以安装 Agent Skill：

```bash
npx skills add <owner>/<repo>
```
## MCP 配置

Codex：

```powershell
[Environment]::SetEnvironmentVariable('OBSIDIAN_API_KEY','<API Key>','User')
codex mcp add obsidian --url http://127.0.0.1:27123/mcp/ --bearer-token-env-var OBSIDIAN_API_KEY
```

Claude Code：

```powershell
claude mcp add --scope user --transport http obsidian `
  http://127.0.0.1:27123/mcp/ `
  --header "Authorization: Bearer <API Key>"
```

其他支持 Streamable HTTP 的客户端：

```json
{
  "mcpServers": {
    "obsidian": {
      "url": "http://127.0.0.1:27123/mcp/",
      "headers": { "Authorization": "Bearer <API Key>" }
    }
  }
}
```

## License

MIT