<!-- cspell:disable -->

# VSCode 扩展使用指南

## 已安装的扩展列表

### 🔧 C/C++ 开发

1. **C/C++ Extension Pack** (ms-vscode.cpptools-extension-pack)

   - 功能: IntelliSense, 调试, 代码浏览
   - 用途: C/C++ 开发基础套件

2. **clangd** ⭐ (llvm-vs-code-extensions.vscode-clangd)

   - 功能: 基于 LLVM 的语言服务器
   - 优势: 比 cpptools 更快的代码补全和更准确的错误检测
   - 使用: 安装后自动工作,支持 C++20/23 新特性
   - ⚠️ 注意: 可能与 cpptools 冲突,建议在设置中禁用 cpptools 的 IntelliSense

3. **Better C++ Syntax** ⭐ (jeff-hykin.better-cpp-syntax)

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

2. **Spring Boot Tools** ⭐ (vmware.vscode-spring-boot)
   - 功能: Spring Boot 项目智能提示
   - 支持: application.properties, application.yml
   - 用途: Spring/Spring Boot 开发必备

### 🐍 Python 开发

1. **Python** (ms-python.python)

   - 功能: Python 语言支持、调试、测试
   - 版本: Python 3.14.0

2. **Pylance** (ms-python.vscode-pylance)
   - 功能: 高性能 Python 语言服务器
   - 优势: 类型检查、智能补全、快速导航

### 🎨 主题和图标

1. **Material Icon Theme** ⭐ NEW (pkief.material-icon-theme)

   - 功能: 文件和文件夹图标美化
   - 特点: 支持 500+ 文件类型,自定义颜色
   - 安装量: 3100 万+

2. **Dracula Theme** ⭐ NEW (dracula-theme.theme-dracula)
   - 功能: 护眼深色主题
   - 特点: 高对比度,支持所有编程语言
   - 安装量: 950 万+

### 📝 Markdown 增强

1. **Markdown Preview Enhanced** ⭐ NEW (shd101wyy.markdown-preview-enhanced)
   - 功能: 超强 Markdown 预览
   - 特性: 数学公式、Mermaid 流程图、导出 PDF/HTML
   - 安装量: 784 万+

### ✅ 生产力工具

1. **Todo Tree** ⭐ NEW (gruntfuggly.todo-tree)

   - 功能: 树状视图显示所有 TODO/FIXME
   - 特点: 自动扫描工作区,支持自定义标签
   - 安装量: 654 万+

2. **Bookmarks** ⭐ NEW (alefragnani.bookmarks)

   - 功能: 代码行书签和快速跳转
   - 快捷键: Cmd+Opt+K 添加, Cmd+Opt+J/L 跳转
   - 安装量: 460 万+

3. **Prettier** ⭐ NEW (esbenp.prettier-vscode)
   - 功能: 代码自动格式化
   - 支持: JS/TS/CSS/HTML/JSON/Markdown 等
   - 安装量: 6189 万+ (最流行的格式化工具)

### 🚀 通用工具

1. **Code Runner** ⭐ (formulahendry.code-runner)

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

## � 主题和外观

### Material Icon Theme ⭐ NEW

1. **启用图标主题**: `Cmd+Shift+P` → "File Icon Theme" → 选择 "Material Icon Theme"
2. **自定义配置**: 支持多种图标风格和颜色
3. **文件夹图标**: 特定文件夹(如 src, test, docs)有独特图标

### Dracula Theme ⭐ NEW

1. **切换主题**: `Cmd+K Cmd+T` 或 `Cmd+Shift+P` → "Color Theme" → "Dracula"
2. **特点**: 护眼深色,高对比度,支持多种语言语法高亮
3. **官方主题**: 全球 1000+ 编辑器和工具统一主题

## 📝 Markdown 增强

### Markdown Preview Enhanced ⭐ NEW

1. **预览**: 右键 Markdown 文件 → "Markdown Preview Enhanced: Open Preview"
2. **快捷键**: `Cmd+K V` (侧边预览) 或 `Cmd+Shift+V` (标签预览)
3. **导出 PDF**: 预览窗口右键 → "Chrome (Puppeteer) → PDF"
4. **特性**: 支持数学公式 (KaTeX)、Mermaid 流程图、PlantUML、代码块运行

**示例 - 在 Markdown 中添加流程图:**

````markdown
```mermaid
graph TD
    A[开始] --> B{条件判断}
    B -->|是| C[执行操作]
    B -->|否| D[结束]
    C --> D
```
````

## ✅ TODO 管理

### Todo Tree ⭐ NEW

