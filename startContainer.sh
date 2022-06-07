#!/bin/bash

echo "star container sh"
echo "port: $1"
echo "imageName: $2"
echo "imageVersion: $3"
port=$1
imageName="$2"
imageVersion="$3"
echo "retrieve container id"
containerId=$(docker ps -a -q --filter name="${imageName}")
if [ "$containerId" = "" ]; then
    echo "Existing container is not found!"
else
    echo "Existing container ${containerId} is found and will be removed!"
	echo "Stop existing container ${containerId}..."
	docker container stop ${containerId}
	echo "Remove existing container ${containerId}..."
	docker container rm $containerId
fi

docker run -p ${port}:8080 -d --name ${imageName} ${imageName}:${imageVersion}
