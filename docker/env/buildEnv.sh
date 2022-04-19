
#!/bin/bash
apt-get install git vim gcc wget
wget https://developer.arm.com/-/media/Files/downloads/gnu/11.2-2022.02/binrel/gcc-arm-11.2-2022.02-x86_64-arm-none-eabi.tar.xz
wget https://developer.arm.com/-/media/Files/downloads/gnu/11.2-2022.02/binrel/gcc-arm-11.2-2022.02-x86_64-aarch64-none-elf.tar.xz
chmod 777 gcc*.tar.xz
tar -xvf gcc-arm-11.2-2022.02-x86_64-arm-none-eabi.tar.xz 
tar -xvf gcc-arm-11.2-2022.02-x86_64-aarch64-none-elf.tar.xz 
rm gcc*.tar.xz
mv  gcc* /opt/.
echo PATH=$PATH:/opt/gcc-arm-11.2-2022.02-x86_64-aarch64-none-elf/bin:/opt/gcc-arm-11.2-2022.02-x86_64-arm-none-eabi/bin >> ../.bashrc

