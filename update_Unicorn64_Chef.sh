#!/bin/sh

cd bento/packer
packer build -only=parallels-iso ubuntu-14.10-amd64.json -machine-readable > packer.out
BOX=$(awk '/provider box/ { print $6}' packer.out)
vagrant box remove parallels/ubuntu-14.10
vagrant box add $BOX --name "parallels/ubuntu-14.10_x64"
rm $BOX
