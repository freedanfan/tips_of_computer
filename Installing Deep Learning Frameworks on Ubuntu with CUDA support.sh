#!/bin/bash
echo 'We will install CUDA-9.0, cuDNN-9.0-v7, Python 2, Python 3, TensorFlow, Theano, Keras, Pytorch, OpenCV, Dlib along with other Python Machine Learning libraries step-by-step.'
echo ''
echo ''

echo '''
Processor : Intel core i7-5820k with 6 cores and 40 PCIe lines
Motherboard : 华硕 X99A – SLI
RAM : 32 GB
Graphics Card : Zotac GeForce GTX 1070 Ti with 8 GB RAM
OS: Ubuntu 16.04 
'''

echo "主要参考：https://www.learnopencv.com/installing-deep-learning-frameworks-on-ubuntu-with-cuda-support/"


echo '请将一下文件放在同目录中：'
echo 'cuda-repo-ubuntu1604-9-0-local_9.0.176-1_amd64.deb '
echo 'cuda-repo-ubuntu1604-9-0-local-cublas-performance-update_1.0-1_amd64.deb'
echo 'cudnn-9.0-linux-x64-v7.tgz'
echo 'torch-0.3.1-cp35-cp35m-linux_x86_64 .whl'
echo 'opencv-3.4.0.zip'
echo 'opencv_contrib-3.4.0.zip'
echo 'pycharm-community-2017.3.4.tar.gz'

'''
下载链接：
torch： http://download.pytorch.org/whl/cu90/torch-0.3.1-cp35-cp35m-linux_x86_64.whl
cuda-9.0 ： https://developer.nvidia.com/compute/cuda/9.0/Prod/local_installers/cuda-repo-ubuntu1604-9-0-local_9.0.176-1_amd64-deb
cuda-patch_1 ： https://developer.nvidia.com/compute/cuda/9.0/Prod/patches/1/cuda-repo-ubuntu1604-9-0-local-cublas-performance-update_1.0-1_amd64-deb
cudnn-9.0-v7 ： https://developer.nvidia.com/compute/machine-learning/cudnn/secure/v7.1.1/prod/9.0_20180214/cudnn-9.0-linux-x64-v7.1
opencv-3.4.0 ： https://github.com/opencv/opencv/archive/3.4.0.zip
opencv_contrib-3.4.0 ： https://github.com/opencv/opencv_contrib/archive/3.4.0/opencv_contrib-3.4.0.tar.gz
pycharm-community-2017.3.4: https://download-cf.jetbrains.com/python/pycharm-community-2017.3.4.tar.gz
'''

