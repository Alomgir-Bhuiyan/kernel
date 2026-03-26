AC=nasm
QEMU=qemu-system-x86_64
EXATTR=-nographic 
PROJDIR=src
BUILDDIR=build
PROJCODE=$(foreach asm, $(PROJDIR), $(wildcard $(asm)/*.asm))
BIN=$(patsubst $(PROJDIR)/%.asm,%.bin, $(PROJCODE))
HDA=$(BUILDDIR)/$(BIN)

.PHONY: all emulate

all: build

build: $(PROJCODE)
	@mkdir -p $(BUILDDIR)
	$(AC) -f bin $< -o $(HDA)

clean:
	rm -rf $(BUILDDIR)

emulate: build
	$(QEMU) -hda $(HDA) $(EXATTR)
