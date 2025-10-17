#!/usr/bin/env bash
# 自动化安装 Miniconda (Mac ARM64)
# 安装路径: /Users/kiko/conda
# 幂等: 若已安装则跳过下载与安装步骤
set -euo pipefail

INSTALL_DIR="/Users/kiko/conda"
INSTALLER="Miniconda3-latest-MacOSX-arm64.sh"
URL="https://repo.anaconda.com/miniconda/${INSTALLER}"

color() { # 1=color 2=message
  printf "\033[%sm%s\033[0m\n" "$1" "$2";
}

if [ -d "$INSTALL_DIR" ] && [ -x "$INSTALL_DIR/bin/conda" ]; then
  color 32 "[OK] Miniconda 已存在于 $INSTALL_DIR, 跳过安装。"
else
  color 36 "[INFO] 下载安装器..."
  curl -L "$URL" -o "$INSTALLER"
  color 36 "[INFO] 开始静默安装到 $INSTALL_DIR ..."
  bash "$INSTALLER" -b -p "$INSTALL_DIR"
  rm -f "$INSTALLER"
  color 32 "[OK] Miniconda 安装完成。"
fi

# 写入 PATH 到 ~/.zshrc (若不存在标记)
ZSHRC="$HOME/.zshrc"
MARKER="# >>> miniconda >>>"
if ! grep -q "$MARKER" "$ZSHRC" 2>/dev/null; then
  cat >> "$ZSHRC" <<'EOF'
# >>> miniconda >>>
export CONDA_HOME=/Users/kiko/conda
export PATH="$CONDA_HOME/bin:$PATH"
# <<< miniconda <<<
EOF
  color 32 "[OK] 已写入 PATH 到 ~/.zshrc"
else
  color 33 "[WARN] ~/.zshrc 已包含 miniconda PATH 配置, 跳过。"
fi

# 生成 ~/.condarc (若不存在)
CONDARC="$HOME/.condarc"
if [ ! -f "$CONDARC" ]; then
  cat > "$CONDARC" <<'YAML'
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
YAML
  color 32 "[OK] 已生成 ~/.condarc"
else
  color 33 "[WARN] ~/.condarc 已存在, 未覆盖。"
fi

# 初始化 shell (可选)
if ! grep -q 'conda activate' "$ZSHRC" 2>/dev/null; then
  color 36 "[INFO] 进行 conda init zsh (若第一次安装)"
  source "$ZSHRC" || true
  "$INSTALL_DIR/bin/conda" init zsh || true
else
  color 33 "[WARN] 可能已执行过 conda init, 跳过。"
fi

color 32 "[DONE] 请执行: source ~/.zshrc && conda --version"
