FROM ubuntu:20.04

ENV TZ=Europe/Moscow
ENV opencvVersion=4.5.3-openvino-2021.4.2
ENV DEBIAN_FRONTEND=noninteractive 
RUN apt update && apt install -y \
build-essential \
cmake \
gcc \
g++ \
make \
wget \
unzip \
pkg-config \
python3-dev \
python3-pip \
python3-numpy \
libtbb2 \
libtbb-dev \
libjpeg-dev \
libpng-dev \
libtiff-dev \
libgtk2.0-dev \
libavcodec-dev \
libavformat-dev \
libswscale-dev \
libdc1394-22-dev \
libeigen3-dev \
libtheora-dev \
libvorbis-dev \
libxvidcore-dev \
libx264-dev \
sphinx-common \
yasm \
libfaac-dev \
libopencore-amrnb-dev \
libopencore-amrwb-dev \
libopenexr-dev \
libgstreamer-plugins-base1.0-dev \
libavutil-dev \
libavfilter-dev \
libavresample-dev && \
apt-get clean autoclean && \
apt-get autoremove --yes && \
rm -rf /var/lib/{apt,dpkg,cache,log}
WORKDIR /opt
RUN wget -O opencv.zip https://github.com/opencv/opencv/archive/${opencvVersion}.zip && \
unzip opencv.zip && \
rm opencv.zip && \
mv opencv-${opencvVersion} opencv && \
mkdir /opt/opencv/build && \
cd /opt/opencv/build && \
cmake \
-D OPENCV_ENABLE_NONFREE=ON \
-D CMAKE_INSTALL_PREFIX=/usr/local \
-D BUILD_EXAMPLES=OFF \
-D OPENCV_GENERATE_PKGCONFIG=ON \
-D ENABLE_PRECOMPILED_HEADERS=OFF \
-D BUILD_TESTS=OFF \
-D BUILD_PERF_TESTS=OFF \
.. && \
make -j2 && \
make -j2 install && \
cd && \
rm -rf /opt/opencv
