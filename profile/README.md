# InfiniTensor：人工智能编译器与大模型系统训练营（2024 夏季）

[教学网站](https://opencamp.cn/InfiniTensor/camp/2024summer)
|
[参与讨论](https://github.com/orgs/LearningInfiniTensor/discussions)
|
[**常见问题**](../qa/doc.md)

## 开营仪式 🎉🎉🎉

InfiniTensor 2024 夏季训练营开营仪式将于 2024 年 7 月 20 日晚 20:00 于线上举行。

参加仪式：\# 腾讯会议：242-395-560 或链接 [https://meeting.tencent.com/dm/6LV9k8mUVl8X](https://meeting.tencent.com/dm/6LV9k8mUVl8X)。

## 导学阶段实践 💻

我们鼓励学员通过实践理解项目。初学者推荐在本机跑起 [InfiniLM](https://github.com/InfiniTensor/InfiniLM) 项目，以熟悉 git 命令，了解模型文件、推理引擎的概念和推理的过程。

参考[基于 Rust 的大模型推理引擎使用教程](../InfiniLM-user-guide/doc.md)完成实践。

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
