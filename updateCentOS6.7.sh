#!/bin/sh

cd ../bento
packer build -only=parallels-iso centos-6.7-x86_64.json -machine-readable > ../packer.out
BOX=$(awk '/provider box/ { print $4;exit}' ../packer.out)
vagrant box remove parallels/centos-6.6
vagrant box add $BOX --name "my/parallels/centos-6.7"
rm $BOX
