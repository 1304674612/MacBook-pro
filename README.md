# 多语言开发环境示例 (C / Java / Python)

## 当前系统环境检测结果
- macOS 15.6 (arm64)
- Clang: Apple clang 17.0.0 (已安装 Command Line Tools)
- Java: OpenJDK 21 (Corretto LTS)
- Python: **3.14.0** ✨ (最新版本,安装于 /usr/local/bin/python3)
- Git: SSH 认证已配置 (github.com)

## 建议
1. ✅ **Python 3.14 已安装** - 支持最新语言特性和性能优化
2. （可选）多版本 JDK 管理
3. （可选）安装 Homebrew 进行包管理

### Python 虚拟环境已配置
项目使用 Python 3.14.0 虚拟环境:
```bash
cd python_project
source .venv/bin/activate  # 激活环境
python --version           # Python 3.14.0
pip list                   # 查看已安装包
```

## 目录结构
```
c_project/        C 示例 (Makefile)
java_project/     Java 示例 (手动编译)
python_project/   Python 示例 (虚拟环境建议)
.vscode/          VSCode 任务与调试配置
```

## VSCode 任务
打开命令面板执行: 运行任务 选择
- C: Build / C: Run
- Java: Compile / Java: Run
- Python: Run

## 调试
需要安装对应扩展:
- C/C++ Extension Pack (ms-vscode.cpptools-extension-pack)
- Extension Pack for Java (vscjava.vscode-java-pack)
- Python (ms-python.python)

然后在运行和调试视图选择对应配置。

## Python 虚拟环境
```
cd python_project
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
```

## 常见问题
- 未识别调试类型: 需要先安装对应扩展
- problemMatcher 警告: 编辑 tasks.json 去掉不被识别的匹配器或等待扩展安装后再校验

