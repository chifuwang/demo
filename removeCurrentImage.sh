#!/bin/bash

#echo off
#set imageName=%1
#set imageVersion=%2
#
#docker images "%imageName%:%imageVersion%" -q > tmpFile
#set /p imageId= < tmpFile
#del tmpFile
#
#if NOT "%imageId%" == "" (
#  echo remove existing image
#  docker rmi %imageId%
#)
#
#if "%imageId%" == "" (
#  echo image %imageName%:%imageVersion% not found
#)

echo "remove current image sh"