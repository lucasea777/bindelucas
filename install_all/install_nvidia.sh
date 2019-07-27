
# nvidia things
# instalacion de driver!!
# si la pantalla esta negra/black screen posible solucion es (usando ssh)
# https://askubuntu.com/a/841665/495273
# y reiniciar o...
# cd /etc/X11/; sudo cp xorg.conf.nvidia-xconfig-original xorg.conf

# https://askubuntu.com/questions/1077061/how-do-i-install-nvidia-and-cuda-drivers-into-ubuntu

sudo rm /etc/apt/sources.list.d/cuda*
sudo apt remove nvidia-cuda-toolkit
sudo apt remove nvidia-*
sudo apt update
sudo apt-key adv --fetch-keys  http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub
sudo bash -c 'echo "deb http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64 /" > /etc/apt/sources.list.d/cuda.list'
sudo apt update
sudo apt install nvidia-driver-410
sudo apt install cuda-10-0
# set PATH for cuda 10.0 installation
if [ -d "/usr/local/cuda-10.0/bin/" ]; then
    export PATH=/usr/local/cuda-10.0/bin${PATH:+:${PATH}}
    export LD_LIBRARY_PATH=/usr/local/cuda-10.0/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
fi

# elejir ejecutable aca! https://developer.nvidia.com/cuda-downloads?target_os=Linux&target_arch=x86_64&target_distro=Ubuntu&target_version=1804&target_type=deblocal
if [[ ! `lspci | grep -i nvidia | wc -l` = "0" ]]; then
	echo "nvidia";
	inst linux-headers-$(uname -r) #linux kernel headers

	SRC='https://developer.nvidia.com/compute/cuda/10.0/Prod/local_installers/cuda-repo-ubuntu1804-10-0-local-10.0.130-410.48_1.0-1_amd64'
	# MD5SUM='816f80220e13a77fb6bb05620114691d'
	# if [[ -e "~/Downloads/$(basename $SRC)".deb ]]; then
	# 	md5=$(md5sum ~/Downloads/$(basename $SRC) | awk '{ print $1}')
	# 	if [[ ! $md5 = "$MD5SUM" ]]; then
	# 		download=true
	# 	fi
	# else
	# 	download=true
	# fi
	# if [[ $download == true ]]; then
	# 	wget --continue -O ~/Downloads/$(basename $SRC).deb $SRC #-qq
	# fi
	sudo dpkg -i ~/Downloads/cuda-repo-ubuntu1804-10-0-local-10.0.130-410.48_1.0-1_amd64.deb
	sudo apt-key add /var/cuda-repo-10-0-local-10.0.130-410.48/7fa2af80.pub
	sudo apt-get update
	inst cuda

fi

# para testear la instalacion

cd /tmp
/usr/local/cuda-10.0/bin/cuda-install-samples-10.0.sh .
cd NVIDIA_CUDA-10.0_Samples/1_Utilities/deviceQuery
make && ./deviceQuery

# docker

# Add the package repositories
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | \
  sudo apt-key add -
distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | \
  sudo tee /etc/apt/sources.list.d/nvidia-docker.list
sudo apt-get update

# Install nvidia-docker2 and reload the Docker daemon configuration
sudo apt-get install -y nvidia-docker2
sudo pkill -SIGHUP dockerd
sudo usermod -a -G docker $USER
sudo chown luks /var/run/docker.sock

# Test nvidia-smi with the latest official CUDA image
docker run --runtime=nvidia --rm nvidia/cuda:10.0-base nvidia-smi
