#!/bin/bash

### Unmount the images
umount -v ./system
umount -v ./vendor
umount -v ./product

### FSCK Them to fix errors
e2fsck -fy system_a.img
e2fsck -fy vendor_a.img
e2fsck -fy product_a.img

### Shrink them to their smallest sizes
resize2fs -M system_a.img
resize2fs -M vendor_a.img
resize2fs -M product_a.img

### And repair any more F/S Errors
e2fsck -fy system_a.img
e2fsck -fy vendor_a.img
e2fsck -fy product_a.img
