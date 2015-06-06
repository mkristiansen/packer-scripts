#!/bin/sh

cd ../bento/packer
packer build -only=parallels-iso ubuntu-14.04-amd64-chef-latest.json -machine-readable > ../../packer.out
BOX=$(awk '/provider box/ { printf $6}' ../../packer.out)
vagrant box remove my/parallels/ubuntu-14.04
vagrant box add $BOX --name "my/parallels/ubuntu-14.04"
rm $BOX