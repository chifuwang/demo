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

docker run -p %port%:8080 -d --name %imageName% %imageName%:%imageVersion%