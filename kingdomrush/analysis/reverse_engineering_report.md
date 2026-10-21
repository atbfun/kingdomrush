# Kingdom Rush Frontiers：SWF 逆向与重建报告

日期：2026-10-19。证据范围：用户提供的本地 SWF、JPEXS 静态反编译和新实现浏览器运行。

## 输入身份与工具路由

- 文件：`source/kingdomrush/kingdomrush.swf`，70,172,782 字节。
- SHA-256：`728c7154c23f607de98188813b52d6e6a7f260a7f154a13424203e1499c76ebe`。
- `FWS`，SWF v10，30 FPS，800×600。
- REA `open_binary` 已优先调用，返回 `target_unavailable` / `unsupported_target` /
  `unsupported binary format`，不可据此声称存在 native/PE 反编译结果。
- 本机存在 Hopper，但输入为 AVM2 Flash 字节码；PE、RTTI、UPX 和 native CPU CFG 不适用。
- 后续使用 [JPEXS FFDec](https://github.com/jindrapetrik/jpexs-decompiler) 26.3.0 与原生结构解析。

内容含 `kingdomrushfrontiers.com`、`EnemyEfreeti`、`EnemyCanibal`、`EnemySaurianBroodguard`、
`music_Desert_Battle`、`music_Jungle_Battle` 和 `music_Underground_Battle`。
因此本任务输入实际是《王国保卫战：前线》，不是第一代 Kingdom Rush。

## 容器与资产

完整 Tag 计数、偏移、ID、SymbolClass 和 SHA 见 `swf_inventory.json`。
根时间轴包括 2 个 DoABC、1,038 个 DefineSprite、9,478 个 DefineBitsLossless2、
45 个 DefineBitsLossless、30 个 JPEG3、19 个 JPEG2、7 个旧 JPEG 和 384 个 DefineSound。
完整脚本类列表为 JPEXS 解析结果 1,298 项；不是 1,298 个可玩的内容单元。

`tools/extract_kingdomrush.py` 对 ARGB 无损位图解压、反预乘 Alpha、恢复 JPEG3 独立 Alpha，
输出 9,579 张 PNG。全部 384 个 DefineSound 已提取：23 个内嵌 MP3 直接复用；
361 个 SWF ADPCM 由 JPEXS 导出 FLV 音频载体，再用 FFmpeg 转 AAC/M4A。
本机 FFmpeg 无 libvorbis 编码器，因此使用浏览器原生支持的 AAC；没有伪造 Ogg 转码结果。

`audio.json` 建立 SymbolClass → 资源文件的完整声音映射。
`sprites.json` 建立 Sprite ID → 图集、宽高、帧数与 FrameLabel 的映射。
运行时只加载当前需要的地图与角色，不遍历加载 9,579 张图片或预建数百 Audio 实例。

### Sprite 导出中的初始化差异

JPEXS 静态渲染不执行 `EnemyCommon.init()`。直接导出会让 `debuff_Burn`、`debuff_Poison`、
`debuff_Weakness`、`debuff_Silence`、`effect_Healing`、`effect_Stun` 等默认时间轴子节点显现，
使正常行走敌人始终着火/中毒。视觉复查确认了该问题。

`tools/prepare_kingdomrush_sprites.py` 创建导出专用 SWF 副本；对上述具名节点找到 display depth，
移除该 depth 的 Place/Remove 操作。原始 SWF 不修改，FrameLabel/ShowFrame 不改。
46 个 Sprite 经过清理，清单见 `sprite_export_cleanup.json`；最后为 71 个角色/塔导出浏览器图集。

## 数据与规则证据

`analysis/decompiled/scripts/Level1.as` 至 `Level15.as`：

- 构造函数给出建塔坐标、兵营集结点、按路线与三车道分组的 `new Point` 数组。
- `loadCampaign()` 给出初始金币、20 生命与波次；同级还包含原版 Heroic/Iron 配置，后两者未接入。
- `波` 构造函数的字段是 spawns / interval / pathIndex / notification；interval 为 0 的后续项与上一波同时启动。
- `§default const with§` 的参数依次为主敌人类、交替敌人类、连续类型数、数量、间隔帧、后续组等待帧、固定车道标记、车道。
- 原版以 30 FPS 计时，Web 版转换为秒；模拟使用 60 Hz 更新。

`§switch for var§.as` 为游戏设置类（混淆名保留为证据）：

- sellPercent = 0.6；rangeRatio = 0.7。
- 弓箭塔初级 cost 70，damage 4–6，reload 24 frames，range width 220。
- 法师塔初级 cost 100，damage 9–17，reload 45 frames，range width 220。
- 炮兵塔初级 cost 125，damage 8–15，reload 90 frames，area 65。
- 兵营初级 cost 70，三名士兵；基础伤害 1–3。
- EnemyBouncer：normal HP 50，gold 5，speed 0.9；EnemyDesertRaider：HP 200、physical armor 30、gold 16。

`tools/build_kingdomrush_data.py` 只用正则结构解析与限制为数字算术的 Python AST，
不执行反编译代码。对敌人类引用的 settings 字段进行别名映射；数据覆盖所有战役刷怪类型。

| 关 | 路线组 | 建造位置 | 波次 |
|---|---:|---:|---:|
| 1 | 2 | 12 | 6 |
| 2 | 2 | 15 | 8 |
| 3 | 2 | 14 | 10 |
| 4 | 2 | 16 | 14 |
| 5 | 3 | 17 | 15 |
| 6 | 4 | 14 | 14 |
| 7 | 4 | 18 | 15 |
| 8 | 3 | 15 | 15 |
| 9 | 5 | 14 | 15 |
| 10 | 4 | 16 | 15 |
| 11 | 2 | 14 | 15 |
| 12 | 5 | 14 | 15 |
| 13 | 5 | 16 | 15 |
| 14 | 6 | 19 | 15 |
| 15 | 9 | 17 | 15 |

地图位图 ID 顺序为 2347、2344、2341、2338、2335、2332、2329、2320、2317、2314、2311、2308、2305、2302、2299。
中文显示名为移植版界面文案，不声称来自原版完整语言包。

## 重建与限制

模拟分为 Game 状态机、塔攻击/投射物、敌人路径移动、士兵/英雄拦截、技能与结算。
Canvas 与模拟解耦；图片绘制统一经过 complete + naturalWidth 检查，失败使用几何替代。
CSS/脚本/关卡均为本地文件，初始化使用 readyState 双保险，首屏立即渲染。

八种塔专精、首领、英雄成长与部分动态特效是明确的简化重建，未反编译后逐指令复现。
复杂地图事件、地下洞穴前景遮挡、完整英雄与科技树、支线挑战、成就不在此实现内。
原版多方向/战斗动画仅采样为 12 帧行走/待机图集，Web 渲染使用方向翻转。
第一关正常资源完整策略验证获得 20 生命、84 击杀；其他关卡未宣称全通关平衡验收。

## 复现

JPEXS 安装于临时工作路径 `/tmp/atb-kingdomrush-tools/ffdec/`，不修改本机 REA 配置。

```sh
java -Xmx3g -jar /tmp/atb-kingdomrush-tools/ffdec/ffdec.jar -export script /tmp/atb-kingdomrush-tools/all-code source/kingdomrush/kingdomrush.swf
java -Xmx2g -jar /tmp/atb-kingdomrush-tools/ffdec/ffdec.jar -export sound /tmp/atb-kingdomrush-tools/sound source/kingdomrush/kingdomrush.swf
python3 tools/extract_kingdomrush.py
python3 tools/build_kingdomrush_data.py
python3 tools/prepare_kingdomrush_sprites.py
```

Sprite 用 `-selectid` 选择 `assets/sprites.json` 中的 71 个 ID，`-ignorebackground -export sprite`，
输入 `/tmp/atb-kingdomrush-tools/kingdomrush-export.swf`，输出 `/tmp/atb-kingdomrush-tools/rendered-clean/`。
然后运行 `python3 tools/pack_kingdomrush_assets.py`。这两个资产脚本需要 Pillow。
生成的资源与配置已全部随工程交付，普通用户运行游戏无需任何逆向工具。

## 验收证据

`browser_verification.json` 保存最终 Chrome 版本、像素采样、动画帧样本和测试名称。
首屏、正常战斗、第二关截图分别为 `screen_initial.png`、`screen_gameplay.png`、`screen_stage2.png`；
另有移动端与图片损坏场景截图。像素占比直接读取 Canvas RGBA，分母为整个 800×600 画布，
不把外围网页背景计入游戏画面的覆盖率。
