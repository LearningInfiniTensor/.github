# InfiniTensor：人工智能编译器与大模型系统训练营

[Github 讨论](https://github.com/orgs/LearningInfiniTensor/discussions)
|
[**常见问题**](../qa/doc.md)

| 序号 | 季度 | 时间 | 教学网站
|:---:|:----:|:---:|:-:
| 1 | 2024 夏季 | 2024.07.06 - 2024.09.29 | [opencamp.cn/InfiniTensor/2024summer](https://opencamp.cn/InfiniTensor/camp/2024summer)
| 2 | 2024 冬季 | 2024.12.14 - 2025.03.22 | [opencamp.cn/InfiniTensor/2024winter](https://opencamp.cn/InfiniTensor/camp/2024winter)

## 导学阶段 🧑‍💻💯

冬季训练营导学阶段时间为 2024 年 12 月 14 日至 2025 年 1 月 5 日，主要学习 C++ 和 Rust 语言基础知识。授课方式为录播课+在线答疑+习题，C++ 和 Rust 方向可二选一，至少一种语言的习题全部完成可参加训练营正式阶段。

- [夏季训练营仪式回放 🎉🎉🎉](https://opencamp.cn/InfiniTensor/camp/2024winter/stage/0?tab=video)

- C++ 基础课程 ➕ [习题 learning-cxx](https://github.com/LearningInfiniTensor/learning-cxx)
  |
  [夏季课程视频](https://opencamp.cn/InfiniTensor/camp/2024summer/stage/1?tab=video)
  |
  [晋级榜单](https://opencamp.cn/InfiniTensor/camp/2024winter/stage/1?tab=rank)

- Rust 基础课程 🦀 [习题 rustlings](https://rustlings.cool/)
  |
  [夏季课程视频](https://opencamp.cn/InfiniTensor/camp/2024summer/stage/2?tab=video)
  |
  [晋级榜单](https://opencamp.cn/InfiniTensor/camp/2024winter/stage/2?tab=rank)

> 习题评分方式参见 [Exam Grading 自动测试评分系统使用教程](../exam-grading-user-guide/doc.md)。

### 深度学习基础知识 📖

- [张量 Tensor](../reading/tensor.md)

## 支持团队 🤝

[InfiniTensor](https://github.com/InfiniTensor) 是基于清华大学高性能所科研团队建立的开源组织，主要研究领域包括人工智能编译器、大模型推理系统和国产硬件的生态建设。团队成员来自清华大学、中科院计算所以及其他科研院所、企事业单位。组织成立以来，发展出下列主要项目：

### 深度学习编译器 [InfiniTensor](https://github.com/InfiniTensor/InfiniTensor)

InfiniTensor 是开源组织的第一个项目，也是组织名的来源。该项目使用 C++ 开发，接受加载 ONNX 表示的模型实现高效推理，结构简洁、易于学习。另外，InfiniTensor 还支持多种硬件加速。

### 大模型推理引擎 [InfiniLM](https://github.com/InfiniTensor/InfiniLM)

相对于复杂多样的小型模型，大语言模型规模庞大、结构单一，需要高度特化的推理引擎才能达到高效推理。InfiniLM 项目是专为大模型推理设计的高性能推理引擎，使用 Rust 语言开发，功能丰富且接口简单有效。拉取项目后，无需任何配置，可以一个命令实现大语言模型的本地部署*，开始对话。

> \* 仍然需要提前安装 Rust 开发环境、下载模型文件。如果需要 GPU 加速，还需要安装驱动。