1. **查看 TODO**: 侧边栏自动显示 "Todo Tree" 面板
2. **支持标签**: TODO, FIXME, HACK, XXX, BUG, NOTE 等
3. **自定义高亮**: 在设置中配置不同标签的颜色和图标
4. **快速跳转**: 点击 TODO 项直接跳转到代码位置

**在代码中使用:**

```java
// TODO: 实现用户登录功能
// FIXME: 修复空指针异常
// HACK: 临时解决方案,需要重构
```

## 🔖 书签管理

### Bookmarks ⭐ NEW

1. **添加书签**: `Cmd+Opt+K` (Toggle Bookmark)
2. **跳转书签**:
   - `Cmd+Opt+J` (跳转到下一个书签)
   - `Cmd+Opt+L` (跳转到上一个书签)
3. **查看所有书签**: 侧边栏 "Bookmarks" 面板
4. **带标签书签**: `Cmd+Shift+P` → "Bookmarks: Toggle Labeled"

## 💅 代码格式化

### Prettier ⭐ NEW

1. **格式化快捷键**: `Shift+Opt+F` 或右键 → "Format Document"
2. **保存时自动格式化**:
   ```json
   {
     "editor.formatOnSave": true,
     "editor.defaultFormatter": "esbenp.prettier-vscode"
   }
   ```
3. **支持语言**: JavaScript, TypeScript, CSS, HTML, JSON, Markdown, YAML
4. **配置文件**: 创建 `.prettierrc` 自定义规则
   ```json
   {
     "semi": true,
     "singleQuote": true,
     "tabWidth": 2,
     "printWidth": 100
   }
   ```

## �🆘 故障排除

### clangd 无法工作

1. 确保已安装 Clang: `clang --version`
2. 检查 clangd 路径: `which clangd`
3. 重启 VSCode

### Code Runner 输出乱码

在设置中搜索 "code-runner.executorMap",修改编译参数添加 `-fexec-charset=UTF-8`

### Spring Boot 提示不工作

1. 确保项目有 `pom.xml` 或 `build.gradle`
2. 重新加载 Java 项目: `Cmd+Shift+P` → "Java: Clean Java Language Server Workspace"

### Prettier 不格式化

1. 检查是否设置了默认格式化器
2. 确保文件类型在 Prettier 支持列表中
3. 查看输出面板 "Prettier" 频道的错误信息
4. **✅ 已解决**: 已创建 `.prettierrc` 和 `.prettierignore` 配置文件,并在 VS Code 设置中启用自动格式化

## 🔍 扩展健康检查报告 (2025-10-16)

### ✅ 已安装扩展 (共 40 个)

#### 核心开发扩展

| 扩展名                  | 版本      | 状态    | 备注                            |
| ----------------------- | --------- | ------- | ------------------------------- |
| **Python**              | 2025.16.0 | ✅ 正常 | Python 3.14 支持                |
| **Pylance**             | 2025.8.3  | ✅ 正常 | 语言服务器正常                  |
| **Java**                | 1.46.0    | ✅ 正常 | Java 21 支持                    |
| **Java Extension Pack** | 0.30.3    | ✅ 正常 | 完整套件                        |
| **clangd**              | 0.2.0     | ✅ 正常 | Apple clangd 17.0.0             |
| **C/C++ Tools**         | 1.27.7    | ✅ 正常 | IntelliSense 已禁用,使用 clangd |
| **Spring Boot Tools**   | 1.64.0    | ✅ 正常 | Spring 配置提示正常             |

#### 生产力工具

| 扩展名                  | 版本    | 状态    | 备注             |
| ----------------------- | ------- | ------- | ---------------- |
| **GitHub Copilot**      | 1.372.0 | ✅ 正常 | AI 代码助手      |
| **GitHub Copilot Chat** | 0.32.1  | ✅ 正常 | AI 对话助手      |
| **GitLens**             | 17.6.1  | ✅ 正常 | Git 历史可视化   |
| **Code Runner**         | 0.12.2  | ✅ 正常 | 快速运行代码     |
| **Prettier**            | 11.0.0  | ✅ 正常 | 已配置自动格式化 |
| **Todo Tree**           | 0.0.226 | ✅ 正常 | TODO 管理        |
| **Bookmarks**           | 13.5.0  | ✅ 正常 | 代码书签         |

#### 主题和外观

| 扩展名                  | 版本   | 状态    | 备注         |
| ----------------------- | ------ | ------- | ------------ |
| **Material Icon Theme** | 5.27.0 | ✅ 正常 | 文件图标美化 |
| **Dracula Theme**       | 2.25.1 | ✅ 正常 | 深色主题     |

