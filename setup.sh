#!/bin/bash

echo "Setup gcc"
sudo apt-get install gcc

echo "Setup Vietnamese Typing"
sudo add-apt-repository ppa:bamboo-engine/ibus-bamboo
sudo apt-get update
sudo apt-get install ibus ibus-bamboo --install-recommends
ibus restart

echo "Setup python3-pip"
python3 --version
sudo apt update
sudo apt install python3-pip
pip3 --version

echo "Setup vim"
sudo apt update
sudo apt install vim
vim --version

echo "Setup alsa lib"
sudo apt update
sudo apt install libasound2-dev

echo "Setup git"
sudo apt-get install git 
git --version 

echo "setup wget"
sudo apt-get install wget
wget --version

echo "Setup labelimg"
mkdir Tools
cd Tools
git clone https://github.com/HumanSignal/labelImg.git
cd labelImg
sudo apt-get install pyqt5-dev-tools
pip3 install -r requirements/requirements-linux-python3.txt
make qt5py3
python3 labelImg.py
cd ..
cd ..

echo "Setup labelme":
sudo apt-get install labelme 
labelme --version

sudo apt-get update 
sudo apt upgrade 

echo "Check gpu"
nvidia-smi 
labelme --version
wget --version
gcc --version
git --version
