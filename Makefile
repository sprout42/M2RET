ARDUINO_HOME=$(HOME)/Library/Arduino15/
ARDUINO_LIB_HOME=$(HOME)/Documents/Arduino/libraries/
BUILDER_PATH=/Applications/Arduino.app/Contents/Java/
BUILDER_TOOLS_PATH=/Applications/Arduino.app/Contents/Java/tools-builder
SERIAL_PORT=/dev/tty.usbmodem1411141

m2: BOARD := macchina:sam:m2
m2: build/M2RET.ino.bin

build/M2RET.ino.bin: M2RET.ino $(wildcard *.cpp) $(wildcard *.h)
	mkdir -p build/
	$(BUILDER_PATH)arduino-builder -build-path $(PWD)/build -tools $(ARDUINO_HOME)packages/arduino/tools/ -tools $(BUILDER_TOOLS_PATH) -hardware $(BUILDER_PATH)hardware/ -hardware $(ARDUINO_HOME)packages/ -libraries $(ARDUINO_LIB_HOME) -fqbn $(BOARD) $<

bootloader:
	stty -F $(SERIAL_PORT) 1200 cs8 cread clocal
	sleep 1

flash:
	cp build/M2RET.ino.bin build/firmware.ino.bin
	$(ARDUINO_HOME)packages/arduino/tools/bossac/1.6.1-arduino/bossac -e -w -v -b build/firmware.ino.bin -R

clean:
	rm -rf build/

