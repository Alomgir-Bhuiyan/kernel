AC = nasm
QEMU = qemu-system-x86_64
EXATTR = -nographic

PROJDIR = src
BUILDDIR = build

SRC = $(wildcard $(PROJDIR)/*.asm)
BIN = $(patsubst $(PROJDIR)/%.asm,$(BUILDDIR)/%.bin,$(SRC))

.PHONY: all build clean emulate

all: build

build: $(BIN)

$(BUILDDIR)/%.bin: $(PROJDIR)/%.asm
	@mkdir -p $(BUILDDIR)
	$(AC) -f bin $< -o $@

clean:
	rm -rf $(BUILDDIR)

# run first binary (boot/test)
emulate: build
	$(QEMU) -hda $(firstword $(BIN)) $(EXATTR)