#### 文档工具

| 扩展名                        | 版本   | 状态    | 备注         |
| ----------------------------- | ------ | ------- | ------------ |
| **Markdown Preview Enhanced** | 0.8.19 | ✅ 正常 | 增强预览支持 |

#### 其他工具

| 扩展名           | 版本    | 状态    | 备注           |
| ---------------- | ------- | ------- | -------------- |
| **Docker**       | 2.0.0   | ✅ 正常 | 容器管理       |
| **IntelliCode**  | 1.3.2   | ✅ 正常 | AI 代码补全    |
| **EditorConfig** | 0.17.4  | ✅ 正常 | 代码风格统一   |
| **CMake Tools**  | 1.21.36 | ✅ 正常 | CMake 项目支持 |

#### 小程序开发

| 扩展名             | 版本   | 状态    | 备注           |
| ------------------ | ------ | ------- | -------------- |
| **微信小程序**     | 2.4.14 | ✅ 正常 | minapp-vscode  |
| **小程序扩展**     | 1.5.1  | ✅ 正常 | crazyurus      |
| **小程序代码片段** | 0.4.11 | ✅ 正常 | wechat-snippet |

#### Java 专项工具

| 扩展名                    | 版本   | 状态    | 备注                       |
| ------------------------- | ------ | ------- | -------------------------- |
| **Java Upgrade**          | 1.6.1  | ✅ 正常 | Java 项目升级工具          |
| **Migrate Java to Azure** | 1.5.3  | ✅ 正常 | Azure 迁移工具             |
| **Gradle**                | 3.17.0 | ✅ 正常 | Gradle 支持                |
| **Maven**                 | 0.44.0 | ✅ 正常 | 扩展正常; CLI 已安装 3.9.9 |

### ⚙️ 系统环境检查

| 项目         | 状态      | 版本/路径                     |
| ------------ | --------- | ----------------------------- |
| **clangd**   | ✅ 正常   | Apple clangd 17.0.0 (arm64)   |
| **Java**     | ✅ 正常   | OpenJDK 21.0.8 (Corretto)     |
| **Python**   | ✅ 正常   | Python 3.14 (虚拟环境)        |
| **Maven**    | ✅ 已安装 | 3.9.9 /Users/kiko/tools/maven |
| **编码设置** | ✅ 正常   | UTF-8                         |

### 🔧 配置状态

| 配置项            | 状态    | 说明                                      |
| ----------------- | ------- | ----------------------------------------- |
| **Prettier 配置** | ✅ 完整 | `.prettierrc` 和 `.prettierignore` 已创建 |
| **clangd 配置**   | ✅ 正确 | cpptools IntelliSense 已禁用              |
| **Python 环境**   | ✅ 正确 | 指向项目虚拟环境                          |
| **Code Runner**   | ✅ 正确 | UTF-8 编码配置完整                        |
| **格式化设置**    | ✅ 完整 | 保存时自动格式化已启用                    |

### ⚠️ 发现的问题

当前无阻塞性问题。Maven 已通过二进制方式安装 (3.9.9)，如需进一步优化可配置国内镜像提升依赖下载速度。

### 🎯 扩展冲突检查

- ✅ **无冲突**: clangd 和 cpptools 配置正确(cpptools IntelliSense 已禁用)
- ✅ **无过期扩展**: 所有扩展都是最新版本
- ✅ **无重复扩展**: 未发现功能重复的扩展

### 📊 扩展性能评估

| 类别       | 扩展数量 | 性能影响                   |
| ---------- | -------- | -------------------------- |
| 语言服务器 | 6        | 中等 (Python, Java, C/C++) |
| AI 助手    | 2        | 中等 (Copilot)             |
| 主题/图标  | 2        | 低                         |
| 生产力工具 | 8        | 低                         |
| 项目工具   | 22       | 低-中等                    |
| **总计**   | **40**   | **中等**                   |

### 💡 优化建议

1. **性能优化**

   - ✅ 已禁用不需要的 IntelliSense (cpptools)
   - ✅ clangd 配置良好
   - ✅ Python 环境隔离

2. **配置完善**

   - ✅ Prettier 配置已添加
   - ✅ 编码设置完整
   - ✅ 格式化规则统一

3. **可选改进**
   - 考虑安装 Maven 以支持命令行构建
   - 可以根据项目类型禁用不相关的扩展

### 🚀 下一步操作建议

1. **测试 Prettier**

   - 打开任意 JS/JSON/Markdown 文件
   - 按 `Shift+Opt+F` 格式化
   - 或保存文件自动格式化

