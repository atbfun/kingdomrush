本移植的核心源码是 `../web/engine.js`，无需 C++、WebAssembly 或编译工具链。
它不依赖 DOM、网络或绘制代码，可直接由 Node.js 加载运行状态机与战斗回归测试。
表现、音频和输入分别位于 `../web/renderer.js`、`audio.js`、`app.js`。
