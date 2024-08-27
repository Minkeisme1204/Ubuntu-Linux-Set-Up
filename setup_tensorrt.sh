#!/bin/bash

echo "Install and Set up TensorRT 8.6.1.6"
read -p "Do you want to continue install TensorRT 8.6.1.6? (Y/N): " user_input

user_input=$(echo "$user_input" | tr '[:upper:]' '[:lower:]')

if [[ "$user_input" == "yes" || "$user_input" == "y" ]]; then
	tar -xzvf TensorRT-8.6.1.6.Linux.x86_64-gnu.cuda-12.0.tar.gz
	sudo mv TensorRT-8.6.1.6 /usr/local/TensorRT-8.6.1
	PATH_DNN1="export PATH=/usr/local/cuda-12.1/bin:/usr/local/TensorRT-8.6.1/bin:\$PATH"
	PATH_DNN2="export LD_LIBRARY_PATH=/usr/local/cuda-12.1/lib64:/usr/local/TensorRT-8.6.1/lib:\$LD_LIBRARY_PATH"
        vim +"normal Go$PATH_DNN1" +wq -- "~/.bashrc"
	vim +"normal Go$PATH_DNN2" +wq -- "~/.bashrc"
	source ~/.bashrc

	sudo ldconfig

	sudo rm /usr/local/cuda-12.1/targets/x86_64-linux/lib/libcudnn*.so.8

	sudo ln -s /usr/local/cuda-12.1/targets/x86_64-linux/lib/libcudnn_adv_infer.so.8.x.x /usr/local/cuda-12.1/targets/x86_64-linux/lib/libcudnn_adv_infer.so.8



else
        echo "Installing interupted"
        exit 1
fi

