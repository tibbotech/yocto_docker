# yocto_docker

Docker scripts for Yocto Tibbo layers
```
git clone git@github.com:tibbotech/yocto_docker.git
cd yocto_docker
./docker_create.sh test_docker3 docker.centos-7
```
In the opened Docker console:
```
. ./layers/openembedded-core/oe-init-build-env ./build.tppg2/
MACHINE=tppg2 bitbake mc:tppg2:img-tps-free
```
