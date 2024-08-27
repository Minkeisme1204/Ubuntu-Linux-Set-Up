#!/bin/bash

cd -P
cd Desktop

echo "Install and Setup Cuda 12.1.1"
read -p "Do you want to continue install cuda 12.1.1? (Y/N): " user_input

user_input=$(echo "$user_input" | tr '[:upper:]' '[:lower:]')

if [[ "$user_input" == "yes" || "$user_input" == "y" ]]; then
	mkdir CUDA 
	cd CUDA 	
	sudo apt update
	sudo apt upgrade
	sudo apt install build-essential
	wget https://developer.download.nvidia.com/compute/cuda/12.1.1/local_installers/cuda_12.1.1_530.30.02_linux.run
	sudo sh cuda_12.1.1_530.30.02_linux.run

	vim +"normal Goexport PATH=/usr/local/cuda-12.1/bin\${PATH:+:\${PATH}}" +wq -- "~/.bashrc"
	vim +"normal Goexport LD_LIBRARY_PATH=/usr/local/cuda-12.1/lib64\${LD_LIBRARY_PATH:+:\${LD_LIBRARY_PATH}}" +wq -- "~/.bashrc"
	source ~/.bashrc

	PATH3 = "/usr/local/cuda-12.1/lib64"
	sudo vim +"normal Go$PATH3" +wq -- "/etc/ld.so.config"

	sudo ldconfig
	echo $PATH
	echo $LD_LIBRARY_PATH
	sudo ldconfig -p | grep cuda
	nvcc --version

else 
	echo "Installing interupted"
	exit 1
fi 