'''
为了安装速度快些，到opencv-3.4.0文件夹中新建 ".cache" 文件夹，把第三方软件提前的放进去，结构和名称参考：http://download.csdn.net/download/u010342901/10173967

下载链接如：
       	https://github.com/opencv/opencv/archive/3.4.0.tar.gz
	https://github.com/opencv/opencv_contrib/archive/3.4.0.tar.gz
	https://github.com/tiny-dnn/tiny-dnn/archive/v1.0.0a3.tar.gz
	https://raw.githubusercontent.com/opencv/opencv_3rdparty/b2bfc75f6aea5b1f834ff0f0b865a7c18ff1459f/res10_300x300_ssd_iter_140000.caffemodel
	https://raw.githubusercontent.com/opencv/opencv_3rdparty/8afa57abc8229d611c4937165d20e2a2d9fc5a12/face_landmark_model.dat
	https://raw.githubusercontent.com/opencv/opencv_3rdparty/34e4206aef44d50e6bbcd0ab06354b52e7466d26/boostdesc_bgm.i
	https://raw.githubusercontent.com/opencv/opencv_3rdparty/34e4206aef44d50e6bbcd0ab06354b52e7466d26/boostdesc_bgm_bi.i
	https://raw.githubusercontent.com/opencv/opencv_3rdparty/34e4206aef44d50e6bbcd0ab06354b52e7466d26/boostdesc_bgm_hd.i
	https://raw.githubusercontent.com/opencv/opencv_3rdparty/34e4206aef44d50e6bbcd0ab06354b52e7466d26/boostdesc_binboost_064.i
	https://raw.githubusercontent.com/opencv/opencv_3rdparty/34e4206aef44d50e6bbcd0ab06354b52e7466d26/boostdesc_binboost_128.i
	https://raw.githubusercontent.com/opencv/opencv_3rdparty/34e4206aef44d50e6bbcd0ab06354b52e7466d26/boostdesc_binboost_256.i
	https://raw.githubusercontent.com/opencv/opencv_3rdparty/34e4206aef44d50e6bbcd0ab06354b52e7466d26/boostdesc_lbgm.i
	https://raw.githubusercontent.com/opencv/opencv_3rdparty/fccf7cd6a4b12079f73bbfb21745f9babcd4eb1d/vgg_generated_48.i
	https://raw.githubusercontent.com/opencv/opencv_3rdparty/fccf7cd6a4b12079f73bbfb21745f9babcd4eb1d/vgg_generated_64.i
	https://raw.githubusercontent.com/opencv/opencv_3rdparty/fccf7cd6a4b12079f73bbfb21745f9babcd4eb1d/vgg_generated_80.i
	https://raw.githubusercontent.com/opencv/opencv_3rdparty/fccf7cd6a4b12079f73bbfb21745f9babcd4eb1d/vgg_generated_120.i
	https://github.com/opencv/opencv_3rdparty/raw/dfe3162c237af211e98b8960018b564bc209261d/ippicv/ippicv_2017u3_lnx_intel64_general_20170822.tgz

文件结构和名称如：
opencv3.3.1 CMake需下载的.cache文件夹
.cache
│  .gitignore
│
├─data
│      7505c44ca4eb54b4ab1e4777cb96ac05-face_landmark_model.dat
│
├─dnn_face_detector
│      afbb6037fd180e8d2acb3b58ca737b9e-res10_300x300_ssd_iter_140000.caffemodel
│
├─ippicv
│      4e0352ce96473837b1d671ce87f17359-ippicv_2017u3_lnx_intel64_general_20170822.tgz
│
├─tiny_dnn
│      adb1c512e09ca2c7a6faef36f9c53e59-v1.0.0a3.tar.gz
│
└─xfeatures2d
    ├─boostdesc
    │      0ae0675534aa318d9668f2a179c2a052-boostdesc_lbgm.i
    │      0ea90e7a8f3f7876d450e4149c97c74f-bo

                            ostdesc_bgm.i
    │      202e1b3e9fec871b04da31f7f016679f-boostdesc_binboost_064.i
    │      232c966b13651bd0e46a1497b0852191-boostdesc_bgm_bi.i
    │      324426a24fa56ad9c5b8e3e0b3e5303e-boostdesc_bgm_hd.i
    │      98ea99d399965c03d555cef3ea502a0b-boostdesc_binboost_128.i
    │      e6dcfa9f647779eb1ce446a8d759b6ea-boostdesc_binboost_256.i
    │
    └─vgg
            151805e03568c9f490a5e3a872777b75-vgg_generated_120.i
            7126a5d9a8884ebca5aea5d63d677225-vgg_generated_64.i
            7cd47228edec52b6d82f46511af325c5-vgg_generated_80.i
            e8d0dcd54d1bcfdc29203d011a797179-vgg_generated_48.i9a8884ebca5aea5d63d677225-vgg_generated_64.i
            7cd47228edec52b6d82f46511af325c5-vgg_generated_80.i
            e8d0dcd54d1bcfdc29203d011a797179-vgg_generated_48.i                        
'''

set -e

echo "<-----step 1 : install prerequisites ----->"
sudo apt-get -y update
sudo apt-get -y upgrade

sudo apt-get install -y build-essential cmake gfortran git pkg-config 
sudo apt-get install -y python-dev software-properties-common wget vim
sudo apt-get autoremove

echo "<-----step 2 : install cuda ----->"
sudo dpkg -i cuda-repo-ubuntu1604-9-0-local_9.0.176-1_amd64.deb
sudo apt-key add /var/cuda-repo-9-0-local/7fa2af80.pub
sudo apt-get update
sudo apt-get install cuda
echo "<-----step 2.2 : install cuda_patch ----->"
sudo dpkg -i cuda-repo-ubuntu1604-9-0-local-cublas-performance-update_1.0-1_amd64.deb
sudo apt-get update
sudo apt-get install cuda

nvidia-smi

