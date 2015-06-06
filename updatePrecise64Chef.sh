#!/bin/sh

cd bento/packer
packer build -only=parallels-iso ubuntu-12.04-amd64-chef-latest.json -machine-readable > packer.out
BOX=$(awk '/provider box/ { print $6}' packer.out)
vagrant box remove parallels/ubuntu-12.04
vagrant box add $BOX --name "parallels/ubuntu-12.04"
rm $BOX
