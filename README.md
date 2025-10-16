# 多语言开发环境示例 (C / Java / Python)

## 当前系统环境检测结果
- macOS 15.6 (arm64)
- Clang: Apple clang 17.0.0 (已安装 Command Line Tools)
- Java: OpenJDK 21 (Corretto LTS)
- Python: 3.9.6 (系统自带)
- Homebrew: 未安装 (建议安装以便管理多版本工具)

## 建议
1. 安装 Homebrew (可选但推荐)
	- 若系统装不进 `/opt/homebrew`（权限或半安装状态），可以使用“用户前缀”方案：`$HOME/homebrew`
2. （可选）安装更新版本 Python (3.12) 并重建虚拟环境
3. （可选）多版本 JDK 管理 (`temurin`)。

### Python 3.12 升级快速脚本
仓库提供脚本：`scripts/setup_python12.sh`

功能：
```
1. 用户前缀克隆 Homebrew (若缺失)
2. 注入 shellenv 并写入 ~/.zprofile
3. 安装 / 升级 python@3.12
4. 用 3.12 重建 python_project/.venv
5. 升级 pip & 安装依赖
6. 验证并运行示例
```

使用方法：
```
chmod +x scripts/setup_python12.sh
./scripts/setup_python12.sh
```

脚本完成后 VSCode 会因为 `.vscode/settings.json` 指向虚拟环境而自动切换解释器；若未切换，可手动执行命令面板：Python: Select Interpreter。

> 如果你的网络访问 GitHub 缓慢/超时，脚本使用清华镜像进行初始浅克隆；后续可在网络通畅时 `git -C $HOME/homebrew/Homebrew remote set-url origin https://github.com/Homebrew/brew.git && git -C $HOME/homebrew/Homebrew fetch --unshallow` 转为官方源。

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

