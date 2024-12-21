# 天数服务器使用指南

[天垓 100 加速卡](https://www.iluvatar.com/productDetails?fullCode=cpjs-yj-xlxl-tg100)

## 登录

```shell
ssh root@yaan.saas.iluvatar.com.cn -p <port>
```

每个用户有自己的端口和密码。

### 创建和切换用户

默认将提供 root 账户，但一切操作不推荐在 root 上进行，**强烈建议**创建一个新用户。
可按以下步骤创建用户：

> 创建用户方式不唯一，以下步骤仅供参考。

1. 创建用户

   ```shell
   useradd -m <name>
   ```

2. 设置密码

   ```shell
   passwd <name>
   ```

   并按照提示输入密码两次。

3. 通过用户组赋予权限

   ```shell
   usermod -aG sudo <name>
   apt-get install sudo
   ```

4. 修改默认 shell

   新用户使用的默认 shell 是 sh，可以修改为 bash。

   先切换一次新用户：

   ```shell
   su <name>
   ```

   立即按 `ctrl+d` 退回即可。然后使用

   ```shell
   chsh -s /usr/bin/bash <name>
   ```

   将默认 shell 改为 bash，再登入新用户时可自动启动 bash。

## 硬件状态监测

```shell
ixsmi
```

功能对应英伟达 `nvidia-smi`，使用

```shell
ixsmi -h
```

查看帮助信息，使用

```shell
ixsmi -l 1
```

持续监测。

## CUDA 编译

工具链位于 `/usr/local/corex`，英伟达 `nvcc` 对应 `bin/clang++`，所有必要库在 `lib` 中。若使用新用户，建议先添加相关环境变量以方便调用：

```shell
export COREX_HOME=/usr/local/corex
export PATH=$PATH:$COREX_HOME/bin
export LIBRARY_PATH=$LIBRARY_PATH:$COREX_HOME/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$COREX_HOME/lib
```

然后可以如常使用：

```shell
clang++ -lcudart <src>.cu -o <program>
```

作为测试，可以尝试编译环境自带的 cuda 示例：

```shell
clang++ -lcudart $COREX_HOME/examples/cuda/saxpy.cu -o saxpy
./saxpy
```

将输出：

```plaintext
Max error: 0.000000
SUCCESS
```

## 与英伟达/CUDA 的主要差异

| 项目            | 英伟达 GPU   | 天数智芯天垓
|:---------------:|:----------:|:-:
| 预定义宏         | `__NVCC__` | `__ILUVATAR__`
| 双精度支持       | 全面支持     | 支持有限，建议不使用
| 线程束 WARP_SIZE | 32         | 64
| 线程块最大规模    | 1024       | 4096

## 基于 xmake 开发 cuda c 应用程序

1. [xmake 安装](https://xmake.io/#/zh-cn/getting_started?id=%e5%ae%89%e8%a3%85)

TODO

## rust 开发指南

1. [rust 工具链安装](https://www.rust-lang.org/zh-CN/tools/install)

   > 初始状态下 `curl` 不存在，需要
   >
   > ```shell
   > sudo apt-get install curl
   > ```

TODO
