# 沐曦服务器使用指南

## 目录

## 注意事项

- **NOTICE** 下列所有命令中用 **`** 包围的内容需替换为实际值。

## 登录

```shell
ssh `user`@140.207.205.81 -p 60005
```

每个用户有自己的用户名和密码，通过另外的渠道发放。

## 配置环境变量

```shell
export MACA_PATH=/opt/maca
export PATH=$PATH:${MACA_PATH}/bin:${MACA_PATH}/mxgpu_llvm/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${MACA_PATH}/lib:${MACA_PATH}/mxgpu_llvm/lib
```

mxcc -x maca /opt/maca/samples/0_Introduction/vectorAdd/vectorAdd.cpp -o vectorAdd

## slurm 协作

所有涉及沐曦运行时的命令需要使用 [slurm](https://slurm.schedmd.com) 占用卡，在命令前添加 `srun --gpus=?`：

```shell
srun --gpus=`n` `cmd`
```

其中

- `n` 为要占用的卡数，一般就是 1；
- `cmd` 为原本要执行的命令；

## 硬件状态监测

```shell
srun mx-smi
```

功能对应英伟达 `nvidia-smi`，使用

```shell
mx-smi -h
```

查看帮助信息，使用

```shell
srun mx-smi -l 1
```

持续监测。

## CUDA 编译

工具链位于 `/opt/maca/mxgpu_llvm`，英伟达 `nvcc` 对应 `bin/mxcc`，所有必要库在 `lib` 中。

```shell
mxcc -x maca `src.cpp` -o `program`
```

作为测试，可以尝试编译环境自带的 cuda 示例：

```shell
mxcc -x maca /opt/maca/samples/0_Introduction/vectorAdd/vectorAdd.cpp -o vectorAdd
srun --gpus=1 ./vectorAdd
```

将输出：

```plaintext
[Vector addition of 50000 elements]
Copy input data from the host memory to the MACA device
MACA kernel launch with 196 blocks of 256 threads
Copy output data from the MACA device to the host memory
Test PASSED
MACA Sample Done
```