2. **验证 clangd**

   - 打开 C/C++ 文件测试代码补全
   - 检查错误检测是否准确

3. **检查 Java 环境**

   - 打开 Java 项目验证代码提示
   - 测试 Spring Boot 配置提示

4. **验证 Maven (已安装)**
   ```bash
   mvn -version
   mvn -q help:effective-pom
   ```

### 🧪 Maven 快速使用

```bash
# 创建快速示例项目(骨架)
mvn -q archetype:generate -DgroupId=com.example -DartifactId=demo -DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=false
cd demo

# 编译 & 运行测试
mvn -q clean test

# 打包 (生成 target/*.jar)
mvn -q clean package

# 仅运行单个测试类
mvn -q -Dtest=AppTest test

# 使用多核并行构建(按 CPU 核心数自动)
mvn -T 1C clean package
```

### 🚀 Maven 镜像加速 (可选)

`<settings>` 内容不放在 `pom.xml`，而是写入用户级或全局的 `~/.m2/settings.xml`。下面是一个带阿里云镜像、华为云镜像以及本地仓库路径的完整模板：

```xml
<?xml version="1.0" encoding="UTF-8"?>
<settings xmlns="http://maven.apache.org/SETTINGS/1.2.0"
               xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
               xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.2.0 https://maven.apache.org/xsd/settings-1.2.0.xsd">

   <!-- 本地仓库位置，可自定义加速 SSD 目录 -->
   <localRepository>/Users/kiko/.m2/repository</localRepository>

   <mirrors>
      <!-- 阿里云公共仓库：覆盖 central -->
      <mirror>
         <id>aliyun</id>
         <mirrorOf>central</mirrorOf>
         <name>Aliyun Maven</name>
         <url>https://maven.aliyun.com/repository/public</url>
      </mirror>
      <!-- 华为云：也可以作为备用（不与 aliyun 冲突时 mirrorOf 同样 central） -->
      <mirror>
         <id>huaweicloud</id>
         <mirrorOf>central</mirrorOf>
         <name>Huawei Cloud Maven</name>
         <url>https://repo.huaweicloud.com/repository/maven/</url>
      </mirror>
   </mirrors>

   <!-- 可配置代理(若需要访问被墙资源) -->
   <!--
   <proxies>
      <proxy>
         <id>internal-proxy</id>
         <active>true</active>
         <protocol>http</protocol>
         <host>127.0.0.1</host>
         <port>7890</port>
         <nonProxyHosts>localhost|127.0.0.1</nonProxyHosts>
      </proxy>
   </proxies>
   -->

   <!-- 可加 profile 强制使用 UTF-8 编码 -->
   <profiles>
      <profile>
         <id>utf8</id>
         <properties>
            <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
            <project.reporting.outputEncoding>UTF-8</project.reporting.outputEncoding>
         </properties>
      </profile>
   </profiles>

   <activeProfiles>
      <activeProfile>utf8</activeProfile>
   </activeProfiles>
</settings>
```

保存后执行一次：

```bash
mvn -q dependency:resolve
```

即可验证镜像是否生效（观察下载域名）。

如需只使用一个镜像，删除另一个 `<mirror>` 即可。多个镜像对同一 `mirrorOf` 可能出现不可预期选择，一般保留一个为佳。

### ⚡ Maven alias 加速建议

在 `~/.zshrc` 里添加常用加速 alias：

```bash
# Maven 并行构建 (按 CPU 核心数自动)
alias mvn1c='mvn -T 1C'
alias mvnfast='mvn -T 1C -q'

# 仅运行测试
alias mvnt='mvn -T 1C test'

# 清理+打包
alias mvncp='mvn -T 1C clean package'

# 查看有效 POM
alias mvnpom='mvn -q help:effective-pom'
```

刷新环境：

```bash
source ~/.zshrc
```

使用示例：

```bash
mvncp   # 并行清理并打包
mvnt    # 并行运行测试
mvnpom  # 输出合成后的有效 POM
```

> 提示：完整的 Maven 国内镜像与编码配置示例已放在 `docs/maven_settings_example.xml`，如需使用可复制到 `~/.m2/settings.xml`。

### 🛠 常用优化建议

1. 建立软链接已完成: `/Users/kiko/tools/maven`
2. 可添加 alias 加快命令:
   ```bash
   echo 'alias mvn="mvn -T 1C"' >> ~/.zshrc && source ~/.zshrc
   ```
3. 若遇到下载缓慢: 检查镜像是否可用或临时切换回中央仓库。

### 🍺 Homebrew 优化配置