echo "<-----step 3 : install cuDNN----->"
tar xvf cudnn-9.0-linux-x64-v7.tgz
sudo cp -P cuda/lib64/* /usr/local/cuda/lib64/
sudo cp cuda/include/* /usr/local/cuda/include/

echo "<-----step 3.1 : 查看cuda 和 cudnn 的版本----->"
cat  /usr/local/cuda/version.txt 
cat /usr/local/cuda/include/cudnn.h | grep CUDNN_MAJOR -A 2 

echo "<-----step 3.2 : update the paths----->"
echo 'export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/cuda/lib64:/usr/local/cuda/extras/CUPTI/lib64"' >> ~/.bashrc
echo 'export CUDA_HOME=/usr/local/cuda' >> ~/.bashrc
echo 'export PATH="/usr/local/cuda/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc

echo "<-----step 4 : install requirements for DL Frameworks----->"
sudo apt-get update
sudo apt-get install -y libprotobuf-dev libleveldb-dev libsnappy-dev libhdf5-serial-dev protobuf-compiler libopencv-dev

sudo apt-get install -y --no-install-recommends libboost-all-dev doxygen
sudo apt-get install -y libgflags-dev libgoogle-glog-dev liblmdb-dev libblas-dev 
sudo apt-get install -y libatlas-base-dev libopenblas-dev libgphoto2-dev libeigen3-dev libhdf5-dev 
 
sudo apt-get install -y python-dev python-pip python-nose python-numpy python-scipy
sudo apt-get install -y python3-dev python3-pip python3-nose python3-numpy python3-scipy

echo "<-----step 5 : enable virtual environments----->"
sudo pip2 install virtualenv virtualenvwrapper
sudo pip3 install virtualenv virtualenvwrapper
echo "# Virtual Environment Wrapper"  >> ~/.bashrc
echo "source /usr/local/bin/virtualenvwrapper.sh" >> ~/.bashrc
source ~/.bashrc

echo "<-----step 6 : Install Deep Learning frameworks----->"
# create a virtual environment for python 3
mkvirtualenv virtual-py3 -p python3
# Activate the virtual environment
#workon virtual-py3
 
pip install numpy scipy matplotlib scikit-image scikit-learn ipython protobuf jupyter

pip install tensorflow-gpu  
 
pip install Theano 
pip install keras
pip3 install torch-0.3.1-cp35-cp35m-linux_x86_64.whl 
pip3 install torchvision
pip install dlib

echo "<-----step 6 : Install OpenCV 3.4----->"
echo "<-----step 6.1 : install the dependencies----->"
sudo apt-get remove x264 libx264-dev
sudo apt-get install -y checkinstall yasm
sudo apt-get install -y libjpeg8-dev libjasper-dev libpng12-dev
 
 
# If you are using Ubuntu 16.04
sudo apt-get install -y libtiff5-dev
sudo apt-get install -y libavcodec-dev libavformat-dev libswscale-dev libdc1394-22-dev
 
sudo apt-get install -y libxine2-dev libv4l-dev
sudo apt-get install -y libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev
sudo apt-get install -y libqt4-dev libgtk2.0-dev libtbb-dev
sudo apt-get install -y libfaac-dev libmp3lame-dev libtheora-dev
sudo apt-get install -y libvorbis-dev libxvidcore-dev
sudo apt-get install -y libopencore-amrnb-dev libopencore-amrwb-dev
sudo apt-get install -y x264 v4l-utils

echo "<-----step 6.2 : Configure and generate the MakeFile----->"
sudo apt-get install -y zip
unzip opencv-3.4.0.zip  
unzip opencv_contrib-3.4.0.zip
cd opencv-3.4.0
mkdir build
cd build

#Remove the line WITH_CUDA=ON if you dont have CUDA in your system
cmake -D CMAKE_BUILD_TYPE=RELEASE \
      -D CMAKE_INSTALL_PREFIX=/usr/local \
      -D INSTALL_C_EXAMPLES=ON \
      -D INSTALL_PYTHON_EXAMPLES=ON \
      -D WITH_TBB=ON \
      -D WITH_V4L=ON \
      -D WITH_QT=ON \
      -D WITH_OPENGL=ON \
      -D WITH_CUDA=ON \
      -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib-3.4.0/modules \
      -D BUILD_EXAMPLES=ON ..

make -j10
sudo make install
sudo sh -c 'echo "/usr/local/lib" >> /etc/ld.so.conf.d/opencv.conf'
sudo ldconfig

# Link the opencv to python virtual environment
find /usr/local/lib/ -type f -name "cv2*.so"

############ For Python 3 ############
cd ~/.virtualenvs/virtual-py3/lib/python3.5/site-packages
ln -s /usr/local/lib/python3.5/site-packages/cv2.cpython-35m-x86_64-linux-gnu.so cv2.so

echo "<-----install finished! enjoy it.----->"


echo "<-----install pycharm!----->"
tar -zxvf pycharm-community-2017.3.4.tar.gz
cd pycharm-community-2017.3.4/bin/

echo "<-----手动安装 pycharm!----->"
./pycharm.sh

echo "<-----Ubuntu deep learning environment done!----->"
