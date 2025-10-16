# 微信小程序开发环境配置指南

## 📱 环境搭建步骤

### ✅ 已完成
- ✅ Git 配置 (SSH 已连接 GitHub)
- ✅ VSCode 扩展已安装 (详见下方)
- ✅ Python 3.14.0 环境
- ✅ Java 21 环境
- ✅ Node.js 安装包已下载

### 🔧 待完成

#### 1. 安装 Node.js (必需)
Node.js 20.18.0 LTS 安装包已下载到:
```
~/Downloads/node-v20.18.0.pkg
```

**安装步骤:**
1. 打开 Finder → 下载文件夹
2. 双击 `node-v20.18.0.pkg`
3. 按照向导完成安装
4. 安装完成后,打开终端验证:
   ```bash
   node --version   # 应该显示 v20.18.0
   npm --version    # 应该显示 10.x.x
   ```

**或者使用命令行安装:**
```bash
sudo installer -pkg ~/Downloads/node-v20.18.0.pkg -target /
```

#### 2. 下载微信开发者工具 (必需)
官方下载地址:
- **稳定版**: https://developers.weixin.qq.com/miniprogram/dev/devtools/download.html
- **macOS (Intel)**: https://dldir1.qq.com/WechatWebDev/release/be1ec64cf6184b0fa64091919793f068/wechat_devtools_1.06.2401040_x64.dmg
- **macOS (Apple Silicon/M1/M2)**: https://dldir1.qq.com/WechatWebDev/release/be1ec64cf6184b0fa64091919793f068/wechat_devtools_1.06.2401040_arm64.dmg

**你的 Mac 是 arm64 架构,下载 Apple Silicon 版本**

**安装步骤:**
```bash
# 下载 (选择 arm64 版本)
curl -o ~/Downloads/wechat_devtools_arm64.dmg https://dldir1.qq.com/WechatWebDev/release/be1ec64cf6184b0fa64091919793f068/wechat_devtools_1.06.2401040_arm64.dmg

# 安装完成后打开微信开发者工具并用微信扫码登录
```

#### 3. 配置 npm 国内镜像 (推荐)
安装 Node.js 后执行:
```bash
# 设置淘宝镜像
npm config set registry https://registry.npmmirror.com

# 验证配置
npm config get registry
# 应该显示: https://registry.npmmirror.com/
```

## 🎯 已安装的 VSCode 扩展

### 微信小程序专用扩展 ⭐ NEW
1. **WXML - Language Service** (qiu8310.minapp-vscode)
   - 功能: WXML/WXSS/WXS 语法高亮和智能提示
   - 特性: 组件属性补全、事件绑定提示、wxs 支持
   - 安装量: 62万+

2. **微信小程序开发工具** (crazyurus.miniprogram-vscode-extension)
   - 功能: 完整小程序开发套件
   - 特性: 
     * 预览和上传功能
     * 代码补全和语法高亮
     * 项目模板创建
     * 主题和图标支持
   - 安装量: 20万+

3. **wechat-snippet** (chandzhang.wechat-snippet)
   - 功能: 微信小程序代码片段
   - 特性: API 快速补全、组件代码片段
   - 安装量: 24万+

## 📦 常用小程序 npm 包

安装 Node.js 后,可以安装这些常用包:

### 1. 小程序 UI 组件库
```bash
# Vant Weapp - 轻量、可靠的小程序 UI 组件库
npm install @vant/weapp -S --production

# WeUI - 微信官方设计规范 UI 库
npm install weui-miniprogram --save
```

### 2. 网络请求库
```bash
# flyio - 支持小程序的 HTTP 请求库
npm install flyio --save
```

### 3. 状态管理
```bash
# mobx-miniprogram - 小程序的 MobX 绑定
npm install mobx-miniprogram mobx-miniprogram-bindings --save
```

### 4. 工具库
```bash
# 日期处理
npm install dayjs --save

# 工具函数
npm install lodash --save
```

## 🚀 创建第一个小程序项目

### 方法 1: 使用微信开发者工具创建
1. 打开微信开发者工具
2. 点击 "+" 创建小程序项目
3. 填写项目信息:
   - AppID: 测试号或正式 AppID
   - 项目名称: my-first-miniprogram
   - 项目目录: /Users/kiko/code/miniprogram_projects
   - 模板: 选择 "不使用云服务"

### 方法 2: 使用 VSCode 创建 (安装 Node.js 后)
```bash
# 创建项目目录
mkdir -p /Users/kiko/code/miniprogram_projects/my-first-app
cd /Users/kiko/code/miniprogram_projects/my-first-app

# 初始化项目
npm init -y

# 安装开发依赖
npm install miniprogram-api-typings --save-dev
```

**创建基本文件结构:**
```
my-first-app/
├── pages/              # 页面目录
│   └── index/
│       ├── index.js    # 页面逻辑
│       ├── index.json  # 页面配置
│       ├── index.wxml  # 页面结构
│       └── index.wxss  # 页面样式
├── utils/              # 工具函数
├── app.js              # 小程序逻辑
├── app.json            # 小程序配置
├── app.wxss            # 小程序样式
└── project.config.json # 项目配置
```

## 💡 VSCode 小程序开发技巧

