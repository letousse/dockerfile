FROM ubuntu:latest
RUN apt-get update -y; 
#apt-get install build-essential -y; apt-get install qt5-default -y; apt-get install devscripts -y; apt-get install cmake -y; apt-get install sudo -y; apt-get install -y locales;
RUN apt-get install locales -y; apt-get install sudo -y; apt-get install cmake -y; apt-get install devscripts -y; apt-get install qt5-default -y; apt-get install gawk -y; apt-get install wget -y; apt-get install git-core -y; apt-get install diffstat -y; apt-get install unzip -y; apt-get install texinfo -y; apt-get install gcc-multilib -y; apt-get install build-essential -y; apt-get install chrpath -y; apt-get install socat -y; apt-get install cpio -y; apt-get install python -y; apt-get install python3 -y; apt-get install python3-pip -y; apt-get install python3-pexpect -y; apt-get install xz-utils -y; apt-get install debianutils -y; apt-get install iputils-ping -y; apt-get install python3-git -y; apt-get install python3-jinja2 -y; apt-get install libegl1-mesa -y; apt-get install libsdl1.2-dev -y; apt-get install xterm -y;

#RUN apt-get install openssh-server -y; systemctl enable ssh; systemctl start ssh;
 EXPOSE 22
VOLUME ["/data"]
COPY . /data
RUN chmod +x /data/red.sh
RUN echo "root:root" | chpasswd
WORKDIR /root
RUN git clone https://github.com/letousse/YoGui_withoutmake.git
RUN make -C YoGui_withoutmake
#RUN git clone https://github.com/tousse/Dockertest2.git
#RUN make -C Dockertest2
RUN chmod 777 YoGui_withoutmake/scripts/poky_script.sh
RUN locale-gen en_US.UTF-8
RUN export LC_ALL=en_US.UTF-8
RUN export LANG=en_US.UTF-8

USER root
ENTRYPOINT //data/red.sh && /bin/bash 
CMD ["/bin/bash", "/YoGui_withoutmake/tese"]

