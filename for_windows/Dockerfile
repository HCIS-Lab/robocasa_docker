###############################################################################
# RoboCasa / robosuite dev image — Ubuntu 22.04
###############################################################################
FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV MUJOCO_GL=glfw

###############################################################################
# 1. System libraries
###############################################################################
RUN apt-get update -o Acquire::Retries=3 -o Acquire::http::Timeout=30 && \
    apt-get install -y --no-install-recommends \
        build-essential git wget curl ca-certificates \
        python3 python3-pip python3-dev python-is-python3 \
        libgl1 libglx-mesa0 libgl1-mesa-dev libglu1-mesa \
        libosmesa6 libxi6 libxext6 libxrender1 \
        libglfw3 libglew-dev \
        libhidapi-hidraw0 libhidapi-libusb0 \
        libglib2.0-0 libsm6 libxkbcommon0 \
    && rm -rf /var/lib/apt/lists/*

###############################################################################
# 2. Python dependencies
###############################################################################
RUN python3 -m pip install --upgrade pip setuptools wheel && \
    python3 -m pip install \
    numpy==1.23.3 scipy==1.9.1 numba==0.56.4 \
    mujoco==3.3.0 \
    pygame Pillow opencv-python pyyaml pynput tqdm \
    termcolor imageio imageio-ffmpeg h5py lxml hidapi \
    tianshou==0.4.10 pytest mink==0.0.5 \
    "qpsolvers[quadprog]>=4.3.1" \
    matplotlib gdown chardet huggingface_hub psutil \
    tensorboard tensorboardX transformers tianshou==0.4.10 \
    diffusers==0.11.1

###############################################################################
# 3. Pytorch and torchvision with CUDA 12.6
# Important: Make sure to use the correct CUDA version for your system.
# Use command below to check your CUDA version:
#   nvidia-smi
# Check https://pytorch.org/get-started/locally/ for the latest instructions.
###############################################################################
RUN python3 -m pip install torch torchvision --index-url https://download.pytorch.org/whl/cu126

WORKDIR /workspace
CMD ["bash"]