### 1. 智能提示
在 `.wxml` 文件中输入 `wx:` 会自动提示小程序指令:
- `wx:for` - 列表渲染
- `wx:if` - 条件渲染
- `wx:elif` / `wx:else`

### 2. 代码片段
输入以下前缀快速生成代码:
- `page` - 创建页面模板
- `component` - 创建组件模板
- `wxapi` - 微信 API 调用
- `wxrequest` - 网络请求

示例:
```javascript
// 输入 wxrequest 自动生成:
wx.request({
  url: '',
  data: {},
  method: 'GET',
  success: (res) => {
    console.log(res);
  },
  fail: (err) => {
    console.error(err);
  }
});
```

### 3. WXML 语法高亮
`.wxml` 文件会自动识别并高亮:
- 小程序组件 (view, text, button 等)
- 数据绑定 `{{ }}`
- 事件绑定 `bind:tap`, `catch:tap`
- 指令 `wx:for`, `wx:if`

### 4. 快速预览
在 VSCode 中可以直接:
- 右键 WXML 文件 → "在微信开发者工具中预览"
- 使用命令面板: `Cmd+Shift+P` → "小程序: 预览"

## 📝 项目配置示例

### app.json (全局配置)
```json
{
  "pages": [
    "pages/index/index",
    "pages/logs/logs"
  ],
  "window": {
    "backgroundTextStyle": "light",
    "navigationBarBackgroundColor": "#fff",
    "navigationBarTitleText": "我的小程序",
    "navigationBarTextStyle": "black"
  },
  "style": "v2",
  "sitemapLocation": "sitemap.json"
}
```

### project.config.json (项目配置)
```json
{
  "description": "项目配置文件",
  "packOptions": {
    "ignore": [],
    "include": []
  },
  "setting": {
    "bundle": false,
    "userConfirmedBundleSwitch": false,
    "urlCheck": true,
    "scopeDataCheck": false,
    "coverView": true,
    "es6": true,
    "postcss": true,
    "compileHotReLoad": false,
    "lazyloadPlaceholderEnable": false,
    "preloadBackgroundData": false,
    "minified": true,
    "autoAudits": false,
    "newFeature": false,
    "uglifyFileName": false,
    "uploadWithSourceMap": true,
    "useIsolateContext": true,
    "nodeModules": false,
    "enhance": true,
    "useMultiFrameRuntime": true,
    "useApiHook": true,
    "useApiHostProcess": true,
    "showShadowRootInWxmlPanel": true,
    "packNpmManually": false,
    "enableEngineNative": false,
    "packNpmRelationList": [],
    "minifyWXSS": true,
    "showES6CompileOption": false,
    "minifyWXML": true
  },
  "compileType": "miniprogram",
  "libVersion": "2.19.4",
  "appid": "你的AppID",
  "projectname": "my-first-miniprogram",
  "condition": {}
}
```

## 🔥 常见问题

### Q1: VSCode 中 WXML 没有语法高亮?
**解决方案:**
1. 确保已安装 "WXML - Language Service" 扩展
2. 重启 VSCode
3. 检查文件扩展名是否为 `.wxml`

### Q2: 代码提示不完整?
**解决方案:**
```bash
# 安装类型定义
npm install miniprogram-api-typings --save-dev
```

在 `jsconfig.json` 中添加:
```json
{
  "compilerOptions": {
    "target": "es2015",
    "lib": ["es2015"],
    "typeRoots": [
      "./node_modules/miniprogram-api-typings"
    ]
  }
}
```

### Q3: npm 构建后小程序运行报错?
**解决方案:**
1. 在微信开发者工具中: 工具 → 构建 npm
2. 确保 `project.config.json` 中 `"miniprogramRoot": "./"`
3. package.json 中 `miniprogram_npm` 配置正确

### Q4: 如何在 VSCode 中调试小程序?
**建议:**
- 使用微信开发者工具进行调试(更稳定)
- VSCode 用于编写代码,开发者工具用于预览和调试
- 两个工具可以同时打开同一项目,修改会实时同步

## 📚 学习资源

### 官方文档
- **小程序开发文档**: https://developers.weixin.qq.com/miniprogram/dev/framework/
- **组件文档**: https://developers.weixin.qq.com/miniprogram/dev/component/
- **API 文档**: https://developers.weixin.qq.com/miniprogram/dev/api/

### UI 组件库
- **Vant Weapp**: https://vant-contrib.gitee.io/vant-weapp/
- **WeUI**: https://github.com/wechat-miniprogram/weui-miniprogram
- **iView Weapp**: https://weapp.iviewui.com/

### 社区资源
- **微信开放社区**: https://developers.weixin.qq.com/community/develop/
- **awesome-miniprogram**: https://github.com/justjavac/awesome-wechat-weapp

## 🎯 下一步行动

完成 Node.js 安装后:
1. ✅ 验证 Node.js 和 npm 版本
2. ✅ 配置 npm 淘宝镜像
3. ✅ 下载并安装微信开发者工具
4. ✅ 创建第一个小程序项目
5. ✅ 在 VSCode 中打开项目开始开发

**准备就绪后,你就可以开始微信小程序开发了!** 🚀
