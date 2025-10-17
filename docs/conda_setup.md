<!-- cspell:disable -->

# Conda 环境搭建与使用指南

## 目录

1. 为什么选择 Miniconda
2. 安装路径与步骤
3. 配置国内镜像 (.condarc)
4. 创建与管理环境
5. 与 venv 共存策略
6. VSCode 解释器选择
7. 常用命令速查
8. 扩展数据科学 / 机器学习包
9. 常见问题排查

---

## 1. 为什么选择 Miniconda

- 轻量: 仅包含 conda + Python 基础, 不臃肿
- 灵活: 按需安装数据/科学包
- 可与现有 `python_project/.venv` 并行使用

Anaconda 预装大量库 (体积大/升级慢)。Miniconda 更适合日常开发 + 学习，减轻磁盘开销。

## 2. 安装路径与步骤

推荐安装到: `/Users/kiko/conda`

### 安装脚本 (自动化)

运行 `scripts/install_miniconda.sh` (稍后生成) 将:

- 下载 Mac ARM64 安装器
- 安装到 `/Users/kiko/conda`
- 写入 `~/.zshrc` 环境变量 (若不存在)
- 可选执行 `conda init zsh`

### 手动安装 (备用)

```bash
curl -L https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-arm64.sh -o miniconda.sh
bash miniconda.sh -b -p /Users/kiko/conda
# 添加 PATH (若脚本未处理)
echo '\n# Miniconda\nexport CONDA_HOME=/Users/kiko/conda\nexport PATH="$CONDA_HOME/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc
conda init zsh   # 可选
```

## 3. 配置国内镜像 (.condarc)

在 `~/.condarc` 添加:

```yaml
channels:
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/r
  - conda-forge
show_channel_urls: true
default_channels:
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/r
custom_channels:
  conda-forge: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
ssl_verify: true
pip_interop_enabled: true
auto_activate_base: false
```

说明:

- `pip_interop_enabled`: 让 pip 与 conda 共存更顺畅
- `auto_activate_base: false`: 打开新终端不自动进入 base 环境

验证镜像:

```bash
conda clean -i   # 清理索引缓存
conda update conda
conda search python | head
```

## 4. 创建与管理环境

示例创建 Python 3.12 环境:

```bash
conda create -n py312-base python=3.12 -y
conda activate py312-base
```

安装常用包:

```bash
conda install -y ipykernel numpy pandas matplotlib requests jupyter
python -m ipykernel install --user --name py312-base --display-name "Python 3.12 (conda)"
```

删除环境:

```bash
conda deactivate
conda remove -n py312-base --all -y
```

导出/恢复:

```bash
conda env export -n py312-base > py312-base.yaml
conda env create -f py312-base.yaml
```

列出环境:

```bash
conda env list
```

## 5. 与 venv 共存策略

| 场景          | 建议             | 说明                              |
| ------------- | ---------------- | --------------------------------- |
| Web / 小脚本  | venv             | 轻量,随项目放置                   |
| 数据分析/科学 | conda            | 多包兼容好, 有二进制依赖          |
| 混合项目      | conda env + venv | 高级依赖用 conda, 项目内再建 venv |

不要在激活 conda 环境时再创建 venv 指向同一 Python；如需迁移，可在 conda 环境内执行 `python -m venv venv` 但要注意路径与依赖重复。

## 6. VSCode 解释器选择

1. 打开命令面板: `Cmd+Shift+P`
2. 输入: `Python: Select Interpreter`
3. 选择: `Python 3.12 (conda) (py312-base)`

或直接设置工作区:

```jsonc
// .vscode/settings.json 片段示例
{
  "python.defaultInterpreterPath": "/Users/kiko/conda/envs/py312-base/bin/python"
}
```

Jupyter 使用:

- 在 VSCode 打开 `.ipynb`，右上角内核选择 `Python 3.12 (conda)`

## 7. 常用命令速查

```bash
conda create -n envname python=3.12 -y    # 创建环境
conda activate envname                   # 激活
conda deactivate                         # 退出
conda env list                           # 列出环境
conda remove -n envname --all -y         # 删除环境
conda search pkgname                     # 搜索包
conda install -n envname pkg -y          # 安装包
conda update --all -y                    # 更新当前环境所有包
conda clean -a -y                        # 清理缓存
conda env export -n envname > env.yaml   # 导出环境
conda env create -f env.yaml             # 从文件创建
```

## 8. 扩展数据科学 / 机器学习包

已安装基础包: `numpy pandas matplotlib requests jupyter ipykernel`。

进一步推荐:

| 分类          | 包           | 用途               | 安装命令                                      |
| ------------- | ------------ | ------------------ | --------------------------------------------- |
| 机器学习      | scikit-learn | 经典 ML 算法工具集 | `conda install -n py312-base scikit-learn -y` |
| 统计可视化    | seaborn      | 高级统计绘图接口   | `conda install -n py312-base seaborn -y`      |
| 增强学习/集成 | xgboost      | 高性能梯度提升树   | `conda install -n py312-base xgboost -y`      |
| 数值/加速     | scipy        | 数值算法、积分优化 | (被 scikit-learn 自动拉取)                    |
| 模型持久化    | joblib       | 并行与序列化       | (随 scikit-learn 一并安装)                    |

批量安装示例 (已执行):

```bash
conda install -n py312-base scikit-learn seaborn xgboost -y
```

验证导入:

```bash
source ~/.zshrc
conda activate py312-base
python -c "import sklearn, seaborn, xgboost, scipy; print(sklearn.__version__, seaborn.__version__, xgboost.__version__, scipy.__version__)"
```

更新环境导出文件:

```bash
conda env export -n py312-base > py312-base.yaml
```

## 9. 常见问题排查

| 问题                                | 原因                         | 解决                                                       |
| ----------------------------------- | ---------------------------- | ---------------------------------------------------------- |
| 终端提示 `command not found: conda` | PATH 未添加或未 `conda init` | 重新写入 ~/.zshrc 并 `source ~/.zshrc`                     |
| VSCode 未显示 conda 环境            | 未刷新解释器列表             | 重新打开窗口/执行 `Python: Select Interpreter`             |
| 下载极慢                            | 镜像未生效/缓存污染          | 检查 `.condarc` + `conda clean -i`                         |
| 与 pip 冲突                         | pip 安装覆盖 conda 包        | 优先使用 conda 安装，必要时 `pip install --upgrade` 后测试 |
| base 自动激活                       | auto_activate_base 未关闭    | `.condarc` 设置 `auto_activate_base: false`                |

---

**完成后建议**:

1. 建立首个环境: `conda create -n py312-base python=3.12 -y`
2. 安装科学包: `conda install numpy pandas matplotlib -y`
3. 在 VSCode 中切换解释器
4. 可添加 alias:

```bash
# ~/.zshrc 末尾
alias ca='conda activate'
alias cl='conda env list'
alias cdel='conda remove -n'

<!-- cspell:enable -->
```
