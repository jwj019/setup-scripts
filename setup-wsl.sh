#base installs
sudo apt update -y
sudo apt install -y \
    software-properties-common \
    unzip \
    curl \
    apt-transport-https \
    ca-certificates \
    python3 \
    python3-pip \
    python-pip \
    jq

#Install ansible
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt install ansible -y

#Install awscli
sudo apt install awscli -y

#Install terraform
TERRAFORM_VERSION=0.12.12
wget -q "https://releases.hashicorp.com/terraform/0.12.12/terraform_$(echo $TERRAFORM_VERSION)_linux_amd64.zip"
unzip "terraform_$(echo $TERRAFORM_VERSION)_linux_amd64.zip"
sudo mv terraform /usr/local/bin/terraform
rm "terraform_$(echo $TERRAFORM_VERSION)_linux_amd64.zip"

#install docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update -y
sudo apt-get install -y docker-ce
sudo usermod -aG docker $USER

#Install docker-compose
COMPOSE_VERSION=1.24.1
sudo curl -L "https://github.com/docker/compose/releases/download/$(echo $COMPOSE_VERSION)/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose


#Hook up docker to docker for windows
echo "export DOCKER_HOST=tcp://localhost:2375" >> ~/.bashrc && source ~/.bashrc

