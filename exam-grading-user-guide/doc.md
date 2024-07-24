# Exam Grading 自动测试评分系统使用教程

按此教程操作，完成构建自己的评测系统用于后续阶段的测验提交，并熟悉评测系统的使用。下列步骤完成了 3 项工作：

1. 准备 Git 环境
2. 获取 exam-grading 源码
3. 测验评分

## 步骤

### 1. 准备 Git 环境

Git 的安装可参考：[1.5 起步 - 安装 Git](https://git-scm.com/book/zh/v2/%E8%B5%B7%E6%AD%A5-%E5%AE%89%E8%A3%85-Git) 或 [InfiniTensor 训练营导学阶段指导书](https://17999824wyj.github.io/InfiniTensor-camp-book-stage0/ch1-01.html)

### 2. 获取exam-grading源码

学员需要通过 [exam-grading模板](https://github.com/LearningInfiniTensor/exam-grading) 创建自己的评分系统仓库：

![create-repo](template-create-repo.png)

> **NOTICE** 推荐创建为private仓库

之后将创建的exam-grading仓库拉取到本地

```bash
git clone <repo-addr> ./exam-grading
cd exam-grading
```

### 3. 测验评分

该部分将通过给评分系统添加exams目录以演示测验评分系统的使用方法。

首先需要在Github上创建一个测试仓库（只需包含一个README即可），权限设置为 `public`，否则之后测试拉取会因为没有权限而报错找不到仓库。创建好测试仓库之后可通过两种方式添加将该测试仓库添加至评分系统：[直接目录](#31-直接目录)和[子模块](#32-子模块)

> **NOTICE** 推荐使用子模块方式添加测试目录

#### 3.1 直接目录

通过直接目录的方式添加测试目录，需要学员将将目标测试目录克隆到 exam-grading 目录外（也就是 exam-grading 的同级目录）：

```bash
git clone <target-test-repo> ./exams
cd exams
# 确保为最新
git pull
# 然后将目录复制进exam-grading
```

#### 3.2 子模块

子模块方式则只需将对应测试目录以子模块的方式加入评分系统即可：

```bash
git submodule add <target-test-repo> ./exams
# 确保为最新
git submodule update --remote
```

添加测试目录后，学员即可提交更改到远程仓库，评测系统将会自动运行，运行结果可以在仓库actions界面查看：

![grading](grading-res.png)

> **NOTICE** 此处提交的内容为新增的 `exams` 目录，若使用子模块方式还会有一个 `.gitsubmodule` 文件

目标运行结果：

![expect](expect-res.png)

## 基础阶段的使用

同样按照[以上步骤](#步骤)的前两步准备环境，之后在exam-grading项目根目录中添加测试目录：

**直接目录：**

```bash
# 将learning-cxx克隆到exam-grading目录外（也就是exam-grading的同级目录）
git clone <target-test-repo> ./learning-cxx
cd learning-cxx
# 确保为最新
git pull
# 然后将目录复制进exam-grading

# 将rustlings克隆到exam-grading目录外（也就是exam-grading的同级目录）
git clone <target-test-repo> ./rustlings
cd rustlings
# 确保为最新
git pull
# 然后将目录复制进exam-grading
```

> **NOTICE** 目标测试目录中存在 .git 目录可能会导致问题，删除后再试

**子模块：**

```bash
# learning-cxx
git submodule add <target-test-repo> ./learning-cxx

# rustlings
git submodule add <target-test-repo> ./rustlings

# 确保为最新
git submodule update --remote
```

## 其它

### 可参考资料

Git子模块的使用可参考 [7.11 Git 工具 - 子模块](https://git-scm.com/book/zh/v2/Git-%E5%B7%A5%E5%85%B7-%E5%AD%90%E6%A8%A1%E5%9D%97)

运行过程中产生的问题请查阅[Q&A](../qa/doc.md)，或在微信群聊中咨询助教老师

### 移除子模块

```bash
# 删除子模块
git submodule deinit <target-submodule-name>
# 删除目录
git rm -r <target-submodule-name>
# 删除子模块相关文件（注：在exam-grading目录下）
rm -rf .git/modules/<target-submodule-name>

# 例子
git submodule deinit ./exams
git rm -r./exams
rm -rf .git/modules/exams
```

> **NOTICE** 必要时需加上 `--force` 或 `-f` 强制删除

### 获取 `exam-grading` 模板仓库的更新

由于人手一个评分系统，所以要同步原模板仓库的更新到自己这里步骤会稍显麻烦，当然最简单的方式就是重新根据最新的 `exam-grading` 建一个。不过接下来还是会提供 git 的操作方法：

1. 首先需要在自己的 `exam-grading` 本地建立远端主机连接

    ```bash
    # 使用 SSH keys 连接
    git remote add template <target-template-ssh>

    # 使用 access token 连接
    git remote set-url origin <target-tempalte-url-with-access-token>
    ```

2. 将 `template` 上的 `main` 分支合并到本地端的 `main` 分支

    ```bash
    # 获取远端修改
    git fetch template

    # 切换本地 exam-grading 到 main 分支
    git checkout main

    # 将 template 的 main 分支合并到本地 main 分支
    git merge template/main --allow-unrelated-histories
    ```

    > **NOTICE** `--allow-unrelated-histories` 参数因为 git 从 `2.9.0` 开始不允许合并没有共同祖先的分支，不带此参数会报错：`fatal: refusing to merge unrelated histories`

3. 解决合并产生的冲突，基本无脑选 incoming 即可

    ```bash
    <<<<<<< HEAD
    ...
    ... # 本地 repo 的内容，不保留
    ...
    =======
    ...
    ... # template 合并的新内容，保留
    ...
    >>>>>>> template/master
    ```

> **NOTICE** 冲突解决不自信可以咨询一下助教老师，或图省事选择重新创建克隆

## 习题Q&A

1. `learning-cxx` 第20题

    > ![20](learning-cxx-20.png)
    > 83行处修改更新
    >
    > ```C++
    > for (auto i = 0u; i < sizeof(d0) / sizeof(*d0); ++ i)
    > ```

2. `learning-cxx` 第15题

    > 补充参考资料：[不完整类型](https://learn.microsoft.com/zh-cn/cpp/c-language/incomplete-types?view=msvc-170)

3. 本地测试通过，但云端却没过，不知道为什么？

    > ![output](see-fail-output.png)
    >
    > 这种情况请查看 actions 具体运行步骤中的输出查看报错

4. 关于张量

    > 请查看基础阶段第一次课程录播，[Rust](https://opencamp.cn/InfiniTensor/camp/2024summer/stage/2?tab=video) 和 [C++](https://opencamp.cn/InfiniTensor/camp/2024summer/stage/1?tab=video) 均有讲解

5. 在 Linux 上 `xmake` 构建 `learning-cxx` 项目报错：`undefined reference to 'pthread_create'`

    > ![pthread-create-err](pthread-create-err.png)
    >
    > 遇到以上问题一般是因为 `libc` 版本过旧，更新即可
    > 参考链接：https://developers.redhat.com/articles/2021/12/17/why-glibc-234-removed-libpthread

6. 关于强转右值

    > 所谓强转为右值，只是为了重载决议的时候能调用到移动的构造或者赋值，但是调用到之后干了啥事是全看实现的

7. 关于 `learning-cxx` 第 23 题和第 24 题

    > 这题和上一题反复强调 `sizeof(vec)` 有 2 个目的：第一个是让学员意识到容器虽然把可变长的存储区域移动到了堆上，但它们的栈上占用并不小。单纯移动一个七八个容器组成的结构体就是不可忽略的开销了；第二是意识到 `vec<bool>` 和 `vec<T>` 如此不同

8. ...
