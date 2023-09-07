# Overview
This repo is a docker container for running [SpikeGPT](https://github.com/ridgerchu/SpikeGPT/) by [ridgerchu](https://github.com/ridgerchu) with an Nvidia GPU. It's base is the Nvida PyTorch container which runs Ubuntu.

# Prerequisites


## Install Nvidia Container Toolkit for GPU Use wtih Docker

```
sudo apt-get update
sudo apt-get install -y nvidia-container-toolkit
sudo nvidia-ctk runtime configure --runtime=docker
sudo systemctl restart docker
```

Note: Installing the Nvidia Container Toolkit does not install the appropriate Nvidia drivers on your host machine for you. Be sure you can run nvidia-smi on the host machine with no errors.

### Test the installation

```
sudo docker run --rm --runtime=nvidia --gpus all nvidia/cuda:11.6.2-base-ubuntu20.04 nvidia-smi
```

Your output should be similar to the following...


```
+-----------------------------------------------------------------------------+
| NVIDIA-SMI 450.51.06    Driver Version: 450.51.06    CUDA Version: 11.0     |
|-------------------------------+----------------------+----------------------+
| GPU  Name        Persistence-M| Bus-Id        Disp.A | Volatile Uncorr. ECC |
| Fan  Temp  Perf  Pwr:Usage/Cap|         Memory-Usage | GPU-Util  Compute M. |
|                               |                      |               MIG M. |
|===============================+======================+======================|
|   0  Tesla T4            On   | 00000000:00:1E.0 Off |                    0 |
| N/A   34C    P8     9W /  70W |      0MiB / 15109MiB |      0%      Default |
|                               |                      |                  N/A |
+-------------------------------+----------------------+----------------------+

+-----------------------------------------------------------------------------+
| Processes:                                                                  |
|  GPU   GI   CI        PID   Type   Process name                  GPU Memory |
|        ID   ID                                                   Usage      |
|=============================================================================|
|  No running processes found                                                 |
+-----------------------------------------------------------------------------+
```


# Running SpikeGPT Container

## Copy the SpikeGPT directory

Be sure to include the approporate model weights as described in the SpikeGPT project [README](https://github.com/ridgerchu/SpikeGPT) and copy the folder into the SpikeGPT-container directory

```
cd SpikeGPT-container

cp -R  https://github.com/ridgerchu/SpikeGPT.git .
```

## Build and run the container

```
docker build -t spikegpt .

./run.bash
```

Once in the container simply launch the run script

```
python run.py
```
