echo off
set port=%1
set imageName=%2
set imageVersion=%3

echo retrieve container id
docker ps -a -q --filter name=%containerId% > tmpFile
set /p containerId= < tmpFile
del tmpFile

if NOT "%containerId%" == "" (
echo stop container %containerId%
docker container stop %containerId%
echo remove container %containerId%
docker container rm %containerId%
)

if "%containerId%" == "" (
echo container with name %imageName% not found
)

docker run -p %port%:8443 -v D:\dockerConfig\aisdatawebsvc:C:\config -v D:\Logs\docker\aisdatawebsvc:C:\logs -v D:\SSL:C:\ssl -e HTTP_PROXY="http://proxy.swmed.edu:3128" -e HTTPS_PROXY="http://proxy.swmed.edu:3128" -e NO_PROXY="localhost,127.0.0.1,0.0.0.0,*.swmed.org,aisdkdev1.swmed.edu" -d --name %imageName% %imageName%:%imageVersion%