# clean old sources
rm -rf yuzu-mainline
# git clone new sources
git clone https://github.com/yuzu-emu/yuzu-mainline.git
cd yuzu-mainline
git submodule update --init --recursive
cd ..
# remove configs
rm yuzu-mainline/.ci/scripts/linux/exec.sh
rm yuzu-mainline/.ci/scripts/linux/docker.sh
# add configs for proper clang appimage build
cp exec.sh yuzu-mainline/.ci/scripts/linux/exec.sh
cp docker.sh yuzu-mainline/.ci/scripts/linux/docker.sh
# run build 
cd yuzu-mainline
./.ci/scripts/linux/exec.sh
# run appimage build
./.ci/scripts/linux/upload.sh
# copy appimage to root folder
cd ..
cp yuzu-mainline/build/yuzu-* yuzu.Appimage

