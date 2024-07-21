# InfiniTensor：人工智能编译器与大模型系统训练营（2024 夏季）

[教学网站](https://opencamp.cn/InfiniTensor/camp/2024summer)
|
[参与讨论](https://github.com/orgs/LearningInfiniTensor/discussions)
|
[**常见问题**](../qa/doc.md)

## 基础阶段 🧑‍💻💯

本次训练营基础阶段时间为 2024 年 7 月 20 日至 8 月 4 日，主要学习 C++ 和 Rust 语言基础知识。授课方式为直播课+在线答疑+习题，C++ 和 Rust 方向可二选一，至少一种语言的习题全部完成可晋级专业阶段。

习题评分方式参见 [Exam Grading 自动测试评分系统使用教程](../exam-grading-user-guide/doc.md)。

### C++ 基础课程 ➕

[习题（learning-cxx）](https://github.com/LearningInfiniTensor/learning-cxx)
|
[教室](https://opencamp.cn/InfiniTensor/camp/2024summer/stage/1)
|
[晋级榜](https://opencamp.cn/InfiniTensor/camp/2024summer/stage/1?tab=rank)

上课时间：

- 7 月 22 日（周一）14:00-15:00
- 7 月 25 日（周四）14:00-15:00
- 7 月 29 日（周一）14:00-15:00
- 8 月 1 日（周四）14:00-15:00

### Rust 基础课程 🦀

[习题（rustlings）](https://rustlings.cool/)
|
[教室](https://opencamp.cn/InfiniTensor/camp/2024summer/stage/2)
|
[晋级榜](https://opencamp.cn/InfiniTensor/camp/2024summer/stage/2?tab=rank)

上课时间：

- 7 月 22 日（周一）15:30-16:30
- 7 月 25 日（周四）15:30-16:30
- 7 月 29 日（周一）15:30-16:30
- 8 月 1 日（周四）15:30-16:30

## 训练营仪式 🎉🎉🎉

- 开营仪式已于 2024 年 7 月 20 日晚 20:00 顺利举行，可观看[腾讯会议回放](https://meeting.tencent.com/v2/cloud-record/share?id=81da07c1-a905-4955-b968-a8caa9644271&from=3)， 密码 `DWH7`；
- 项目选题会将于 2024 年 8 月 17 日晚 20:00 线上举行，腾讯会议 #405-408-245 或点击[链接](https://meeting.tencent.com/dm/CFTCSJnmJkeL)入会；

## 支持团队 🤝

[InfiniTensor](https://github.com/InfiniTensor) 是基于清华大学高性能所科研团队建立的开源组织，主要研究领域包括人工智能编译器、大模型推理系统和国产硬件的生态建设。团队成员来自清华大学、中科院计算所以及其他科研院所、企事业单位。组织成立以来，发展出下列主要项目：

### 深度学习编译器 [InfiniTensor](https://github.com/InfiniTensor/InfiniTensor)

InfiniTensor 是开源组织的第一个项目，也是组织名的来源。该项目使用 C++ 开发，接受加载 ONNX 表示的模型实现高效推理，结构简洁、易于学习。另外，InfiniTensor 还支持多种硬件加速。

### 深度学习编译器 [RefactorGraph](https://github.com/InfiniTensor/RefactorGraph)

RefactorGraph 即“重构图表示”，是继 InfiniTensor 之后的下一代深度学习编译器项目，使用 C++ 开发。顾名思义，该项目重构了一种通用的计算图表示，可以有效支持深度神经网络程序加载、图结构变换的优化、核函数选择和执行的不同表示需求，并在多层之间高效地转换。该项目可以单独实现模型的加载和推理，也可以作为前端，优化模型后传递给 InfiniTensor。

### 大模型推理引擎 [InfiniLM](https://github.com/InfiniTensor/InfiniLM)

相对于复杂多样的小型模型，大语言模型规模庞大、结构单一，需要高度特化的推理引擎才能达到高效推理。InfiniLM 项目是专为大模型推理设计的高性能推理引擎，使用 Rust 语言开发，功能丰富且接口简单有效。拉取项目后，无需任何配置，可以一个命令实现大语言模型的本地部署*，开始对话。

> \* 仍然需要提前安装 Rust 开发环境、下载模型文件。如果需要 GPU 加速，还需要安装驱动。

### 寒武纪驱动绑定 [cndrv](https://github.com/InfiniTensor/cndrv)

[![Latest version](https://img.shields.io/crates/v/cndrv.svg)](https://crates.io/crates/cndrv)

cndrv 是中科寒武纪公司推出的系列加速硬件的 Rust 驱动绑定。该项目对 C 接口重新做了安全的 Rust 抽象，兼顾性能和易用性。现已发布到 crates.io，crates.io 上第二个带有 #cambricon 标签的 crate（第一个是其依赖项，用于定位寒武纪开发环境）。本项目已作为 InfiniLM 项目的依赖投入使用。
