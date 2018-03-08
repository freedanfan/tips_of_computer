#!/bin/bash
# freedanfan
# 2018-03-06
# Call this script after configuring variables:
# version - the version of OpenCV to be installed
# downloadfile - the name of the OpenCV download file
# dldir - the download directory (optional, if not specified creates an OpenCV directory in the working dir)

set -e  #当命令以非零状态退出时，则退出shell

version=3.4.0
downloadfile=opencv-3.4.0.zip
download_contrib=opencv_contrib-3.4.0.zip
dldir=OpenCV


echo "***************安装须知********************"
echo "在以下网站下载opencv源码"
echo "opencv official: https://github.com/opencv/opencv_contrib"
echo "opencv_contrib: https://github.com/opencv/opencv_contrib"
echo "例如： opencv-3.4.0 download: https://downloads.sourceforge.net/opencvlibrary/opencv-3.4.0.zip"
echo "       opencv_contrib-3.4.0 download: https://github.com/opencv/opencv_contrib/archive/3.4.0/opencv_contrib-3.4.0.tar.gz"


echo "<----------Information---------------->"
echo "version=$version"
echo "downloadfile=$downloadfile"
echo "download_contrib=$download_contrib"
echo "dldir=$dldir"
echo "***********************************"
echo "Installing OpenCV" $version

if ! sudo true; then
    echo "You must have root privileges to run this script."
    exit 1
fi

echo "<----------Installing Dependencies---------------->"
sudo apt-get update && sudo apt-get dist-upgrade && sudo apt-get autoremove
source dependencies.sh #source *.sh 在当前环境下执行, 所有的变量即使脚本运行结束也会被保留下来(无需显示的声明).

echo "<----------Installing numpy---------------->"
pip install  numpy

echo "<----------Setup your environment---------------->"
sudo apt-get install -y python-pip && pip install --upgrade pip


echo "<----------begin to install opencv---------------->"
#unzip $downloadfile
#unzip $download_contrib
cd opencv-$version
mkdir build
cd build
cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D INSTALL_PYTHON_EXAMPLES=ON   -D INSTALL_C_EXAMPLES=OFF   -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib-$version/modules -D PYTHON_EXECUTABLE=~/.virtualenvs/cv/bin/python  -D BUILD_EXAMPLES=ON ..
echo "<----------making---------------->"
make -j10
sudo make install
sudo ldconfig
echo "OpenCV" $version "ready to be used"

echo "<----------link cv.so---------------->"
cd /usr/local/lib/python3.5/site-packages/

sudo mv cv2.cpy*-gnu.so cv2.so
cd ~/.virtualenvs/cv/lib/python3.5/site-packages/
ln -s /usr/local/lib/python3.5/site-packages/cv2.so cv2.so

