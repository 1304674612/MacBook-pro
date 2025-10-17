#!/usr/bin/env bash
# 创建一个数据科学基础环境: py312-base
set -euo pipefail
ENV_NAME="py312-base"
PY_VER="3.12"
CONDA_BIN="/Users/kiko/conda/bin/conda"

if [ ! -x "$CONDA_BIN" ]; then
  echo "[ERROR] 未找到 conda: $CONDA_BIN, 请先运行 install_miniconda.sh" >&2
  exit 1
fi

# 确保最新索引
"$CONDA_BIN" clean -i || true
"$CONDA_BIN" update -n base -c defaults conda -y || true

if "$CONDA_BIN" env list | grep -q "^$ENV_NAME\s"; then
  echo "[INFO] 环境 $ENV_NAME 已存在, 跳过创建。"
else
  echo "[INFO] 创建环境 $ENV_NAME (python=$PY_VER) ..."
  "$CONDA_BIN" create -n "$ENV_NAME" python="$PY_VER" -y
fi

echo "[INFO] 安装常用包 (ipykernel numpy pandas matplotlib requests jupyter) ..."
"$CONDA_BIN" install -n "$ENV_NAME" ipykernel numpy pandas matplotlib requests jupyter -y

echo "[INFO] 注册 jupyter kernel ..."
/Users/kiko/conda/envs/$ENV_NAME/bin/python -m ipykernel install --user --name "$ENV_NAME" --display-name "Python $PY_VER (conda)"

echo "[DONE] 使用方式: conda activate $ENV_NAME"
