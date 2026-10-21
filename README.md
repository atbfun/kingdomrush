# 王国保卫战：前线 · HTML5 (Kingdom Rush Frontiers)

提取真实原版资源与配置，重建为无外部依赖、纯前端 Canvas 的塔防小游戏。支持中文界面、鼠标、触屏与键盘操作。

🎮 **在线试玩**：[https://atbfun.github.io/kingdomrush/](https://atbfun.github.io/kingdomrush/)

---

## GitHub Pages 部署说明

本项目已配置 GitHub Actions 自动发布工作流（位于 [`.github/workflows/deploy-pages.yml`](.github/workflows/deploy-pages.yml)）。

### 首次启用步骤

1. 打开 GitHub 仓库设置：**Settings** -> **Pages**。
2. 在 **Build and deployment** > **Source** 下拉菜单中选择 **GitHub Actions**。
3. 推送代码到 `main` 分支后，GitHub Actions 将自动打包 `web` 与 `assets` 并发布上线。

---

## 本地运行

在仓库根目录执行：

```sh
python3 kingdomrush/serve.py
```

然后在浏览器打开 [http://127.0.0.1:18868/](http://127.0.0.1:18868/)（支持 `--port <端口>` 参数）。

也可以直接双击 `kingdomrush/web/index.html` 离线游玩。

---

## 游戏特性

- **15 张原版地图**：三车道路径、原版战役建塔位与波次数据。
- **四类基础防御塔**：弓箭、兵营、法师、炮兵；支持 3 级基础升级与 8 种 4 级专精、出售返款与射程预览。
- **英雄与技能**：英雄艾尔利克（移动/战斗/成长/复活）、火雨范围轰击、援军拦截。
- **伤害与机制**：物理/魔法护甲、地面/飞行目标区分、炮弹范围伤害、兵营集结点调整与士兵重生。
- **战役系统**：6/11/15 关首领关卡、3 档难度（休闲/普通/老兵）、通关评星与本地存档保存。

### 快捷键

| 操作 | 快捷键 | 鼠标 / 触屏 |
|---|---|---|
| 选择建造点 | `Tab` 切换选择框 | 点击战场空地或右侧选择框 |
| 建造防御塔 | `1` – `4` | 点击对应卡片 |
| 升级 / 出售 | `Tab` + `Enter` / 空格 | 点击指挥面板按钮 |
| 英雄移动 | `H`，再点击道路 | 点击英雄头像，再点击道路 |
| 火雨技能 | `Q`，再点击道路 | 点击火雨技能，再点击道路 |
| 援军技能 | `E`，再点击道路 | 点击援军技能，再点击道路 |
| 提前下一波 | `N` | 点击右下角召唤按钮 |
| 暂停 / 继续 | `P` 或 `空格` | 点击暂停按钮 |
| 取消当前选择 | `Esc` | 点击取消按钮 |

---

## 测试验证

运行规则与数值逻辑回归测试：

```sh
node --test kingdomrush/tests/*.test.cjs
```
