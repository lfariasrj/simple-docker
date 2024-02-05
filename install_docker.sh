echo"Removing docker if installed...."
sudo apt-get -y remove docker docker-engine docker.io containerd runc

echo"Systems Updating..."
sudo apt-get -y update && sudo apt-get -y upgrade

echo"Installing docker dependencies"
sudo apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

echo"Installing dockers official GPG key..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key -y add -

echo"Adding docker repository..."
sudo add-apt-repository -y \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

echo"Updating..."
sudo apt-get -y update && sudo apt-get -y upgrade

echo"Installing docker...."
sudo apt-get -y install docker-ce docker-ce-cli containerd.io

echo"Running post install steps..."
sudo groupadd docker
sudo usermod -aG docker $USER
sudo systemctl enable docker.service
sudo systemctl enable containerd.service
