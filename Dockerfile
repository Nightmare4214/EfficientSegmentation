FROM nvidia/cuda:11.6.0-base-ubuntu20.04
COPY . /
RUN sed -i 's/security.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
RUN sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
RUN apt-get update
RUN apt-get install python3 python3-pip -y
RUN pip3 install --upgrade pip
RUN pip3 config set global.index-url https://mirrors.bfsu.edu.cn/pypi/web/simple
RUN pip3 install torch==1.13.1+cu116 torchvision==0.14.1+cu116 torchaudio==0.13.1 --extra-index-url https://download.pytorch.org/whl/cu116
RUN pip3 install -r requirements.txt
CMD ["sh", "predict.sh"]