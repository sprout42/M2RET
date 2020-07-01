PORT ?= /dev/ttyACM0
CURDIR := $(shell basename $(PWD))

.PHONY: flash

all: flash

BOARD := macchina:sam:m2

M2RET.macchina.sam.m2.bin: M2RET.ino $(wildcard *.cpp) $(wildcard *.h)
	cd .. && arduino-cli compile --fqbn $(BOARD) $(CURDIR)

flash: M2RET.macchina.sam.m2.bin
	cd .. && arduino-cli upload --fqbn $(BOARD) -p $(PORT) $(CURDIR)

clean:
	rm M2RET.macchina.sam.m2.bin
	rm M2RET.macchina.sam.m2.elf

