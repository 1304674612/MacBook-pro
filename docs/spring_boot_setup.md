# Spring Boot 提示不工作 - 完整解决方案

## 🎯 问题原因

Spring Boot Tools 扩展需要以下条件才能工作:
1. ✅ 项目必须有 `pom.xml` (Maven) 或 `build.gradle` (Gradle)
2. ✅ 正确的项目结构 (`src/main/java`, `src/main/resources`)
3. ✅ Java Language Server 需要正确加载项目
4. ⏳ Maven/Gradle 需要下载依赖包

## ✅ 已完成的配置

### 1. 创建了 Spring Boot 项目结构

```
java_project/
├── pom.xml                          # Maven 配置文件
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   └── com/example/demo/
│   │   │       ├── DemoApplication.java          # 主程序
│   │   │       └── controller/
│   │   │           └── HelloController.java      # REST 控制器
│   │   └── resources/
│   │       └── application.properties            # 配置文件
│   └── test/
│       └── java/
│           └── com/example/demo/
└── out/                            # 编译输出目录
```

### 2. 添加了 pom.xml

包含的依赖:
- **Spring Boot Web Starter**: REST API 开发
- **Spring Boot DevTools**: 热重载
- **Spring Boot Test**: 单元测试

### 3. 创建了示例代码

- **DemoApplication.java**: Spring Boot 主类
- **HelloController.java**: REST API 示例
- **application.properties**: 配置文件(支持智能提示)

## 🚀 下一步: 下载依赖并激活提示

### 方法 1: 使用 VSCode 命令(推荐)

1. 在 VSCode 中按 `Cmd+Shift+P`
2. 输入并选择: **"Java: Update Project Configuration"**
3. 等待 Maven 下载依赖(首次需要几分钟)
4. 完成后按 `Cmd+Shift+P` → **"Java: Clean Java Language Server Workspace"**
5. 重启 VSCode

### 方法 2: 使用终端下载依赖

需要先安装 Maven:

```bash
# 1. 安装 Maven (如果没有安装 Node.js,先安装 Node.js)
# 安装 Node.js 后:
cd ~/Downloads
curl -o apache-maven-3.9.6.pkg https://dlcdn.apache.org/maven/maven-3/3.9.6/binaries/apache-maven-3.9.6-bin.tar.gz

# 或者等待安装 Node.js 后可以使用 npm 全局安装 Maven wrapper
npm install -g mvn

# 2. 下载项目依赖
cd /Users/kiko/code/java_project
mvn clean install

# 3. 刷新 Java 项目
# 回到 VSCode 按 Cmd+Shift+P → "Java: Clean Java Language Server Workspace"
```

### 方法 3: 先安装 Node.js,然后自动配置

由于你的 Node.js 安装包已下载好:

```bash
# 1. 安装 Node.js
sudo installer -pkg ~/Downloads/node-v20.18.0.pkg -target /

# 2. 验证安装
node --version
npm --version

# 3. 使用 npx 运行 Maven(无需安装)
cd /Users/kiko/code/java_project
npx maven clean install
```

## 💡 验证 Spring Boot 提示是否工作

### 测试步骤:

1. **打开 application.properties**
   ```
   /Users/kiko/code/java_project/src/main/resources/application.properties
   ```

2. **输入 `spring.`**
   - 应该看到自动补全列表
   - 包含数百个 Spring Boot 配置项
   - 每个配置项都有文档说明

3. **测试智能提示示例:**
   ```properties
   # 输入 spring.d 会提示:
   spring.datasource.url=
   spring.datasource.username=
   spring.datasource.password=
   spring.devtools.restart.enabled=
   
   # 输入 server. 会提示:
   server.port=
   server.servlet.context-path=
   server.compression.enabled=
   ```

4. **鼠标悬停查看文档**
   - 将鼠标移到任何配置项上
   - 会显示详细的说明和可用值

## 🎯 常见配置项智能提示示例

在 `application.properties` 中测试这些:

```properties
# 服务器配置
spring.application.name=demo
server.port=8080

# 数据库配置 (输入 spring.datasource. 会自动提示)
spring.datasource.url=jdbc:mysql://localhost:3306/mydb
spring.datasource.username=root
spring.datasource.password=secret
spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver

# JPA 配置 (输入 spring.jpa. 会自动提示)
spring.jpa.hibernate.ddl-auto=update
spring.jpa.show-sql=true
spring.jpa.properties.hibernate.format_sql=true

# 日志配置 (输入 logging. 会自动提示)
logging.level.root=INFO
logging.level.com.example=DEBUG
logging.pattern.console=%d{yyyy-MM-dd HH:mm:ss} - %msg%n

# 文件上传 (输入 spring.servlet. 会自动提示)
spring.servlet.multipart.max-file-size=10MB
spring.servlet.multipart.max-request-size=10MB
```

