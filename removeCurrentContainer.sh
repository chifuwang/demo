#!/bin/bash

echo "remove current container sh"
echo "imageName: $1"
echo "imageVersion: $2"
imageName="$1"
imageVersion="$2"

echo "retrieve container id"
containerId=$(docker ps -a -q --filter name="${imageName}")
if [ "${containerId}" = "" ]; then
    echo "Existing container is not found!"
else
    echo "Existing container ${containerId} is found and will be removed!"
	echo "Stop existing container ${containerId}..."
	docker container stop ${containerId}
	echo "Remove existing container ${containerId}..."
	docker container rm ${containerId}
fi
