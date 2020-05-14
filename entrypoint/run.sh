#!/bin/bash

echo ==================
echo     Begin work
echo ==================

echo 
echo change dirtory
cd /work/CuraEngine*

echo 
echo building
docker/build-mingw64.sh
echo build completed

echo 
echo ==================
echo     Work done
echo ==================
exit
