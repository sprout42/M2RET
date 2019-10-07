ARDUINO_HOME?=$(HOME)/.arduino15/
ARDUINO_LIB_HOME?=$(HOME)/Arduino/libraries/
BUILDER_PATH?=$(shell dirname $$(readlink $$(which arduino)))/
SERIAL_PORT?=/dev/ttyACM0

.PHONY: m2

m2: BOARD := macchina:sam:m2
m2: M2RET.ino $(wildcard *.cpp) $(wildcard *.h)
	arduino-cli compile --fqbn $(BOARD)
	arduino-cli upload -p $(PORT) --fqbn $(BOARD)

clean:
	rm -f *.o *.elf *.bin

