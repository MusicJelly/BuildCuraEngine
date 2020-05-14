From debian
WORKDIR "/etc/apt/"
RUN cp sources.list sources.list.bak
RUN sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' sources.list
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y curl wget unzip git cmake gcc-mingw-w64-x86-64 g++-mingw-w64-x86-64
RUN update-alternatives --set x86_64-w64-mingw32-gcc /usr/bin/x86_64-w64-mingw32-gcc-posix
RUN update-alternatives --set x86_64-w64-mingw32-g++ /usr/bin/x86_64-w64-mingw32-g++-posix
RUN curl -1sLf 'https://dl.cloudsmith.io/public/ultimaker/cura-public/cfg/setup/bash.deb.sh' | bash
RUN apt-get install -y cura-libprotobuf-dev cura-libprotobuf-mingw-w64-dev cura-libarcus-mingw-w64-dev

VOLUME ["/work"]

WORKDIR "/entrypoint/"
COPY entrypoint/ /entrypoint/

CMD ./run.sh
