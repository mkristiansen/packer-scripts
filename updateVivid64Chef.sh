#!/bin/sh

cd ../bento/packer
packer build -only=parallels-iso ubuntu-15.04-amd64-chef-latest.json -machine-readable > ../../packer.out
BOX=$(awk '/provider box/ { printf $6}' ../../packer.out)
vagrant box remove my/parallels/ubuntu-15.04
vagrant box add $BOX --name "my/parallels/ubuntu-15.04"
rm $BOX