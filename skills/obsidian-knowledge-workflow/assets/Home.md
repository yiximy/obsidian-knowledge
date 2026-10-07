---
type: home
updated: 2026-10-07
---

# 知识库

## 问题与排障

![[Knowledge/Problems/_index.base]]

- 问题笔记：`Knowledge/Problems/`
- 关联脚本：`Knowledge/Scripts/`

## 资料与知识

![[Knowledge/Resources/_index.base]]

- Wiki：`Knowledge/wiki/index.md`（首次 ingest 后生成）
- 原始资料：`Knowledge/raw/`
- 资源笔记：`Knowledge/Resources/`

## 查询入口

- 问题与排错：搜索 `Knowledge/Problems`
- 概念与资料：搜索 `Knowledge/wiki`
- 脚本：查看问题笔记的 `scripts` 属性
- 外部资源：搜索 `Knowledge/Resources`

## 整理规则

- 每个问题笔记必须包含 `type: problem`、`domain`、`status`、`tags`。
- 每个资源笔记必须包含 `type: resource`、`domain`、`tags`。
- 每个脚本必须在对应问题笔记的 `scripts` 中登记。
- 新增 `domain` 前先检查已有领域，不要创建近义领域。
- 定期使用 `karpathy-llm-wiki` 执行 ingest、query 和 lint。