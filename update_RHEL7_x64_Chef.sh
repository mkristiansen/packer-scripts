#!/bin/sh

cd bento/packer
packer build -only=parallels-iso -var 'mirror=file:///Users/ieu94897/Sites/RHEL' rhel-7.0-x86_64.json -machine-readable > packer.out
BOX=$(awk '/provider box/ { print $6}' packer.out)
vagrant box remove parallels/rhel-7.0-x86_64
vagrant box add $BOX --name "parallels/rhel-7.0-x86_64"
rm $BOX