## 🔧 故障排除

### 问题 1: 打开 application.properties 没有提示

**解决方案:**
```bash
# 1. 确保 pom.xml 存在
ls /Users/kiko/code/java_project/pom.xml

# 2. 清理 Java 工作区
Cmd+Shift+P → "Java: Clean Java Language Server Workspace"

# 3. 重启 VSCode
Cmd+Q 退出,重新打开
```

### 问题 2: 提示显示"正在加载..."

**解决方案:**
- 等待 Java Language Server 完全启动(首次需要 1-2 分钟)
- 查看 VSCode 右下角的 Java 状态
- 等待显示 "✓" 表示加载完成

### 问题 3: 红色波浪线错误(找不到 org.springframework)

**这是正常的!** 原因:
- Maven 还没有下载 Spring Boot 依赖
- 需要执行 `mvn clean install` 或在 VSCode 中触发更新

**解决方案:**
```bash
# 安装 Node.js 后
cd /Users/kiko/code/java_project
npx maven clean install
```

### 问题 4: VSCode 显示 "Java 项目不在构建路径中"

**解决方案:**
```bash
# 1. 删除 .vscode/settings.json 中的 Java 相关配置
# 2. 重新导入项目
Cmd+Shift+P → "Java: Import Java Projects into Workspace"
```

### 问题 5: application.properties 没有语法高亮

**解决方案:**
- 确保文件扩展名正确: `.properties`
- 安装 Spring Boot Tools 扩展(已安装 ✅)
- 重启 VSCode

## 📚 Spring Boot 开发快速指南

### 运行项目

等待 Maven 依赖下载完成后:

**方法 1: VSCode 启动**
1. 打开 `DemoApplication.java`
2. 点击 `main` 方法上方的 ▶️ "Run" 按钮
3. 或按 `F5` 启动调试模式

**方法 2: Maven 命令**
```bash
cd /Users/kiko/code/java_project
mvn spring-boot:run
```

### 测试 REST API

启动后访问:
```bash
# 方法 1: 浏览器
open http://localhost:8080/api/hello
open http://localhost:8080/api/info

# 方法 2: curl
curl http://localhost:8080/api/hello
curl http://localhost:8080/api/info
```

预期输出:
```
GET /api/hello
Hello from Spring Boot! 你好，Spring Boot!

GET /api/info
{"name":"Demo Application","version":"1.0.0","description":"Spring Boot 示例应用"}
```

### 热重载

修改代码后:
1. 保存文件 (`Cmd+S`)
2. DevTools 自动重启应用(约 1-2 秒)
3. 刷新浏览器查看更改

## 🎨 推荐的额外配置

### application.yml (替代 .properties)

如果喜欢 YAML 格式,可以创建 `application.yml`:

```yaml
spring:
  application:
    name: demo
  datasource:
    url: jdbc:mysql://localhost:3306/mydb
    username: root
    password: secret

server:
  port: 8080

logging:
  level:
    root: INFO
    com.example: DEBUG
```

**智能提示同样生效!** 输入 `spring:` 后按 Tab 会自动提示所有配置项。

### .gitignore 更新

添加 Maven 相关忽略项:

```gitignore
# Maven
target/
pom.xml.tag
pom.xml.releaseBackup
pom.xml.versionsBackup
pom.xml.next
release.properties
dependency-reduced-pom.xml

# Spring Boot
.springBeans
.sts4-cache
```

## 📖 学习资源

- **Spring Boot 官方文档**: https://spring.io/projects/spring-boot
- **Spring Boot 配置参考**: https://docs.spring.io/spring-boot/docs/current/reference/html/application-properties.html
- **Spring Initializr**: https://start.spring.io/ (在线生成项目)

## ⏭️ 下一步

1. ✅ **安装 Node.js** (~/Downloads/node-v20.18.0.pkg)
2. ⏳ **下载 Maven 依赖** (`npx maven clean install`)
3. ⏳ **刷新 Java 项目** (VSCode Command)
4. ✅ **测试智能提示** (打开 application.properties,输入 `spring.`)
5. ✅ **运行 Spring Boot 应用**
6. ✅ **访问 REST API**

**完成这些步骤后,Spring Boot 智能提示就会完美工作!** 🎉
