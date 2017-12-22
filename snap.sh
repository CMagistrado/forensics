#!/bin/sh

# Create directories
mkdir /tmp/mem
mkdir /tmp/mem/Memory_Captures

# Takes us to our work env
cp osxpmem_2.0.1.zip /tmp/mem
cd /tmp/mem
unzip osxpmem_2.0.1.zip

# Loading this kernel utility
sudo kextutil -t osxpmem.app/MacPmem.kext/

# Required to use utilites
sudo chown -R root:wheel osxpmem.app/
sudo osxpmem.app/osxpmem -o Memory_Captures/mem.aff4
sudo osxpmem.app/osxpmem -e /dev/pmem -o Memory_Captures/mem.raw Memory_Captures/mem.aff4

# Unload our kernel extension
sudo osxpmem.app/osxpmem -u
