#!/bin/sh

#IMG="crops/poky"
IMG="crops/poky:centos-7"
WDIR="workdir"

hash docker
if [ $? -ne 0 ]; then
  echo "Please, install Docker"
  exit 1;
fi;

if [ $# -lt 1 ]; then
  echo "usage: $0 <dir> [dockerfilename]";
  exit 1;
fi;

if [ ! -d "${1}" ]; then
  echo "Creating ${1}..."
  install -d ${1}
  if [ $? -ne 0 ]; then  exit 1;  fi;
fi;

p="${1}"
hash readlink
if [ $? -eq 0 ]; then
  p=`readlink -e ${1}`
  if [ $? -ne 0 ]; then
    echo "Problem getting absolute path for ${1}"
    exit 1;
  fi;
fi;

echo "Path for ${1} is ${p}"

DL_DIR=${HOME}/archives/oe_sources/

if [ ! -f "${p}/clone.sh" ]; then
  curl -o ${p}/clone.sh https://raw.githubusercontent.com/tibbotech/repo-manifests/master/clone.sh
  chmod 0755 ${p}/clone.sh
fi;

DNAME=$(basename ${1})

# create the image if ARG2 is <dockerfilename>
if [ -f "${2}" ]; then
  docker build -f "${2}" -t ${DNAME} ${p}
  IMG="${DNAME}"
fi;

DOPTS=""
#DOPTS="${DOPTS} --cpus=6"
DOPTS="${DOPTS} --memory=10g"

docker run --rm -it --name "${DNAME}" \
 -v ${p}:/${WDIR} \
 -v ${DL_DIR}:/${WDIR}/downloads \
 --env DL_DIR=/${WDIR}/downloads \
 ${DOPTS} ${IMG} \
 --workdir=/${WDIR}