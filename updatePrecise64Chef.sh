#!/bin/sh

cd ../bento
packer build -only=parallels-iso ubuntu-12.04-amd64.json -machine-readable > ../packer.out
BOX=$(awk '/provider box/ { print $4;exit}' ../packer.out)
vagrant box remove my/parallels/ubuntu-12.04
vagrant box add $BOX --name "my/parallels/ubuntu-12.04"
rm $BOX