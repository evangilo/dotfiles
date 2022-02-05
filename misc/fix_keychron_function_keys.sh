#!/bin/bash

# https://mikeshade.com/posts/keychron-linux-function-keys/

echo "options hid_apple fnmode=0" | tee -a /etc/modprobe.d/hid_apple.conf
update-initramfs -u
