<p align="center">
  <img src="assets/icon.svg" width="96" alt="Seedance 天宫运镜图标">
</p>

# Seedance 天宫运镜设计

`design-seedance-celestial-motion` 是一个面向 Seedance 图生视频的 Codex Skill。它把仙侠天宫、云海神殿、浮空宫殿、飞瀑、廊桥、星河古树等静态场景图，转换为带时间轴、人物动作、环境动态、色彩光线、声音和连续性约束的中文视频提示词。

核心原则：**人物有行为，环境有生命，主体不变形。**

仓库地址：[https://github.com/joshesye/design-seedance-celestial-motion](https://github.com/joshesye/design-seedance-celestial-motion)

## 核心能力

| 能力 | 说明 |
| --- | --- |
| 单图一镜到底 | 默认生成连续镜头，建立首帧后完成主运镜、人物动作和稳定收势 |
| 多图分镜 | 默认一图一段，不同空间使用明确硬切，避免建筑融合和人物串场 |
| 人物混合动态 | 远景使用缓步、转肩、点头、抬手示意；中近景支持递物、交谈姿态、并肩行走等关系动作 |
| 肢体交流 | 默认通过身体朝向、视线、手势和回应动作表现交流，不自动生成对白或明显口型 |
| 环境分层动态 | 云海分层漂移、银河沿原轨迹流动、星星错峰闪烁、树叶和松针按风向分层摆动 |
| 物理连续性 | 锁定人物身份、人数、服色、建筑结构、空间透视、风向、重力和遮挡关系 |
| 完整交付结构 | 输出时间轴、UI、色光、音乐音效、对白规则以及连续性与负面约束 |

## 适用场景

- 天宫、神殿、仙山、浮岛、云桥、天阶和悬空栈道
- 飞瀑、云海、水面、雾气、古松、灯笼和帘幔
- 银河、星河、月夜、繁星和体积光场景
- 单人背影、双人交流、多人队列和远景群像
- 需要缓推、横移、跟拍、俯拍或遮挡揭示的电影化镜头

## 安装

将仓库直接克隆到 Codex Skills 目录：

```bash
git clone https://github.com/joshesye/design-seedance-celestial-motion.git \
  ~/.codex/skills/design-seedance-celestial-motion
```

安装后，从下一条消息起即可调用该 Skill。

更新已安装版本：

```bash
git -C ~/.codex/skills/design-seedance-celestial-motion pull
```

## 使用方法

上传一张或多张参考图，然后在请求中明确调用 Skill。

### 单图运镜

```text
使用 $design-seedance-celestial-motion，根据这张天宫场景图生成 4 秒 Seedance 图生视频提示词。人物需要自然交流，云海与树叶持续运动，一镜到底。
```

### 多图分镜

```text
使用 $design-seedance-celestial-motion，按上传顺序把这三张图设计成 8 秒 Seedance 视频。每张图对应一个分镜，不同空间硬切，保持人物服色和建筑稳定。
```

### 指定人物与环境动态

```text
使用 $design-seedance-celestial-motion。远景人物缓步并抬手示意，同伴点头回应；银河沿原有弧线缓慢流动，星星错峰闪烁，松针随统一风向轻摆。
```

未指定时长时，单图默认约 4 秒；多图通常每段 1.5–2.5 秒，总长控制在 4–10 秒。

## 输出结构

Skill 默认按以下顺序生成可复制提示词：

1. `视频提示词`
2. `Timestamped prompts`
3. `UI / Graphic layout`
4. `Color / Lighting`
5. `Music / SFX`
6. `Dialogue / voice-over`
7. `Continuity / Negative constraints`

每个包含人物的分镜都会明确：

```text
人物开始状态 → 可见主动作 → 同伴回应或自然收势 → 人物段尾状态
```

环境动态只会激活参考图中实际存在的元素，不会凭空增加银河、树木、瀑布、人物或动物。

## 稳定性原则

- 每段只保留一个主运镜，轻微俯仰或升降只能作为辅助运动。
- 缓慢推进必须产生真实空间视差，不使用数码放大冒充推进。
- 建筑、桥梁、栏杆、门洞、浮岛和地平线保持刚性稳定。
- 人物可以缓步和交流，但不得复制、换色、滑步、穿模或离开安全路径。
- 衣摆、长发、树叶、帘幔和灯笼共享主风向，但使用不同延迟、频率和幅度。
- 云、银河、星星、瀑布、水面和雾气遵守各自的空间层次与物理规律。

## 目录结构

```text
design-seedance-celestial-motion/
├── SKILL.md
├── agents/
│   └── openai.yaml
├── assets/
│   └── icon.svg
├── references/
│   ├── example-cases.md
│   ├── motion-archetypes.md
│   └── output-contract.md
├── tests/
│   ├── check-dynamic-contract.sh
│   └── check-readme.sh
└── docs/
    └── superpowers/
```

- [`SKILL.md`](SKILL.md)：主工作流程、人物动态和环境动态规则。
- [`motion-archetypes.md`](references/motion-archetypes.md)：常见天宫场景的镜头运动原型。
- [`example-cases.md`](references/example-cases.md)：六组可复用的分镜案例。
- [`output-contract.md`](references/output-contract.md)：最终提示词的字段、模板和负面约束。

## 验证

检查人物、云海、银河、星星和植被动态契约：

```bash
sh tests/check-dynamic-contract.sh
```

检查 README 的关键安装与使用信息：

```bash
sh tests/check-readme.sh
```

两项检查通过时会分别输出：

```text
dynamic contract: PASS
README contract: PASS
```
