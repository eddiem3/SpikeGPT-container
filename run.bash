docker run -it \
       --gpus all --ipc=host --ulimit memlock=-1 --ulimit stack=67108864 \
       --mount type=bind,source="$(pwd)"/SpikeGPT,target=/workspace/development/SpikeGPT \
       spikegpt 
       


