AC=nasm
QEMU=qemu-system-x86_64
EXATTR=-nographic
MAIN=boot.asm
BIN=$(patsubst %.asm, %.bin, $(MAIN))

.PHONY: all emulate

all: build

build: $(MAIN)
	$(AC) -f bin $< -o $(BIN)

clean:
	rm -f $(BIN)

emulate: build
	$(QEMU) -hda $(BIN) $(EXATTR)
