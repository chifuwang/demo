#!/bin/bash

echo "remove current container sh"
echo "imageName: $1"
echo "imageVersion: $2"
docker ps -a

#echo off
#set imageName=%1
#set imageVersion=%2
#
#echo retrieve existing container id
#docker ps -a -q --filter name=%imageName% > tmpFile
#set /p containerId= < tmpFile
#del tmpFile
#
#if NOT "%containerId%" == "" (
#  echo stop container %containerId%
#  docker container stop %containerId%
#  echo remove container %containerId%
#  docker container rm %containerId%
#)
#
#if "%containerId%" == "" (
#  echo container with name %imageName% not found
#)