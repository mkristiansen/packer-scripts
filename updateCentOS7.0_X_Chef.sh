#!/bin/sh

cd ../bento/packer
packer build -only=parallels-iso centos-7.0-x86_64-Xwindows.json -machine-readable > ../../packer.out
BOX=$(awk '/provider box/ { print $4;exit}' ../../packer.out)
vagrant box remove my/parallels/centos-7.0-X
vagrant box add $BOX --name "my/parallels/centos-7.0-X"
rm $BOX
