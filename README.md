# yuzu-clang-build

## Build instructions

Setup Docker and add your user to docker group

git clone this repo

`git clone https://github.com/TrixieUA/yuzu-clang-build.git`

make main script file executable and run it

`chmod +x yuzu_build.sh && ./yuzu_build.sh`

Wait untill build finishes and grap your AppImage

## Notes
You'll have to rebuild yuzu with each yuzu update

This yuzu build won't run on cpu's without x86_64v3 support

This yuzu build won't work on systems older than Fedora 37 or Ubuntu 22.10