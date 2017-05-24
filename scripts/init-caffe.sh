#!/bin/bash

# install dependencies
sudo apt-get install --assume-yes libprotobuf-dev libleveldb-dev libsnappy-dev libopencv-dev libhdf5-serial-dev protobuf-compiler
sudo apt-get install --assume-yes --no-install-recommends libboost-all-dev
sudo apt-get install --assume-yes libgflags-dev libgoogle-glog-dev liblmdb-dev
sudo apt-get install --assume-yes libatlas-base-dev
sudo apt-get install --assume-yes python-dev

# pull code
git clone https://github.com/BVLC/caffe.git /media/raajay/MLFABRIC/caffe
cp /media/raajay/MLFABRIC/caffe/Makefile.config.example /media/raajay/MLFABRIC/caffe/Makefile.config

# do some fixes for 16.04 ubuntu
# TODO(raajay) copy the Makefile.config
cd /usr/lib/x84_64-linux-gnu; sudo ln -s libhdf5_serial.so.8.0.2 libhdf5.so
cd /usr/lib/x84_64-linux-gnu; sudo ln -s libhdf5_serial_hl.so.8.0.2 libhdf5_hl.so

cd /media/raajay/MLFABRIC/caffe; make
