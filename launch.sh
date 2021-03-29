#!/bin/bash

# If not shared directory
if [ ! -e shared ]; then
    mkdir shared
fi

# if container not running
docker ps | grep "ctf:ubuntu"
if [ ! $? -eq 0 ]; then
    docker build -t ctf:ubuntu .

    if [ ! $? -eq 0 ]; then
        exit 1
    fi

    docker run \
            --rm -v $PWD/shared:/home/shared \
            --cap-add=SYS_PTRACE \
            --security-opt seccomp=unconfined \
            -w /home \
            -d --name ctf -i ctf:ubuntu
    if [ ! $? -eq 0 ]; then
        exit 1
    fi
fi

docker exec -it ctf /bin/zsh
