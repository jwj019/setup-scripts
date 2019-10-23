#base installs
sudo apt update -y
sudo apt install -y \
    software-properties-common \
    unzip \
    curl \
    apt-transport-https \
    ca-certificates \
    python3 \
    python3-pip

#Install ansible
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt install ansible

#Install awscli
sudo apt install awscli

#Install terraform
TERRAFORM_VERSION=0.12.12
wget -q "https://releases.hashicorp.com/terraform/0.12.12/terraform_$(echo $TERRAFORM_VERSION)_linux_amd64.zip"
unzip "terraform_$(echo $TERRAFORM_VERSION)_linux_amd64.zip"
sudo mv terraform /usr/local/bin/terraform
rm "terraform_$(echo $TERRAFORM_VERSION)_linux_amd64.zip"

#install docker and docker-compose
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update -y
sudo apt-get install -y docker-ce
sudo usermod -aG docker $USER

pip3 install --user docker-compose

#Hook up docker to docker for windows
echo "export DOCKER_HOST=tcp://localhost:2375" >> ~/.bashrc && source ~/.bashrc

