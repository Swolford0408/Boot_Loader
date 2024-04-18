#!/bin/bash

nasm -f bin boot.asm -o boot.bin
qemu-system-i386 -drive file=boot.bin,format=raw
