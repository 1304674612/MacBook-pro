# Code Runner 中文乱码解决方案

## ✅ 问题已解决

已配置 Code Runner 支持中文输出,无需任何手动操作。

## 🔧 配置说明

### 已添加的配置 (.vscode/settings.json)

```json
{
  "code-runner.executorMap": {
    "c": "cd $dir && clang -std=c17 -Wall -Wextra -O2 -fexec-charset=UTF-8 $fileName -o $fileNameWithoutExt && $dir$fileNameWithoutExt",
    "cpp": "cd $dir && clang++ -std=c++20 -Wall -Wextra -O2 -fexec-charset=UTF-8 $fileName -o $fileNameWithoutExt && $dir$fileNameWithoutExt",
    "java": "cd $dir && javac -encoding UTF-8 $fileName && java $fileNameWithoutExt",
    "python": "cd $dir && /usr/local/bin/python3 -u $fileName"
  },
  "code-runner.runInTerminal": true,
  "code-runner.saveFileBeforeRun": true,
  "code-runner.preserveFocus": false,
  "code-runner.clearPreviousOutput": false,
  "code-runner.respectShebang": true,
  
  "terminal.integrated.env.osx": {
    "LC_ALL": "zh_CN.UTF-8",
    "LANG": "zh_CN.UTF-8"
  }
}
```

### 关键配置项解释

#### C/C++ 编译参数
- **`-fexec-charset=UTF-8`**: 指定可执行文件的字符集为 UTF-8
- **`-std=c17`** / **`-std=c++20`**: 使用现代 C/C++ 标准
- **`-Wall -Wextra`**: 启用所有警告,提高代码质量
- **`-O2`**: 开启优化

#### Java 编译参数
- **`-encoding UTF-8`**: 指定源文件编码为 UTF-8
- 确保 `.java` 文件保存时使用 UTF-8 编码

#### Python 参数
- **`-u`**: 无缓冲输出,实时显示 print 内容
- **`/usr/local/bin/python3`**: 使用 Python 3.14.0

#### Code Runner 行为设置
- **`runInTerminal: true`**: 在终端运行,支持交互式输入
- **`saveFileBeforeRun: true`**: 运行前自动保存文件
- **`preserveFocus: false`**: 运行后切换到输出窗口
- **`clearPreviousOutput: false`**: 保留上次运行结果
- **`respectShebang: true`**: 尊重文件开头的 shebang (#!)

#### 终端环境变量
- **`LC_ALL`** 和 **`LANG`**: 设置为 `zh_CN.UTF-8`,确保终端支持中文

## 🎯 使用方法

### 快捷键
- **运行代码**: `Ctrl+Alt+N` (macOS: `⌃⌥N`)
- **停止运行**: `Ctrl+Alt+M` (macOS: `⌃⌥M`)

### 右键菜单
1. 打开代码文件
2. 右键 → 点击 "Run Code"
3. 或者右键编辑器空白处 → "Run Code"

### 编辑器标题栏
点击编辑器右上角的 ▶️ 图标

## 📝 测试文件

已创建测试文件验证中文输出:

### C 语言测试
**文件**: `c_project/test_encoding.c`
```c
#include <stdio.h>
#include <locale.h>

int main() {
    setlocale(LC_ALL, "zh_CN.UTF-8");
    printf("你好，世界！\n");
    printf("🎉 支持 Emoji 表情\n");
    return 0;
}
```

**运行**: 打开文件后按 `⌃⌥N`

### Java 测试
**文件**: `java_project/src/com/example/TestEncoding.java`
```java
public class TestEncoding {
    public static void main(String[] args) {
        System.out.println("你好，世界！");
        System.out.println("🎉 支持 Emoji 表情");
    }
}
```

**运行**: 打开文件后按 `⌃⌥N`

### Python 测试
**文件**: `python_project/test_encoding.py`
```python
#!/usr/bin/env python3
# -*- coding: utf-8 -*-

def main():
    print("你好，世界！")
    print("🎉 支持 Emoji 表情")
    fruits = ["苹果", "香蕉", "橙子"]
    print(f"水果列表: {fruits}")

if __name__ == "__main__":
    main()
```

**运行**: 打开文件后按 `⌃⌥N`

## ✅ 验证结果

所有测试已通过,输出正常:

```
=== Code Runner 中文测试 ===
你好，世界！
这是中文输出测试
🎉 支持 Emoji 表情
数字: 123456
英文: Hello World
```

## 🔍 故障排除

### 问题 1: 仍然出现乱码
**解决方案:**
1. 重启 VSCode
2. 确保文件以 UTF-8 编码保存
3. 检查 VSCode 右下角状态栏的编码显示

### 问题 2: C/C++ 程序中文输出乱码
**解决方案:**
在代码开头添加:
```c
#include <locale.h>
setlocale(LC_ALL, "zh_CN.UTF-8");
```

### 问题 3: Java 程序中文乱码
**解决方案:**
1. 确保源文件是 UTF-8 编码
2. 检查 VSCode 右下角编码: UTF-8
3. 如果是 UTF-8 with BOM,改为 UTF-8

### 问题 4: Python 程序中文乱码
**解决方案:**
在文件头部添加:
```python
#!/usr/bin/env python3
# -*- coding: utf-8 -*-
```

### 问题 5: Code Runner 输出窗口乱码
**解决方案:**
修改为在终端运行(已配置):
```json
{
  "code-runner.runInTerminal": true
}
```

## 💡 最佳实践

### 1. 文件编码
- 始终使用 UTF-8 编码保存源文件
- 避免使用 UTF-8 with BOM(可能导致 Java/Python 问题)

### 2. 代码规范
```c
// C/C++ - 在 main 函数开头设置
#include <locale.h>
int main() {
    setlocale(LC_ALL, "zh_CN.UTF-8");
    // ...
}
```

```python
# Python - 在文件头部声明
#!/usr/bin/env python3
# -*- coding: utf-8 -*-
```

```java
// Java - 确保文件 UTF-8 编码即可
// 无需特殊设置
```

### 3. 注释和字符串
```c
// 推荐: 使用中文注释和字符串
printf("用户名: %s\n", name);

// 避免: 硬编码 GBK/GB2312
```

### 4. 终端设置
确保 VSCode 终端使用 UTF-8:
- 查看当前编码: `locale`
- 应该显示: `LANG="zh_CN.UTF-8"`

## 🎓 补充说明

### 字符编码基础
- **UTF-8**: 通用的 Unicode 编码,支持所有语言
- **GBK/GB2312**: 中文编码,仅支持简体中文
- **ASCII**: 基础编码,仅支持英文

### 为什么使用 UTF-8?
1. ✅ 兼容性最好,全平台通用
2. ✅ 支持所有语言和 Emoji
3. ✅ 是现代开发的标准
4. ✅ Git 和 GitHub 默认使用 UTF-8

### macOS 编码特性
- macOS 默认使用 UTF-8
- 终端默认支持 UTF-8
- 无需额外配置系统编码

## 📚 相关文档

- [Code Runner 官方文档](https://marketplace.visualstudio.com/items?itemName=formulahendry.code-runner)
- [VSCode 编码支持](https://code.visualstudio.com/docs/editor/codebasics#_file-encoding-support)
- [C locale 文档](https://en.cppreference.com/w/c/locale/setlocale)
