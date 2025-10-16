#!/usr/bin/env bash
set -euo pipefail

BREW_HOME="$HOME/homebrew"
BREW_BIN="$BREW_HOME/bin/brew"

echo "[1/6] 检查 Homebrew 安装 (用户前缀 $BREW_HOME)"
if [ ! -x "$BREW_BIN" ]; then
  echo "未发现 $BREW_BIN，开始克隆 Homebrew (浅克隆)"
  mkdir -p "$BREW_HOME"
  git clone --depth=1 https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git "$BREW_HOME/Homebrew"
  mkdir -p "$BREW_HOME/bin"
  ln -sf "$BREW_HOME/Homebrew/bin/brew" "$BREW_BIN"
else
  echo "已存在 brew: $BREW_BIN"
fi

echo "[2/6] 注入当前 shell 环境"
eval "$($BREW_BIN shellenv)"

PROFILE_FILE="$HOME/.zprofile"
SHELLENV_LINE='eval "$(/Users/'"${USER}"'/homebrew/bin/brew shellenv)"'
if ! grep -F "brew shellenv" "$PROFILE_FILE" >/dev/null 2>&1; then
  echo "追加 shellenv 到 $PROFILE_FILE"
  {
    echo ''
    echo '# >>> Homebrew user prefix >>>'
    echo "$SHELLENV_LINE"
    echo '# <<< Homebrew user prefix <<<'
  } >> "$PROFILE_FILE"
fi

echo "[3/6] 安装 / 升级 Python 3.12"
if ! brew list python@3.12 >/dev/null 2>&1; then
  brew install python@3.12
else
  echo "python@3.12 已安装，尝试升级 (可忽略报错)"
  brew upgrade python@3.12 || true
fi

PY312_BIN_DIR="$(brew --prefix python@3.12)/bin"
PY312_PY="$PY312_BIN_DIR/python3.12"
echo "Python 3.12 解释器: $PY312_PY"

echo "[4/6] 重建虚拟环境 python_project/.venv"
cd "$(dirname "$0")/.."  # 到仓库根目录
cd python_project
if [ -d .venv ]; then
  echo "删除旧虚拟环境 .venv"
  rm -rf .venv
fi
"$PY312_PY" -m venv .venv
source .venv/bin/activate
python -m pip install --upgrade pip setuptools wheel
if [ -f requirements.txt ]; then
  pip install -r requirements.txt
fi

echo "[5/6] 验证版本"
python -V
which python

echo "[6/6] 运行示例 main.py"
python main.py

echo "完成：VSCode 将自动使用 .vscode/settings.json 中的新解释器。若未生效，执行命令面板 > Python: Select Interpreter 选择 .venv/bin/python。"
