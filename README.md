# BuildCuraEngine

 Windows系统下在Docker容器中交叉编译CuraEngine

## 准备

安装[Docker](https://www.docker.com/products/docker-desktop)

## 构建镜像

运行  *`CreateImage.bat`*  
>**重新构建镜像**  
>运行  *```ReCreateImage.bat```*

## 编译生成

**把预编译的项目目录拷贝到当前目录下**  
运行  *Run.bat 项目目录*  

例如  *`Run.bat CuraEngine-4.6.0`*  

>*注意Git的换行符处理*  
>*.bat和.sh文件换行符可能被替换*  
>*.bat的换行符为CRLF*  
>*.sh的换行符为LF*

## 结果

当前目录下的Build目录
