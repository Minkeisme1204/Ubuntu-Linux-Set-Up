#!/bin/bash

echo "Install and Set up cuDNN 8.9.7"
read -p "Do you want to continue install cuDNN 8.9.7? (Y/N): " user_input

user_input=$(echo "$user_input" | tr '[:upper:]' '[:lower:]')

if [[ "$user_input" == "yes" || "$user_input" == "y" ]]; then

	tar -xvf cudnn-linux-x86_64-8.9.7.29_cuda11-archive.tar.xz

	cd cudnn-linux-x86_64-8.9.7.29_cuda11-archive

	sudo cp include/cudnn*.h /usr/local/cuda-11.8/include

	sudo cp lib/libcudnn* /usr/local/cuda-11.8/lib64

	sudo chmod a+r /usr/local/cuda-11.8/include/cudnn*.h /usr/local/cuda-11.8/lib64/libcudnn*

	cd ..

	ls -l /usr/local/cuda-11.8/lib64/libcudnn*
	
	gcc -o test_cudnn test_cudnn.c -I/usr/local/cuda-11.8/include -L/usr/local/cuda-11.8/lib64 -lcudnn

	./test_cudnn
else
        echo "Installing interupted"
        exit 1
fi


