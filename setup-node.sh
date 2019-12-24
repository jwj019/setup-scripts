#install node
echo "*** Installing Node ***"
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install -y nodejs

#install yarn
echo "*** Installing Yarn ***"
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get -y update && sudo apt-get install -y yarn 

#install other npm dependencies
echo "*** Installing NPM stuff ***"
sudo npm install -g npm
sudo npm install -g yo
sudo npm install -g generator-jhipster
