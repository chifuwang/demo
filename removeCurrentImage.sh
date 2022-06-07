#!/bin/bash

echo "remove current image sh"
echo "imageName: $1"
echo "imageVersion: $2"
imageName="$1"
imageVersion="$2"

echo "retrieve image Id"
imageId=$(docker images "${imageName%}:${imageVersion%}" -q)
if [ "${imageId}" = "" ]; then
    echo "Existing image is not found!"
else
    echo "Existing image ${imageId} is found and will be removed!"
	echo "Remove existing image ${imageId}..."
	docker rmi ${imageId}
fi