FROM fedora:37

ENV BOOST_VER=1_79_0

# Create a user account yuzu (UID 1027) that the container will run as
RUN useradd -m -u 1027 -s /bin/bash yuzu && \
# Install build dependencies
#    sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y && \
    sudo dnf install -y \
    autoconf \
    ccache \
    cmake \
    fmt-devel \
    gcc \
    gcc-c++ \
    glslang \
    hidapi-devel \
    json-devel \
    libtool \
    libusb1-devel \
    libzstd-devel \
    lz4-devel \
    nasm \
    ninja-build \
    openssl-devel \
    pulseaudio-libs-devel \
    qt5-linguist \
    qt5-qtbase-devel \
    qt5-qtbase-private-devel \
    qt5-qtwebengine-devel \
    qt5-qtmultimedia-devel \
    qt5-qtwayland-devel \
    speexdsp-devel \
    wayland-devel \
    zlib-devel \
#    ffmpeg-devel \
    libXext-devel \
    hidapi-devel \
    git \
    cmake \
    wget \
# Clang
    clang \
    llvm \
    lld \
# glslang
    glslang \
    glslang-devel \
# AppImage support
    appstream \
    desktop-file-utils \
    file \
    perl-File-MimeInfo \
    patchelf \
# FFmpeg build requirements
    libdrm-devel \
    libva-devel \
    libX11-devel \
    libXext-devel \
    nasm \
# libusb build requirements
    autoconf \
    automake \
    libtool \
    systemd-devel \
# vcpkg requirements
    curl \
    zip 
# Install Boost from yuzu-emu/ext-linux-bin
RUN cd /tmp && \
    wget --no-verbose https://github.com/yuzu-emu/ext-linux-bin/raw/main/boost/boost-${BOOST_VER}.tar.xz && \
    tar xvf boost-${BOOST_VER}.tar.xz && \
    chown -R root:root boost-${BOOST_VER}/ && \
    cp -rv boost-${BOOST_VER}/usr / && \
    rm -rf boost*

# Tell CMake to use vcpkg when looking for packages
ENV VCPKG_TOOLCHAIN_FILE=/home/yuzu/vcpkg/scripts/buildsystems/vcpkg.cmake

USER 1027
# Install vcpkg and required dependencies for yuzu
RUN cd /home/yuzu &&\
    git clone --depth 1 https://github.com/Microsoft/vcpkg.git &&\
    cd vcpkg &&\
    ./bootstrap-vcpkg.sh &&\
    ./vcpkg install \
        catch2 \
        fmt \
        lz4 \
        nlohmann-json \
        zlib \
        zstd
