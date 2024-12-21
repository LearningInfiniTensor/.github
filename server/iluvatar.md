﻿# 天数服务器使用指南

[天垓 100 加速卡](https://www.iluvatar.com/productDetails?fullCode=cpjs-yj-xlxl-tg100)

## 登录

```shell
ssh root@yaan.saas.iluvatar.com.cn -p <port>
```

每个用户有自己的端口和密码。

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

工具链位于 `/usr/local/corex`，英伟达 `nvcc` 对应 `bin/clang++`，所有必要库在 `lib` 中。环境本身不带链接路径，需要添加：

```shell
export LIBRARY_PATH=$LIBRARY_PATH:/usr/local/corex/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/corex/lib
```

然后可以如常使用：

```shell
clang++ -lcudart main.cu -o main
```

## 与英伟达/CUDA 的主要差异

| 项目            | 英伟达 GPU   | 天数智芯天垓
|:---------------:|:----------:|:-:
| 预定义宏         | `__NVCC__` | `__ILUVATAR__`
| 双精度支持       | 全面支持     | 支持有限，建议不使用
| 线程束 WARP_SIZE | 32         | 64
| 线程块最大规模    | 1024 n     | 4096

## 基于 xmake 开发 cuda c 应用程序

TODO

## rust 开发指南

TODO