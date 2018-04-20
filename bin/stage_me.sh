#!/bin/bash

#I want this script to
# Accepts Argument Tag
TAG=$1

# Cleanup tmp directory
rm -Rf /tmp/Portfolio/
rm -f /tmp/Portfolio.$TAG.tar.gz

# Clone to tmp directory
git clone . /tmp/Portfolio/

# checkout tag
cd /tmp/ColdOnesStaging/
git checkout tags/$TAG

# Zip Clone
tar -czvf /tmp/Portfolio.$TAG.tar.gz .

# scp Clone to vultr.staging.portfolio:/tmp/
scp /tmp/Portfolio.$TAG.tar.gz vultr.staging.portfolio:/tmp/

# on host:
# unpack contents into directory with name ColdOnes-$TAG
ssh -t root@vultr.staging.portfolio "mkdir ~/Portfolio-$TAG && tar -xvzf /tmp/Portfolio.$TAG.tar.gz -C ~/Portfolio-$TAG"
