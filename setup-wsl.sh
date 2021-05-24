#base installs
sudo apt update -y && sudo apt dist-upgrade -y
sudo apt install -y \
    software-properties-common \
    unzip \
    curl \
    apt-transport-https \
    ca-certificates \
    python3 \
    python3-pip \
    jq

#Install ansible
pip3 install ansible

#Install awscli
sudo apt install awscli -y

#Install terraform
TERRAFORM_VERSION=0.15.4
wget -q "https://releases.hashicorp.com/terraform/$(echo $TERRAFORM_VERSION)/terraform_$(echo $TERRAFORM_VERSION)_linux_amd64.zip"
unzip "terraform_$(echo $TERRAFORM_VERSION)_linux_amd64.zip"
sudo mv terraform /usr/local/bin/terraform
rm "terraform_$(echo $TERRAFORM_VERSION)_linux_amd64.zip"

#Install docker-compose
COMPOSE_VERSION=1.29.2
sudo curl -L "https://github.com/docker/compose/releases/download/$(echo $COMPOSE_VERSION)/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
