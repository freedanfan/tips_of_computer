#!/bin/bash


function install_dependency {
    echo "--- Installing dependency: $1"
    sudo apt-get -y install $1
}


install_dependency build-essential
install_dependency cmake
install_dependency pkg-config
install_dependency libtiff-dev
install_dependency libjpeg-dev
install_dependency libpng-dev
install_dependency libjasper-dev
install_dependency libavcodec-dev
install_dependency libavformat-dev
install_dependency libswscale-dev
install_dependency libdc1394-22-dev
install_dependency libxine2-dev
install_dependency libgstreamer0.10-dev
install_dependency libgstreamer-plugins-base0.10-dev
install_dependency libv4l-dev
install_dependency python-dev
install_dependency python-numpy
install_dependency libtbb2
install_dependency libtbb-dev
install_dependency libqt5x11extras5
install_dependency libqt5opengl5
install_dependency libqt5opengl5-dev
install_dependency libgtk-3-dev
install_dependency libfaac-dev
install_dependency libmp3lame-dev
install_dependency libopencore-amrnb-dev
install_dependency libopencore-amrwb-dev
install_dependency libtheora-dev
install_dependency libvorbis-dev
install_dependency libxvidcore-dev
install_dependency x264
install_dependency libx264-dev
install_dependency libatlas-base-dev
install_dependency gfortran
install_dependency v4l-utils
install_dependency python3.5-dev
install_dependency unzip
