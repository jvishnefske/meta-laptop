#!/bin/sh
W=$(pwd)
U=$(id -u):$(id -g)
echo user: ${U}
#IMAGE=docker.io/crops/poky
IMAGE=ghcr.io/seimens/kas:latest-release
#docker run -u ${U}  --rm -it -v $W:$W docker.io/crops/poky --workdir=${W}
podman run  --volume yocto-workdir:/workdir --mount type=bind,source=${W},destination=${W},mode=777  -it --workdir ${W} ${IMAGE} $@
