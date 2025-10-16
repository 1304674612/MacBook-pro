#!/bin/bash
set -e

echo "🐍 开始安装 Python 3.12.12 via pyenv"

# 配置 pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# 使用华为云镜像
export PYTHON_BUILD_MIRROR_URL="https://mirrors.huaweicloud.com/python/"

# 检查是否已安装
if pyenv versions | grep -q "3.12.12"; then
    echo "✅ Python 3.12.12 已安装"
else
    echo "📦 正在下载并编译 Python 3.12.12 (需要 5-10 分钟)..."
    pyenv install 3.12.12 -v
fi

# 设置为全局版本
echo "🔧 设置 Python 3.12.12 为默认版本"
pyenv global 3.12.12

# 验证安装
echo "✅ 验证安装:"
python --version
which python

# 重建虚拟环境
echo "🔄 重建 Python 项目虚拟环境..."
cd /Users/kiko/code/python_project
rm -rf .venv
python -m venv .venv
source .venv/bin/activate
pip install --upgrade pip

echo "🎉 Python 3.12.12 安装完成!"
echo "💡 运行 'pyenv versions' 查看所有已安装版本"
echo "💡 运行 'pyenv global 3.9.6' 可切换回系统版本"
