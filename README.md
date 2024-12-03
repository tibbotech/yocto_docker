# yocto_docker

Docker scripts for Yocto Tibbo layers
```
git clone git@github.com:tibbotech/yocto_docker.git
cd yocto_docker
./docker_create.sh test_docker3 docker.latest
```
In the opened Docker console:
```
git config --global user.email "you@example.com"
git config --global user.name "Your Name"
./clone.sh
. ./layers/openembedded-core/oe-init-build-env ./build.tppg2/
MACHINE=tppg2 bitbake mc:tppg2:img-tps-free
```
clone.sh optionally accepts M=.. varibale to use certain manifest. Example:
```
M=sunplus ./clone.sh
```
