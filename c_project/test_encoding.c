#include <stdio.h>
#include <locale.h>

int main() {
    // 设置本地化
    setlocale(LC_ALL, "zh_CN.UTF-8");
    
    printf("=== Code Runner 中文测试 ===\n");
    printf("你好，世界！\n");
    printf("这是中文输出测试\n");
    printf("🎉 支持 Emoji 表情\n");
    printf("数字: 123456\n");
    printf("英文: Hello World\n");
    
    return 0;
}
