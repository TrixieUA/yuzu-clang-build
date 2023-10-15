# yuzu-clang-build

## To use this script you need Docker installed on your systtem
Aslo you need to add your user to docker group with `sudo usermod -aG docker username`

## To build yuzu with clang you need to run yuzu_build.sh in empty folder
It will build yuzu inside of the Docker container and drop clang build AppImage into the script folder

This yuzu build won't run on cpu's without x86_64v3 support
