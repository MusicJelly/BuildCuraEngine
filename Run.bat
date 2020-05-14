@echo off
chcp 65001

if "%1%" EQU "" (
	echo 构建源码目录为空，请指定源码目录 
	echo;
	echo 请用命令行启动并指定参数 
	echo 例： 
	echo       Run.bat CuraEngine-4.6.0
	echo;
	pause
	goto :eof
) else (
	echo 构建源码目录为       %1%
	set srcDir=%1%
)


set /p=创建映像...          < nul
docker build . -q -t curaengine:MingW

set /p=删除存在的容器...    < nul
docker rm -fv curaEngineMingW

set /p=创建容器...          < nul
docker create -v work_cura:/work --name curaEngineMingW curaengine:MingW

set /p=清空工作目录...      < nul
docker run --rm -v work_cura:/work curaengine:MingW ./clearWorksplace.sh

set /p=拷贝源码目录...      < nul
docker cp %srcDir% curaEngineMingW:/work
echo 已复制

set /p=启动容器...          < nul
docker start curaEngineMingW
set /p=正在编译...          < nul

for /F %%i in ('docker wait curaEngineMingW') do (set result=%%i)

rem 编译完成 显示结果并取回文件
if %result% EQU 0 (
	echo 编译完成
	if exist build (rmdir /S /Q build)
	mkdir build

	set /p=提取结果...          < nul
 	docker cp curaEngineMingW:/work/%srcDir%/build/ ./
	echo 结果已保存到 build 目录
) else (
	echo 编译失败
)
