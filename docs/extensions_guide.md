# VSCode 扩展使用指南

## 已安装的扩展列表

### 🔧 C/C++ 开发
1. **C/C++ Extension Pack** (ms-vscode.cpptools-extension-pack)
   - 功能: IntelliSense, 调试, 代码浏览
   - 用途: C/C++ 开发基础套件

2. **clangd** ⭐ NEW (llvm-vs-code-extensions.vscode-clangd)
   - 功能: 基于 LLVM 的语言服务器
   - 优势: 比 cpptools 更快的代码补全和更准确的错误检测
   - 使用: 安装后自动工作,支持 C++20/23 新特性
   - ⚠️ 注意: 可能与 cpptools 冲突,建议在设置中禁用 cpptools 的 IntelliSense

3. **Better C++ Syntax** ⭐ NEW (jeff-hykin.better-cpp-syntax)
   - 功能: 增强的 C++ 语法高亮
   - 优势: 更精确的语法着色,支持现代 C++ 特性
   - 用途: 提升代码可读性

4. **CMake Tools** (ms-vscode.cmake-tools)
   - 功能: CMake 项目支持
   - 用途: 如果项目使用 CMake 构建

### ☕ Java 开发
1. **Extension Pack for Java** (vscjava.vscode-java-pack)
   - 包含: Language Support, Debugger, Maven, Test Runner
   - 功能: Java 开发全家桶

2. **Spring Boot Tools** ⭐ NEW (vmware.vscode-spring-boot)
   - 功能: Spring Boot 项目智能提示
   - 支持: application.properties, application.yml
   - 用途: Spring/Spring Boot 开发必备

### 🐍 Python 开发
1. **Python** (ms-python.python)
   - 功能: Python 语言支持、调试、测试

2. **Pylance** (ms-python.vscode-pylance)
   - 功能: 高性能 Python 语言服务器
   - 优势: 类型检查、智能补全、快速导航

### 🚀 通用工具
1. **Code Runner** ⭐ NEW (formulahendry.code-runner)
   - 功能: 一键运行代码片段
   - 支持: C, C++, Java, Python, JavaScript 等 40+ 语言
   - 快捷键: `Ctrl+Alt+N` (macOS: `⌃⌥N`)
   - 用途: 快速测试代码片段,无需配置

2. **GitHub Copilot** (github.copilot)
   - 功能: AI 代码助手
   - 用途: 代码补全、生成、重构

3. **GitHub Copilot Chat** (github.copilot-chat)
   - 功能: AI 对话式编程助手
   - 用途: 代码解释、问题解答、代码审查

4. **GitLens** (eamodio.gitlens)
   - 功能: Git 历史可视化
   - 用途: 代码作者追踪、分支对比

5. **IntelliCode** (visualstudioexptteam.vscodeintellicode)
   - 功能: AI 辅助的代码补全
   - 用途: 基于最佳实践的智能建议

6. **EditorConfig** (editorconfig.editorconfig)
   - 功能: 统一代码风格
   - 用途: 团队协作时保持一致的格式化规则

7. **Docker** (ms-azuretools.vscode-docker)
   - 功能: Docker 容器管理
   - 用途: 容器化应用开发

## 🎯 快速使用指南

### Code Runner 使用
```bash
# 运行当前文件
快捷键: Ctrl+Alt+N (macOS: ⌃⌥N)

# 运行选中代码
选中代码后按快捷键

# 停止运行
快捷键: Ctrl+Alt+M (macOS: ⌃⌥M)
```

### clangd vs cpptools
如果要使用 clangd (推荐),需要在 `.vscode/settings.json` 添加:
```json
{
  "C_Cpp.intelliSenseEngine": "disabled",
  "clangd.path": "clangd"
}
```

### Spring Boot 智能提示
在 `application.properties` 或 `application.yml` 中输入 `spring.` 即可看到所有配置项提示。

## 📝 可选扩展推荐

### C/C++ 进阶
- **Makefile Tools** (ms-vscode.makefile-tools): Makefile 项目支持
- **C/C++ Runner** (franneck94.c-cpp-runner): 快速编译运行单文件

### Java 进阶
- **Spring Boot Extension Pack** (vmware.vscode-boot-dev-pack): Spring 全家桶
- **Oracle Java** (oracle.oracle-java): Oracle 官方 Java 扩展

### 代码质量
- **Trunk Code Quality** (trunk.io): 统一的代码格式化和静态分析
- **Tabnine** (tabnine.tabnine-vscode): 另一款 AI 代码助手(Copilot 替代品)

## 🔥 性能优化提示

1. **禁用不需要的扩展**: 在特定语言项目中禁用其他语言扩展
2. **使用 clangd 代替 cpptools IntelliSense**: 更快更准确
3. **配置 Code Runner 输出**: 可以在设置中自定义运行命令
4. **定期更新扩展**: 获取最新功能和性能改进

## 🆘 故障排除

### clangd 无法工作
1. 确保已安装 Clang: `clang --version`
2. 检查 clangd 路径: `which clangd`
3. 重启 VSCode

### Code Runner 输出乱码
在设置中搜索 "code-runner.executorMap",修改编译参数添加 `-fexec-charset=UTF-8`

### Spring Boot 提示不工作
1. 确保项目有 `pom.xml` 或 `build.gradle`
2. 重新加载 Java 项目: `Cmd+Shift+P` → "Java: Clean Java Language Server Workspace"
