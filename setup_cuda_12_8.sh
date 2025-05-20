#!/bin/bash

cd -P
cd Desktop

echo "Install and Setup Cuda 12.8"
read -p "Do you want to continue install cuda 12.8? (Y/N): " user_input 

user_input=$(echo "$user_input" | tr '[:upper:]' '[:lower:]')

if [[ "$user_input" == "yes" || "$user_input" == "y" || "$user_input" == " "]]; then
	mkdir CUDA 
	cd CUDA 	
	sudo apt update
	wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-ubuntu2204.pin
	sudo mv cuda-ubuntu2204.pin /etc/apt/preferences.d/cuda-repository-pin-600
	wget https://developer.download.nvidia.com/compute/cuda/12.8.0/local_installers/cuda-repo-ubuntu2204-12-8-local_12.8.0-570.86.10-1_amd64.deb
	sudo dpkg -i cuda-repo-ubuntu2204-12-8-local_12.8.0-570.86.10-1_amd64.deb
	sudo cp /var/cuda-repo-ubuntu2204-12-8-local/cuda-*-keyring.gpg /usr/share/keyrings/
	sudo apt-get updatesudo apt-get -y install cuda-toolkit-12-8
	echo "export PATH=\${PATH}:/usr/local/cuda-12.9/bin">>~/.bashrc
	echo "export LD_LIBRARY_PATH=\${LD_LIBRARY_PATH:/usr/local/cuda-12.8/lib64">>~/.bashrc

	echo $PATH
	echo $LD_LIBRARY_PATH
	
	nvcc --version

else 
	echo "Installing interupted"
	exit 1
fi 

