PORT ?= /dev/ttyACM0

.PHONY: flash

all: flash

BOARD := macchina:sam:m2

M2RET.macchina.sam.m2.bin: M2RET.ino $(wildcard *.cpp) $(wildcard *.h)
	arduino-cli compile --fqbn $(BOARD)

flash: M2RET.macchina.sam.m2.bin
	arduino-cli upload --fqbn $(BOARD) -p $(PORT)

clean:
	rm -f *.o *.elf *.bin

