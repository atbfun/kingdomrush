# 王国保卫战：前线 · HTML5

从 `source/kingdomrush/kingdomrush.swf` 提取真实资源与 ActionScript 配置，
重建为无框架、无 CDN、无需 Flash 的 Canvas 塔防小游戏。中文界面，支持鼠标、触屏和键盘。

## 运行

在仓库根目录运行：

```sh
python3 target/kingdomrush/serve.py
```

访问 [http://127.0.0.1:18868/](http://127.0.0.1:18868/)。用 `--port 其他端口` 可以更换端口。
服务器使用 ThreadingHTTPServer，并扩大连接队列，支持地图与精灵并行加载。
也可直接双击 `web/index.html` 离线游玩；整个游戏目录需完整保留，包含 `web/assets -> ../assets`。
Windows 或不保留软链接的压缩工具，可将 `assets` 文件夹复制到 `web/assets`。

## 已实现

- 15 张原版地图、原版路径（三条行走车道）、原版战役建塔位置与分支波次。
- 弓箭、兵营、法师、炮兵四类塔，三级基础升级、八种四级专精、出售返款与范围显示。
- 物理/魔法护甲、地面/飞行目标区分、炮弹范围伤害、兵营拦截与士兵重生。
- 艾尔利克移动/战斗/成长/复活、援军、火雨、技能冷却、金币、生命与胜败结算。
- 6/11/15 关首领、通关后下一关、重试、自由选择战场及三档难度。
- 暂停、1×/2×/3×速度、后台自动暂停、帮助、全屏、音量开关。
- 战果星数、难度和静音状态本地保存；存档损坏或存储禁用时可以继续游戏。
- 原版音乐与声效：首次手势解锁，按需解码，HTTP 使用 Web Audio，file:// 使用 HTML Audio。

| 操作 | 鼠标/触屏 | 快捷键 |
|---|---|---|
| 选择建造点 | 点击战场空地，或使用建造位置选择框 | Tab 操作选择框 |
| 建造 | 点击四类防御塔卡片 | 1–4 |
| 升级/出售 | 选择已有塔，在指挥面板操作 | Tab + Enter/空格 |
| 调整集结点 | 兵营面板的集结点按钮，再点击附近道路 | — |
| 移动英雄 | 点击英雄按钮，再点击道路 | H |
| 火雨/援军 | 点击技能，再点击道路 | Q / E |
| 下一波 | 点击召唤按钮 | N |
| 暂停 | 点击暂停按钮 | P / 空格 |
| 取消目标 | 点击取消 | Esc |

按钮获得键盘焦点时保留其原生 Enter/空格行为。主战场聚焦时可使用游戏快捷键。

## 与原版的边界

这是基于原版数据的 **HTML5 玩法重建**。地图、路径、初始金币、普通敌人基础参数、
战役刷怪列表与基础塔参数来自 SWF。所有关卡可玩，但只对第一关完成了正常资源的完整通关策略验证；
其他关卡经过数据和渲染验证，未声称全部战役平衡已逐关通关。

- 首领使用统一路径战斗模型，未复刻原版多阶段脚本、地图破坏、洞穴遮挡与环境机关。
- 专精保留原版外观、价格和基础攻击参数；复杂技能做了简化。图腾为减速，死灵击杀可召唤临时单位，钻机附带减速。
- 英雄固定为艾尔利克，成长/自动战斗规则做了简化；未实现完整英雄选择、技能树与星级科技。
- 未实现英雄/钢铁支线挑战、成就、商店、在线排行榜和原版剧情演出。
- 所有提取到的建造位置开放；少数原版特殊/付费塔位在重建版中按普通塔位处理。
- 动画提取每个单位的 12 帧样本，使用方向翻转与脚底排序；非原版全部方向/全部状态逐帧播放。
- 本地服务器的性能样本接近 60 FPS；这不是所有设备与极端战斗规模的帧率保证。

## 工程

```text
analysis/                原始身份、反编译证据、资产清单、自检记录、截图与浏览器验收 JSON
assets/images/           9,579 张重建 PNG（包含原始透明度）
assets/sprites/          71 张清理后的精灵图集
assets/audio/            384 段原生音频（23 MP3、361 AAC/M4A）
assets/game-data.json    15 关与游戏参数
web/engine.js            无 DOM 的确定性模拟引擎
web/renderer.js          Canvas 绘制、图片校验与几何兜底
web/audio.js             懒加载音频与静音/暂停策略
web/app.js               输入、状态、存档与界面
web/data.js              可离线使用的配置数据
tests/                   规则回归测试、真实 Chrome 自动验收
serve.py                 本地静态服务器
```

没有构建步骤。修改 `web/` 文件后刷新即可。`data.js`、`sprites.js`、`sounds.js` 是生成文件。
运行时不请求第三方服务。美术与声音来自用户提供的 SWF。

## 验证

```sh
node --test target/kingdomrush/tests/*.test.cjs
node target/kingdomrush/tests/browser.cjs
```

规则测试 17 项：覆盖扣费/返款、升级专精、护甲、波次、暂停、技能、拦截、飞行目标、
首领、终局和第一关正常资源通关。浏览器脚本启动独立本地服务器与临时 Chrome 配置，
验证桌面、390px 触屏、file://、损坏图片、损坏存档、全部地图和画面像素覆盖率。

浏览器脚本需要 Playwright 与本机 Chrome。可设置 `PLAYWRIGHT_MODULE`、`CHROME_PATH`、`PYTHON`；
默认支持本机 Codex/ChatGPT 提供的 Playwright 路径。测试依赖不属于游戏运行依赖。
详情见 `analysis/browser_verification.json` 与 `analysis/review_findings.md`。

## 重新提取

依赖：Python + Pillow、Java 11+、[JPEXS FFDec 26.3.0](https://github.com/jindrapetrik/jpexs-decompiler/releases/tag/version26.3.0)、FFmpeg（AAC 编码器）。
本次使用 JPEXS 标准命令导出 ActionScript / sprite / sound；全部源文件保持只读。
可执行步骤记录于 `analysis/reverse_engineering_report.md`。

本机 `ATBPort` conda 环境缺少 Pillow，资产转换使用 Codex 提供的 Python 运行时。
REA 已调用但不支持该 SWF；`grill-with-docs` 未安装，使用本地自检与独立代码审查补齐检查，
未声称执行了该缺失技能。完整进度见 `source/kingdomrush/MIGRATE.md`。
