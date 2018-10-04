NCCL_P2P_DISABLE=1 mpirun --allow-run-as-root -np 8 \
     -H node01:4,node02:4 \
     -bind-to none -map-by slot \
     -x NCCL_DEBUG=INFO -x LD_LIBRARY_PATH -x PATH \
     -mca pml ob1 -mca btl ^openib -mca btl_tcp_if_include eno1,ib0 \
     --mca btl_smcuda_use_cuda_ipc 0 \
     python pytorch_mnist.py