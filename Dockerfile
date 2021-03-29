FROM ubuntu:latest

ENV LC_CTYPE C.UTF-8
ENV DEBIAN_FRONTEND=noninteractive

RUN dpkg --add-architecture i386 && \
apt-get update && \
yes | apt-get install build-essential netcat libc6:i386 sudo curl wget git strace ltrace vim gdb python3 python3-pip && \
yes | apt install zsh && sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" && \
yes | pip3 install pwntools ropgadget && \
mkdir /home/tools && cd /home/tools && \
cd /
