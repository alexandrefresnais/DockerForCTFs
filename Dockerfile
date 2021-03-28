# docker build -t ctf:ubuntu19.10 .
# If using Windows
      # docker run --rm -v %cd%:/pwd --cap-add=SYS_PTRACE --security-opt seccomp=unconfined -d --name ctf -i ctf:ubuntu19.10
# If using Linux
      # docker run --rm -v $PWD:/pwd --cap-add=SYS_PTRACE --security-opt seccomp=unconfined -d --name ctf -i ctf:ubuntu19.10
# docker exec -it ctf /bin/bash

FROM ubuntu:latest

ENV LC_CTYPE C.UTF-8
ENV DEBIAN_FRONTEND=noninteractive

RUN dpkg --add-architecture i386 && \
apt-get upgrade && \
apt-get update && \
yes | apt-get install build-essential sudo curl wget git strace ltrace vim gdb python3 python3-pip && \
yes | apt install zsh && sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" && \
yes | pip3 install pwntools capstone && \
mkdir /home/tools && cd /home/tools && \
git clone https://github.com/JonathanSalwan/ROPgadget && \
cd /
