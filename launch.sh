#!/bin/bash

docker build -t ctf:ubuntu .

if [ ! $? -eq 0 ]; then
    exit 1
fi

docker run --rm -v $PWD:/pwd --cap-add=SYS_PTRACE --security-opt seccomp=unconfined -d --name ctf -i ctf:ubuntu

if [ ! $? -eq 0 ]; then
    exit 1
fi

docker exec -it ctf /bin/bash
