#!/bin/bash

### Calculate the size of the key partitions
declare -i sizepro=$( stat -c %s product_a.img )
declare -i sizeven=$( stat -c %s vendor_a.img )
declare -i sizesys=$( stat -c %s system_a.img )

### Reassemble them and insert offsets and sizes
lpmake \
     --metadata-size 65536 \
     --super-name super \
     --metadata-slots 3 \
     --device super:8587837440 \
     --group main_a:8587837440 \
     --partition product_a:readonly:"${sizepro}":main_a \
        --image product_a=./product_a.img \
     --partition system_a:readonly:"${sizesys}":main_a \
        --image system_a=./system_a.img \
     --partition vendor_a:readonly:"${sizeven}":main_a \
        --image vendor_a=./vendor_a.img \
     --group main_b:0 \
     --output ./super.new.img

### Move the Name, as MTKClient wants .BIN for some reason
mv ./super.new.img ./super.new.bin
