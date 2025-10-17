<!-- cspell:disable -->

# Pre-commit 拼写检查设置指南

## 已完成配置

### 1. 扩展安装

- **Code Spell Checker** (streetsidesoftware.code-spell-checker): VSCode 主力拼写检查引擎

### 2. 忽略文件 (.cspellignore)

排除路径:

- 构建输出: `target/`, `dist/`, `build/`
- 依赖: `node_modules/`, `.venv/`, `__pycache__/`
- 锁文件: `*.lock`, `py312-base.yaml`
- 二进制/媒体: `*.png`, `*.jpg`, `*.woff` 等

### 3. 精简词表

`/.vscode/settings.json` 中仅保留核心术语:

```json
"cSpell.words": ["Miniconda","condarc","clangd","xgboost","scikit","corretto","brewfile"]
```

常见包名(numpy, pandas, matplotlib 等)已被默认字典覆盖,无需手动添加。

### 4. Pre-commit 钩子 (`.husky/pre-commit`)

功能:

- 自动检查 staged 文本文件 (`.md`, `.java`, `.py`, `.c`, `.cpp`, `.js` 等)
- 使用 cspell CLI 执行拼写校验
- 发现错误时阻止提交并提示修复或添加词汇
- 跳过方式: `git commit --no-verify`

工作流:

```bash
# 正常提交(自动触发检查)
git add docs/conda_setup.md
git commit -m "Update docs"
# → 若有拼写错误则中断并提示

# 跳过检查(紧急场景)
git commit --no-verify -m "WIP"
```

## 使用前提

需要安装 Node.js 与 cspell CLI:

```bash
# 安装 Node.js (推荐使用 nvm 或 Homebrew)
brew install node

# 全局安装 cspell
npm install -g cspell

# 或在项目内安装(需先有 Node.js)
cd /Users/kiko/code
npm install
```

## 禁用 Spell Right 扩展 (避免中文误报)

若仍看到大量中文红色波浪线, 可能是 VSCode 的 **Spell Right** 扩展在工作, 可在 `/.vscode/settings.json` 中加入:

```jsonc
"spellright.enabled": false
```

然后重新加载 VSCode 窗口 (命令面板输入: "Reload Window")。

## 手动拼写检查

```bash
# 检查所有文本文件
npm run spell

# 检查特定文件
cspell docs/*.md

# 检查 staged 文件
npm run spell:staged
```

## 添加自定义词汇

方式 1(推荐): VSCode 命令面板 → "cSpell: Add Word to Workspace Dictionary"

方式 2: 编辑 `/.vscode/cspell.json` 或 `settings.json` 的 `words` 数组。

## 常见问题

| 问题                        | 解决                                       |
| --------------------------- | ------------------------------------------ |
| `command not found: cspell` | 安装 Node.js + `npm install -g cspell`     |
| 钩子不执行                  | 检查 `.husky/pre-commit` 可执行权限        |
| 误报技术词                  | 添加到 `cSpell.words` 或项目 `cspell.json` |
| 大量中文误报                | 已通过正则忽略 `[\\u4e00-\\u9fa5]+` 解决   |

## 禁用钩子(临时)

```bash
# 单次跳过
git commit --no-verify -m "message"

# 永久禁用(移除钩子)
rm .husky/pre-commit
```

---

**建议**: 先手动运行 `cspell docs/*.md` 修复存量问题,再启用自动钩子。

<!-- cspell:enable -->
