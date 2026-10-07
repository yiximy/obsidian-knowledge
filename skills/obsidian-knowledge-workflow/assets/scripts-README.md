# 脚本库

脚本按问题分目录存放：

```text
Knowledge/Scripts/<问题标识>/<脚本文件>
```

每个脚本都必须在对应问题笔记的 frontmatter `scripts` 中登记：

```yaml
scripts:
  - path: Knowledge/Scripts/<问题标识>/<脚本文件>
    tool: powershell | bash | python | node | sql | other
    purpose: 脚本用途
    entrypoint: 执行命令
    risk: read-only | write | destructive
    verified: 2026-10-07
```

规则：

- 问题笔记只保留脚本说明和链接，不粘贴完整脚本正文。
- `read-only` 脚本也必须写清用途；`write` 和 `destructive` 必须显式标记。
- 修改脚本后更新 `verified` 日期，并同步更新对应问题笔记。