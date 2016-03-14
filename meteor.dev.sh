#!/bin/sh
set -e

sudo apt-get update 

#essential tools
sudo apt-get install --no-install-recommends -y -q git curl build-essential ca-certificates 

#nodejs
curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash - 
sudo apt-get install -y nodejs 

#meteor
curl https://install.meteor.com/ | sh

#create workspace
mkdir /workspace && cd /workspace

#optional: cloud9
git clone git://github.com/c9/core.git c9sdk
cd c9sdk
scripts/install-sdk.sh