你的系统已配置 Homebrew 优化设置(在 `~/.zshrc` 中):

```bash
# Homebrew 优化配置
export HOMEBREW_AUTO_UPDATE_SECS=86400      # 每24小时更新一次
export HOMEBREW_NO_ENV_HINTS=1              # 隐藏环境提示
# export HOMEBREW_NO_AUTO_UPDATE=1          # 完全禁用自动更新(可选)
```

**当前配置效果:**

- ✅ 自动更新间隔: 24 小时(默认 5 分钟)
- ✅ 环境提示已隐藏
- ✅ Homebrew 运行更流畅

**可选配置:**
如果想完全禁用自动更新,取消注释最后一行:

```bash
export HOMEBREW_NO_AUTO_UPDATE=1
```

**重新加载配置:**

```bash
source ~/.zshrc
```

### ✅ 总结

**整体状态**: 🟢 健康

- **40 个扩展全部正常工作**
- **配置完整且优化良好**
- **无扩展冲突或错误**
- **Prettier 问题已解决**
- **仅 Maven 未安装(影响较小)**

所有扩展均处于最新版本,配置合理,系统运行良好! 🎉

## 📚 练习代码空间

### 独立练习文件夹

已创建 `~/code/practice/` 文件夹,用于日常课程练习:

```
practice/
├── .vscode/              # 练习专用配置
│   └── settings.json
├── .gitignore           # 忽略编译文件
├── README.md            # 使用指南
├── c_exercises/         # C 语言练习
│   ├── README.md
│   └── hello.c         # 示例程序
├── java_exercises/      # Java 练习
│   ├── README.md
│   └── HelloWorld.java # 示例程序
└── python_exercises/    # Python 练习
    ├── README.md
    └── hello.py        # 示例程序
```

### ✨ 特性

- ✅ **完全隔离**: 与项目代码互不影响
- ✅ **环境就绪**: C/Java/Python 全部配置完成
- ✅ **扩展支持**: 所有 40 个扩展都可正常使用
- ✅ **快速运行**: Code Runner 一键运行(`⌃⌥N`)
- ✅ **智能提示**: clangd/Java/Pylance 全支持
- ✅ **AI 辅助**: GitHub Copilot 可用

### 🚀 三种使用方式

#### 方式 1: 单独打开(推荐)

```bash
# 在 VS Code 中单独打开练习文件夹
code ~/code/practice
```

**优点**: 界面清爽,只显示练习代码

#### 方式 2: 多根工作区

1. 在 VS Code 中: `文件` → `将文件夹添加到工作区`
2. 选择 `practice` 文件夹
3. `文件` → `将工作区另存为` → 保存为 `my-workspace.code-workspace`

**优点**: 可以同时访问项目代码和练习代码

#### 方式 3: 当前工作区

直接在当前工作区的 `practice/` 文件夹中编辑

**优点**: 无需切换,快速访问

### 📖 快速开始

#### C 语言

```bash
cd ~/code/practice/c_exercises
# 创建文件
touch exercise1.c
# 按 ⌃⌥N 运行
```

#### Java

```bash
cd ~/code/practice/java_exercises
# 创建文件
touch Exercise1.java
# 按 ⌃⌥N 运行
```

#### Python

```bash
cd ~/code/practice/python_exercises
# 创建文件
touch exercise1.py
# 按 ⌃⌥N 运行
```

### 🎯 推荐工作流

1. **按主题分类**: 在各语言文件夹下创建子文件夹

   ```bash
   mkdir c_exercises/pointers
   mkdir java_exercises/oop
   mkdir python_exercises/data_structures
   ```

2. **添加注释**: 记录学习要点

   ```c
   // TODO: 学习指针的基本概念
   // FIXME: 理解为什么这里会出错
   ```

3. **使用书签**: 标记重要代码(快捷键: `Cmd+Opt+K`)

4. **AI 辅助**: 使用 Copilot 学习最佳实践

### 🔧 配置说明

练习文件夹已配置:

- ✅ UTF-8 编码支持中文
- ✅ Code Runner 快速运行
- ✅ 自动清理编译文件
- ✅ clangd C/C++ 智能提示
- ✅ 保存时自动格式化

### 📝 注意事项

1. **编译文件已忽略**: `.o`, `.class`, `__pycache__` 等不会提交到 Git
2. **独立配置**: 练习文件夹有自己的 `.vscode/settings.json`
3. **环境隔离**: 不会影响项目代码的配置
4. **随时练习**: 所有工具和扩展都可以直接使用

开始你的编程练习之旅吧! 🎓✨

<!-- cspell:enable -->
