
SD_LIN_DEVICE=e
SD_WIN_DEVICE=E:
IMG_NAME=rpi4-env
CONT_NAME=$(IMG_NAME)-cont 

ARM_BIN_DIR=/opt/gcc-arm-11.2-2022.02-x86_64-arm-none-eabi/bin
#ARM_BIN_DIR=/opt/gcc-arm-11.2-2022.02-x86_64-aarch64-none-elf/bin
DOCKER_SRC_DIR=/root/src

DOCKER_CMD=docker exec $(CONT_NAME) $(ARM_BIN_DIR)



mount-sd:
	@sudo mkdir -p /dev/$(SD_LIN_DEVICE)
	@sudo mount -t drvfs $(SD_WIN_DEVICE) /mnt/$(SD_LIN_DEVICE)


build:
	@$(DOCKER_CMD)/arm-none-eabi-as $(DOCKER_SRC_DIR)/start.s -o $(DOCKER_SRC_DIR)/start.o
	@$(DOCKER_CMD)/arm-none-eabi-ld $(DOCKER_SRC_DIR)/start.o -o $(DOCKER_SRC_DIR)/kernel.elf
	@$(DOCKER_CMD)/arm-none-eabi-objcopy $(DOCKER_SRC_DIR)/kernel.elf -O binary $(DOCKER_SRC_DIR)/kernel7l.img


clean:
	@rm -f *.o *.elf *.img