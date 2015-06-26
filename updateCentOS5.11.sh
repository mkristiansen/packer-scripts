#!/bin/sh

cd ../bento/packer
packer build -only=parallels-iso centos-5.11-x86_64.json -machine-readable > ../../packer.out
BOX=$(awk '/provider box/ { print $6}' ../../packer.out)
vagrant box remove my/parallels/centos-5.11
vagrant box add $BOX --name "my/parallels/centos-5.11"
rm $BOX
