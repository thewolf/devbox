#!/bin/sh
set -e
set -u

sudo apt-get update 

#essential tools
sudo apt-get install --no-install-recommends -y -q git curl build-essential pwgen

#nginx
sudo apt-get install --no-install-recommends -y -q ca-certificates nginx

#nodejs
curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash - 
sudo apt-get install -y nodejs 

#meteor
#curl https://install.meteor.com/ | sh

#optional: cloud9
git clone git://github.com/c9/core.git ~/.c9
cd ~/.c9
scripts/install-sdk.sh

#cleaning
sudo rm -rf /var/lib/apt/lists/*



export C9_PASS=$(pwgen -1)

#execute
# curl https://raw.githubusercontent.com/thewolf/devbox/master/meteor.dev.sh | sh

sudo npm install forever -g
cd ~/.c9
echo $C9_PASS
forever start server.js --port 8080 --listen 0.0.0.0 -w /home --packed -b --auth c9:$C9_PASS
