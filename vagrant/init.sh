#!/bin/bash

# update the repositories
sudo apt-get update -y

# install some basic utilities
sudo apt-get install -y make curl htop git-core vim unzip bzip2
sudo apt-get install -y python-software-properties 