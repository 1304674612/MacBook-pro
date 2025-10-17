<!-- cspell:disable -->

# VSCode 拼写 / 语法检查配置指南

## 目录

1. 目标与选择策略
2. 已安装扩展概览
3. cSpell 基础配置说明
4. 自定义词典与忽略路径
5. 中文+英文混合文本优化
6. Markdown / 代码块降噪
7. 性能与排错
8. 何时选择 Spell Right 或 LanguageTool
9. 下一步可扩展

---

## 1. 目标与选择策略

本项目文档与代码混合中英文技术术语 (Miniconda、classpath、xgboost 等)。需要:

- 对技术专有词减少误报
- 支持 Markdown 行内/多行代码块忽略
- 保持性能，不因大型目录 (node_modules, target) 降速

采用 cSpell 为主拼写引擎，必要时可叠加 Spell Right 或 LanguageTool 做语法、风格补充。

## 2. 已安装扩展概览

- cSpell (由 CSpell Tech Updater / Sync 辅助：自动更新共享词汇 & 同步 userWords)
- Spell Right：多语言离线简单拼写
- 可选 LanguageTool：语法与风格检查（未安装；若需要复杂语法请添加）

## 3. cSpell 基础配置说明

`/.vscode/settings.json` 中片段:

````jsonc
"cSpell.language": "en,zh-CN",
"cSpell.enabled": true,
"cSpell.allowCompoundWords": true,
"cSpell.ignorePaths": ["**/node_modules/**","**/.venv/**","target/**","py312-base.yaml"],
"cSpell.words": ["Miniconda","condarc","py312","classpath","Aliyun","Tsinghua","Jupyter","matplotlib","numpy","pandas","xgboost","clangd","corretto"],
"cSpell.ignoreRegExpList": ["/https?:\\/\\/[^\\s]+/","`[^`]+`"],
"cSpell.languageSettings": [{"languageId": "markdown","ignoreRegExpList": ["`[^`]+`","```[\\s\\S]*?```" ]}]
````

要点:

- `allowCompoundWords`: 允许复合单词 (避免如 "dataframe" 被拆分)
- `ignoreRegExpList`: 行内和多行代码块避免标红
- `words`: 项目专有词，后续可增删

## 4. 自定义词典与忽略路径

如需分离配置，可新增 `/.vscode/cspell.json`:

```json
{
  "version": "0.2",
  "language": "en,zh-CN",
  "words": ["brewfile", "corretto", "Miniconda"],
  "ignorePaths": ["**/node_modules/**", "**/dist/**", "**/.git/**"]
}
```

然后在 `settings.json` 添加:

```jsonc
"cSpell.configFile": ".vscode/cspell.json"
```

再添加新词方式：命令面板 -> "cSpell: Add Word to Workspace Dictionary"。

## 5. 中文+英文混合文本优化

建议：

- 避免把中文拼音加入词典，保持对误拼的提示
- 专有英文首字母缩写 (CPU, JVM, UTF) 可加入 `cSpell.words`
- 对中英文混合段落，如 API 名称嵌入中文，可用反引号包裹避免干扰

## 6. Markdown / 代码块降噪

正则忽略:

- 行内代码: `` `[^`]+` ``
- 多行代码块: ` ```[\s\S]*?``` `
- URL: `/https?:\/\/[^\s]+/`

如果仍有误报:

- 在代码块前后加空行
- 确保未嵌套奇怪的缩进（Markdown 解析失败时可能把代码文本当普通段落）

## 7. 性能与排错

- 大目录忽略: `node_modules`, `target`, `.venv` 避免耗时扫描
- 若出现卡顿，可关闭 `allowCompoundWords`
- 若中文误报太多，将 `cSpell.language` 简化为 `en` 再观察差异
- 更新词典后执行: 命令面板 -> `Developer: Reload Window`

常见问题:
| 问题 | 可能原因 | 解决 |
|------|---------|------|
| 合法技术词反复标红 | 未加入词典或大小写不同 | 使用 "Add Word" 添加，或统一小写 |
| 代码块仍标红 | 正则未匹配/插件缓存 | 确认 ignoreRegExpList 正确转义，重载窗口 |
| 性能下降 | 扫描过多目录 | 增加 ignorePaths / 关闭复杂语法扩展 |
| 目录数字行爆红 | Markdown 列表语法异常 | 使用纯有序列表或纯无序列表，不混合 `- 4.` 形式 |

## 8. 何时选择 Spell Right 或 LanguageTool

- Spell Right: 轻量离线，适合快速拼写检查；不做复杂语法
- LanguageTool: 需要风格、语法、语法建议（需联网或本地服务）；文档质量要求高时开启

混合策略：默认仅启用 cSpell + Spell Right；写长技术文档时临时启用 LanguageTool。

## 9. 下一步可扩展

- 添加 `cSpell.diagnosticLevel": "Hint"` 降低视觉噪音
- 集成 pre-commit 钩子调用 `cspell --no-must-find-files '**/*.md'`
- 多语言支持 (添加 `zh-Hans` 或 `ja`) 视文档内容决定
- 自动同步团队词典：Git 管理单独的 `project-words.txt`

---

**快速命令**:

```bash
# 全局安装 cspell CLI（若需要命令行）
npm install -g cspell
# 检查指定文件
cspell docs/conda_setup.md
# 生成建议配置
cspell init
```

遇到格式或目录行再次“爆红”时，优先检查 Markdown 语法的一致性（不要混用 `- 1.` 格式）。

<!-- cspell:enable -->
