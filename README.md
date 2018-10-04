# Install Softwares to support distributed training on AI cluster
本教程基于horovod分布式训练框架，支持keras, tensorflow和pytorch

以下相关版本已经过测试：
- keras: 2.2.2
- tensorflow: 1.10.0
- pytorch: 0.4.0

## 硬件环境
本教程针对ShanghaiTech AI集群
- Container开启时需使用`-network=host`
- 确保每个节点的hostname是不相同的，hostname请勿使用 `.`

## 软件环境安装
以下软件均在计算节点安装

### NCCL
1. 下载 [NCCL 2](https://developer.nvidia.com/nccl).
2. 安装步骤 [here](http://docs.nvidia.com/deeplearning/sdk/nccl-install-guide/index.html).

3. If you have installed NCCL 2 using the `nccl-<version>.txz` package, you should add the library path to `LD_LIBRARY_PATH`
environment variable or register it in `/etc/ld.so.conf`.
```bash
$ export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/nccl-<version>/lib
```

### OpenMPI
1. 下载最新版安装包 [Open MPI](https://www.open-mpi.org/) 
2. 安装步骤 [here](https://www.open-mpi.org/faq/?category=building#easy-build).
3. `ldconfig`

### Deep learning framework
- 安装keras,tensorflow,pytorch
```shell
pip install keras==2.2.2 tensorflow-gpu==1.10.0 torch==0.4.0 torchvision
HOROVOD_NCCL_HOME=/usr/local/nccl-<version> HOROVOD_GPU_ALLREDUCE=NCCL pip install --no-cache-dir horovod
```

### Example
参见examples中的README.md