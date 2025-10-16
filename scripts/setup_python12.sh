#!/usr/bin/env bash
# 说明: 一键安装/升级 Homebrew (用户前缀) + Python 3.12 + 重建虚拟环境
# 避免隐藏字符导致 set -u 报错，整份脚本仅使用 ASCII 变量名

set -Eeuo pipefail

BREW_HOME="${HOME}/homebrew"
BREW_REPO_DIR="${BREW_HOME}/Homebrew"
BREW_BIN_DIR="${BREW_HOME}/bin"
BREW_BIN="${BREW_BIN_DIR}/brew"

log() { printf '\n[%s] %s\n' "$(date '+%H:%M:%S')" "$*"; }
fail() { echo "ERROR: $*" >&2; exit 1; }

log "[1/6] 检查 Homebrew 安装 (用户前缀 ${BREW_HOME})"
if [ ! -x "${BREW_BIN}" ]; then
  log "未发现 ${BREW_BIN}，开始克隆 Homebrew (浅克隆镜像)"
  mkdir -p "${BREW_HOME}" "${BREW_BIN_DIR}"
  if [ ! -d "${BREW_REPO_DIR}" ]; then
    git clone --depth=1 https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git "${BREW_REPO_DIR}" || fail "克隆 Homebrew 失败"
  fi
  ln -sf "${BREW_REPO_DIR}/bin/brew" "${BREW_BIN}"
else
  log "已存在 brew: ${BREW_BIN}"
fi

if [ ! -x "${BREW_BIN}" ]; then
  fail "brew 二进制不存在: ${BREW_BIN}"
fi

log "[2/6] 注入当前 shell 环境"
eval "$(${BREW_BIN} shellenv)"
command -v brew >/dev/null 2>&1 || fail "brew 未进入 PATH"

PROFILE_FILE="${HOME}/.zprofile"
SHELLENV_LINE="eval \"\(\/Users\/${USER}\/homebrew\/bin\/brew shellenv\)\""
if ! grep -F "homebrew/bin/brew shellenv" "${PROFILE_FILE}" >/dev/null 2>&1; then
  log "追加 shellenv 到 ${PROFILE_FILE}"
  {
    echo ''
    echo '# >>> Homebrew user prefix >>>'
    echo "${SHELLENV_LINE}"
    echo '# <<< Homebrew user prefix <<<'
  } >> "${PROFILE_FILE}"
fi

log "[3/6] 安装 / 升级 Python 3.12"
if ! brew list python@3.12 >/dev/null 2>&1; then
  brew install python@3.12 || fail "brew 安装 python@3.12 失败"
else
  log "python@3.12 已安装，尝试升级 (可忽略无可升级信息)"
  brew upgrade python@3.12 || true
fi

PY312_PREFIX="$(brew --prefix python@3.12)"
PY312_PY="${PY312_PREFIX}/bin/python3.12"
[ -x "${PY312_PY}" ] || fail "未找到 Python 3.12 解释器: ${PY312_PY}"
log "Python 3.12 解释器: ${PY312_PY}"

log "[4/6] 重建虚拟环境 python_project/.venv"
REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "${REPO_ROOT}/python_project"
if [ -d .venv ]; then
  log "删除旧虚拟环境 .venv"
  rm -rf .venv
fi
"${PY312_PY}" -m venv .venv || fail "创建虚拟环境失败"
source .venv/bin/activate
python -m pip install --upgrade pip setuptools wheel
if [ -f requirements.txt ] && [ -s requirements.txt ]; then
  pip install -r requirements.txt
fi

log "[5/6] 验证版本"
python -V
which python

log "[6/6] 运行示例 main.py"
python main.py

log "完成：VSCode 会使用 .vscode/settings.json 中的解释器；若未生效，使用命令面板 > Python: Select Interpreter 选择 .venv/bin/python。"
