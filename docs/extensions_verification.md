# VSCode 扩展安装验证

## ✅ 本次会话已安装的扩展

### 第一批 - C/C++/Java 增强 (2025-10-16 第一轮)
1. ✅ **formulahendry.code-runner** - Code Runner (一键运行代码)
2. ✅ **llvm-vs-code-extensions.vscode-clangd** - clangd (C/C++ 语言服务器)
3. ✅ **jeff-hykin.better-cpp-syntax** - Better C++ Syntax (语法高亮)
4. ✅ **vmware.vscode-spring-boot** - Spring Boot Tools (Spring 开发)

### 第二批 - 视觉和生产力 (2025-10-16 第二轮)
5. ✅ **pkief.material-icon-theme** - Material Icon Theme (文件图标)
6. ✅ **dracula-theme.theme-dracula** - Dracula Theme (深色主题)
7. ✅ **gruntfuggly.todo-tree** - Todo Tree (TODO 管理)
8. ✅ **alefragnani.bookmarks** - Bookmarks (代码书签)
9. ✅ **shd101wyy.markdown-preview-enhanced** - Markdown Preview Enhanced
10. ✅ **esbenp.prettier-vscode** - Prettier (代码格式化)

### 已有扩展 (之前安装)
- ✅ ms-vscode.cpptools-extension-pack (C/C++ Extension Pack)
- ✅ ms-vscode.cmake-tools (CMake Tools)
- ✅ vscjava.vscode-java-pack (Extension Pack for Java)
- ✅ ms-python.python (Python)
- ✅ ms-python.vscode-pylance (Pylance)
- ✅ github.copilot (GitHub Copilot)
- ✅ github.copilot-chat (GitHub Copilot Chat)
- ✅ eamodio.gitlens (GitLens)
- ✅ visualstudioexptteam.vscodeintellicode (IntelliCode)
- ✅ editorconfig.editorconfig (EditorConfig)
- ✅ ms-azuretools.vscode-docker (Docker)

## 🎯 如何验证扩展已安装

### 方法 1: 在 VSCode 中查看
1. 打开 VSCode
2. 点击左侧活动栏的"扩展"图标 (或按 `Cmd+Shift+X`)
3. 在搜索框中输入扩展名称,已安装的会显示"已安装"标记

### 方法 2: 使用扩展功能
验证这些扩展是否生效:

#### ✅ Code Runner
- 打开任何代码文件 (C/Java/Python)
- 右键 → 应该能看到 "Run Code" 选项
- 或按快捷键 `⌃⌥N`

#### ✅ Todo Tree
- 在代码中添加注释: `// TODO: 测试`
- 左侧边栏应该出现 "Todo Tree" 面板
- 点击应该能看到所有 TODO 项

#### ✅ Bookmarks
- 在任意代码行按 `Cmd+Opt+K`
- 左侧应该出现书签面板
- 该行左侧会出现书签图标

#### ✅ Material Icon Theme
- 打开文件浏览器
- 文件和文件夹应该有彩色图标
- 如果没有,按 `Cmd+Shift+P` → "File Icon Theme" → 选择 "Material Icon Theme"

#### ✅ Dracula Theme
- 按 `Cmd+K Cmd+T` 打开主题选择器
- 应该能看到 "Dracula" 主题选项
- 选择后界面变为 Dracula 配色

#### ✅ Prettier
- 打开任何 JS/TS/JSON/CSS 文件
- 右键 → "Format Document" 或按 `Shift+Opt+F`
- 代码应该自动格式化

#### ✅ Markdown Preview Enhanced
- 打开或创建 `.md` 文件
- 右键 → 应该能看到 "Markdown Preview Enhanced" 相关选项
- 或按 `Cmd+K V` 打开侧边预览

#### ✅ clangd
- 打开 C/C++ 文件
- 输入代码时应该有更快的智能补全
- 错误提示更准确

#### ✅ Spring Boot Tools
- 创建 `application.properties` 文件
- 输入 `spring.` 应该有自动补全提示

## 🚫 如果扩展没有生效

### 1. 重启 VSCode
最简单的解决方案:
```bash
# 完全退出 VSCode
Cmd+Q

# 重新打开
open -a "Visual Studio Code"
```

### 2. 检查扩展是否启用
- `Cmd+Shift+X` 打开扩展面板
- 找到对应扩展
- 确保没有 "禁用" 按钮 (如果有,点击启用)

### 3. 查看扩展输出
- `Cmd+Shift+U` 打开输出面板
- 右侧下拉菜单选择对应的扩展
- 查看是否有错误信息

### 4. 重新安装扩展
如果某个扩展有问题:
- 在扩展面板找到它
- 点击 "卸载"
- 重新搜索并安装

## 📝 扩展配置文件位置

所有扩展配置保存在:
```
~/.vscode/extensions/
```

工作区设置:
```
/Users/kiko/code/.vscode/settings.json
```

## 🆘 需要帮助?

如果某个特定扩展无法使用,告诉我:
1. 扩展名称
2. 期望的功能
3. 实际发生了什么

我会帮你排查问题!
