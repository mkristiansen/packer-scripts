#!/bin/sh

cd ../bento
packer build -only=parallels-iso centos-7.1X-x86_64.json -machine-readable > ../packer.out
BOX=$(awk '/provider box/ { print $4;exit}' ../packer.out)
vagrant box remove my/parallels/centos-7.1X
vagrant box add $BOX --name "my/parallels/centos-7.1X"
rm $BOX
