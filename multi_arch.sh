#!bin/bash
# AZURE MULTI-ARCH TASK
# Author        :   Daniel Carvalho
# Email         :   dacarvalho@ubiwhere.com
# Version       :   1.0
# Description   :   MS Azure Pipelines script to set
#                   QEMU for multiarch docker builds

# start message
echo "+------------------------------------+"
echo "| MS AZURE PIPELINES MULTIARCH SETUP |"
echo "|                                    |"
echo "| Author    :   Daniel Carvalho      |"
echo "| Version   :   1.0                  |"
echo "+------------------------------------+"
echo "\nMultiarch setup started...\n"

# get current working directory path
cwd=$(pwd)

# get architecture platform
while read filename; do
    platform=`sed 's/^\w\+.//' <<< $filename`
done <<<$(ls -d Dockerfile*)

# set qemu-path
case $platform in
    arm32v7)
        qemu_path=/usr/bin/qemu-arm-static
        ;;
    arm64v8)
        qemu_path=/usr/bin/qemu-aarch64-static
        ;;
esac

# download qemu into the runner
sudo apt update && sudo apt install qemu-user-static -y

# set previleges to run for multiarch
sudo docker run --rm --privileged multiarch/qemu-user-static:register --reset

# make right qemu arch files available to Dockerfile
sudo cp $qemu_path $cwd

# success message
echo "Successfully setup QEMU...\n"