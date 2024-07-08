# 基于 Rust 的大模型推理引擎使用教程

按此教程操作，可在本地计算机运行大模型推理，实现对话和文本生成任务。下列步骤完成了 4 项工作：

1. 准备 Rust 环境；
2. 获取 InfiniLM 推理引擎源码；
3. 下载模型文件；
4. 执行推理；

## 步骤

### 1. 准备 Rust 环境

> **NOTICE** 下列操作来自[官方文档](https://www.rust-lang.org/tools/install)。

根据操作系统环境选择下列步骤之一：

- 1.1 Windows Native

  > **NOTICE** Windows 用户推荐采用原生 Windows 环境开发 Rust 项目。

  > **NOTICE** Rust 工具链依赖 Visual Studio 作为基础，参考[微软官方文档](https://learn.microsoft.com/zh-cn/windows/dev-environment/rust/setup#install-visual-studio-recommended-or-the-microsoft-c-build-tools)安装。下述简单步骤假设用户已经准备好 Visual Studio 或 Microsoft C++ 生成工具。

  如图所示，下载并运行安装程序。

  ![Download Installer](1-1-1.png)

  Just press enter!

  ![Install Rust](1-1-2.png)

- 1.2 WSL

  > **NOTICE** 仅针对已有配置好的 WSL2 且不方便在原生 Windows 环境开发的情况，因此配置 WSL2 的步骤不再介绍。

  > **NOTICE** Windows 用户首选原生 Windows 环境，其次 WSL2，**不推荐**使用第三方虚拟机软件。

  在 WSL2 Bash 中使用此命令安装 Rust（Just press enter!）：

  ```bash
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  ```

- 1.3 Linux

  原生 Linux 环境安装方式同 WSL。

- 1.4 更新 Rust

  本项目依赖 Rust 1.79（Latest Stable），已安装 Rust 工具链的用户使用此命令升级：

  ```bash
  rustup update
  ```

- 1.5 Clang 配置

  本项目基于 bindgen 实现 Nvidia 加速支持，环境中需要安装 Clang。希望使用 Nvidia 加速的用户，请参考 [bindgen 官方手册](https://rust-lang.github.io/rust-bindgen/requirements.html)步骤安装。

### 2. 获取 InfiniLM 推理引擎源码

使用

```bash
git clone https://github.com/InfiniTensor/InfiniLM
```

或配置 ssh 并使用：

```bash
git clone git@github.com:InfiniTensor/InfiniLM.git
```

获取推理引擎。

### 3. 下载模型

推荐使用 TinyLlama-1.1B-Chat-v1.0 模型，因为这个模型在规模、性能和使用便捷性方面较为平衡。

从[官方网站](https://huggingface.co/TinyLlama/TinyLlama-1.1B-Chat-v1.0/tree/main) 或[镜像站](https://hf-mirror.com/TinyLlama/TinyLlama-1.1B-Chat-v1.0/tree/main) 下载模型文件。点击网页下载下列 3 个文件即可：

> **NOTICE** 不推荐使用 git 拉取，因为 git LFS 配置复杂效果也不好。

![下载模型文件](3.png)

### 4. 执行推理

- 4.1 准备模型文件

  将上一步骤下载的 3 个文件移动到同一个目录，假设为 `tinyllama_origin`。然后进入 InfiniLM 项目根目录并执行此命令，以转换模型格式：

  ```bash
  cargo cast --model tinyllama_origin --dt f16
  ```

  > **NOTICE** 上述 `tinyllama_origin` 目录为示例占位路径，请用户自行替换成实际路径。

  > **NOTICE** 上述形式不意味着需要将模型文件放到 InfiniLM 项目根目录。且**不推荐**用户将模型文件放入项目目录，以免干扰 git 追踪。

  > **NOTICE** `--model` 参数允许传入相对路径或绝对路径。例如，在 `InfiniLM` 目录同级创建 `tinyllama_origin` 目录时，参数为 `--model ../tinyllama_origin`。

  > **NOTICE** Windows 上安装了 Nvidia 加速环境的用户此命令将额外产生多个形式如下的警告：
  >
  > ```plaintext
  > warning: common-nv@0.0.0: Compiler family detection failed due to error: ToolExecError: Command "nvcc" "-E" "...\\target\\release\\build\\common-nv-f91598a6e4b91d5b\\out\\7081333750370202046detect_compiler_family.c" with args nvcc did not execute successfully (status code exit code: 1).
  > ```
  >
  > 这些警告可以忽略，不影响命令执行。

  此命令执行成功后将在 `tinyllama_origin` 目录同级生成 `tinyllama_origin_f16` 文件夹，其中包含转换后的模型文件。

- 4.2 文本生成及采样参数

  执行：

  ```bash
  cargo generate --model tinyllama-origin_f16 --prompt "Once upon a time,"
  ```

  输出：

  ```plaintext
  Finished `release` profile [optimized] target(s) in 0.22s
     Running `target\release\xtask.exe generate --model tinyllama-origin_f16 --prompt "Once upon a time,"`

  Once upon a time, there was a young girl named Lily. Lily was a kind and gentle soul, always looking for ways to help others. She loved to read, and her favorite book was about a brave knight who saved a princess from a dragon.

  ...
  ```

  > **NOTICE** 此命令的 `--model` 参数相关要求与前述 cast 命令相同。

  用户可能发现，对于相同的模型和提示词，每次生成的结果完全相同。这是因为模型默认采用“最优”的采样策略。这种采样方式也可能产生极长或重复的结果。通过设置随机采样参数，可以得到多样性的结果，且可能更符合人类阅读习惯：

  ```bash
  cargo generate --model tinyllama-origin_f16 --prompt "Once upon a time," --temperature 0.9 --top-p 0.9 --top-k 100
  ```

  额外的 3 个参数，`temperature` 影响模型的随机性，推荐取值范围 [0.5, 2.0]；`top-p` 和 `top-k` 影响采样的范围，`top-p` 推荐取值范围 [0.5, 1.0]，`top-k` 推荐取值范围 [20, 200]。

- 4.3 对话

  执行此命令：

  ```bash
  cargo chat --model tinyllama-origin_f16
  ```

  启动对话：

  ```plaintext
      Finished `release` profile [optimized] target(s) in 0.22s
       Running `target\release\xtask.exe chat --model ..\tinyllama-origin_f16\`

  ######################################

  # 欢迎使用九源推理框架-大模型单机对话demo #

  ######################################
  PID = 3596

  /list           列出现存的会话及对话次数
  /create         新建会话
  /fork [id]      复制当前会话或指定会话
  /switch <id>    切换至指定会话
  /drop [id]      丢弃当前会话或指定会话
  /args           打印当前参数
  /args key value 设置指定参数
  /help           打印帮助信息

  使用 /exit 或 Ctrl + C 结束程序
  =====================================

  Create new session 0.
  User[0]:
  ```

  用户可交互输入开始对话。

  > **NOTICE** 此命令的 `--model` 参数相关要求与前述 cast 命令相同。

  > **NOTICE** 此命令默认同样采用“最优”的采样策略，设置随机采样参数的方式与前述 generate 命令相同。