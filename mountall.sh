#!/bin/bash

### Create the Mountpoint Folders if not exist
[ ! -d "./system" ] && mkdir -v ./system
[ ! -d "./vendor" ] && mkdir -v ./vendor
[ ! -d "./product" ] && mkdir -v ./product

### Add some additional space to the end of the partitions
dd if=/dev/zero bs=10M count=1 >> ./system_a.img
dd if=/dev/zero bs=10M count=1 >> ./vendor_a.img
dd if=/dev/zero bs=10M count=1 >> ./product_a.img

### And resize the FS to allow us to use it
resize2fs ./system_a.img
resize2fs ./vendor_a.img
resize2fs ./product_a.img

### Mount the partitions
mount -t ext4 -o loop,rw ./system_a.img ./system
mount -t ext4 -o loop,rw ./vendor_a.img ./vendor
mount -t ext4 -o loop,rw ./product_a.img ./product
