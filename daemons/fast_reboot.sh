#!/bin/sh

kexec -l /boot/vmlinuz-linux --append='BOOT_IMAGE=/boot/vmlinuz-linux root=UUID=d95b5e93-5e3d-4f74-b14b-d02cb1df3ccb rw quiet' --initrd=/boot/initramfs-linux.img && kexec -e
