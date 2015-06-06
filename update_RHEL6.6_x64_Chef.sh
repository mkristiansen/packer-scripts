#!/bin/sh

cd bento/packer
packer build -only=parallels-iso -var 'mirror=file:///Users/ieu94897/Sites/RHEL' rhel-6.6-x86_64.json -machine-readable > packer.out
BOX=$(awk '/provider box/ { print $6}' packer.out)
vagrant box remove parallels/rhel-6.6
vagrant box add $BOX --name "parallels/rhel-6.6"
rm $BOX
