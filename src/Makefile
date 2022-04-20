
SD_LIN_DEVICE=e
SD_WIN_DEVICE=E:
IMG_NAME=rpi4-env
CONT_NAME=$(IMG_NAME)-cont 

ARM_BIN_DIR=/opt/gcc-arm-11.2-2022.02-x86_64-arm-none-eabi/bin
#ARM_BIN_DIR=/opt/gcc-arm-11.2-2022.02-x86_64-aarch64-none-elf/bin
DOCKER_SRC_DIR=/root/src
LOCAL_SRC_DIR=.

DOCKER_CMD=docker exec $(CONT_NAME) $(ARM_BIN_DIR)

INC_DIR=.
OBJ_DIR=$(DOCKER_SRC_DIR)/obj

BOOT_SRC=$(DOCKER_SRC_DIR)/start.s
MAIN_SRC=$(DOCKER_SRC_DIR)/main.c

BOOT_OBJ=$(OBJ_DIR)/start.o
MAIN_OBJ=$(OBJ_DIR)/main.o


OBJ_FILES= $(BOOT_OBJ) $(MAIN_OBJ)
LINKER_FILE=$(DOCKER_SRC_DIR)/linker.ld
ELF_FILE=/bin/kernel7l.elf
BIN_FILE=/bin/kernel7l.img

FLAGS= -ffreestanding -O2 -nostdlib -lgcc


all: clean build upload


build:
	@if ! [ -d "./bin" ]; then mkdir ./bin; fi
	@if ! [ -d "./obj" ]; then mkdir ./obj; fi
	@$(DOCKER_CMD)/arm-none-eabi-as -o  $(BOOT_OBJ)  $(BOOT_SRC)
	@$(DOCKER_CMD)/arm-none-eabi-gcc -c -o  $(MAIN_OBJ)  $(MAIN_SRC) -I$(INC_DIR)
	@$(DOCKER_CMD)/arm-none-eabi-gcc -T  $(LINKER_FILE) -o   $(DOCKER_SRC_DIR)$(ELF_FILE)  $(OBJ_FILES) $(FLAGS) 
	@$(DOCKER_CMD)/arm-none-eabi-objcopy   $(DOCKER_SRC_DIR)$(ELF_FILE) -O  binary $(DOCKER_SRC_DIR)$(BIN_FILE)


upload:
	@sudo mkdir -p /mnt/$(SD_LIN_DEVICE)
	@sudo mount -t drvfs $(SD_WIN_DEVICE) /mnt/$(SD_LIN_DEVICE)
	@sudo cp -f $(LOCAL_SRC_DIR)$(BIN_FILE) /mnt/$(SD_LIN_DEVICE)/.
	@sudo umount /mnt/$(SD_LIN_DEVICE)

clean:
	@rm -rf bin/ obj/ *.o *.elf *.img *.a *.srec