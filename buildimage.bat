echo off
set imageName=%1
set imageVersion=%2

call mvn clean package

echo retrieve existing container id
docker ps -a -q --filter name=%imageName% > tmpFile
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

docker images "%imageName%:%imageVersion%" -q > tmpFile
set /p imageId= < tmpFile
del tmpFile

if NOT "%imageId%" == "" (
echo remove existing image 
docker rmi %imageId%
)

if "%imageId%" == "" (
echo image %imageName%:%imageVersion% not found
)

docker build -t %imageName%:%imageVersion% .

docker system prune -f