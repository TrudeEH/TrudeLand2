#! /bin/bash

sudo pacman -S reflector

sudo reflector --sort rate -p https --save /etc/pacman.d/mirrorlist --verbose
