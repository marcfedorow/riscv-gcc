## Simple Makefile for riscv toolchain+qemu tests

## Change follow vars to your real path
CC_NEWLIB_ELF = ../../bin32/bin/riscv32-unknown-elf-gcc
CC_LINUX_ELF = ../../bin32/bin/riscv32-unknown-linux-gnu-gcc
QEMU = ../../qemu/build/qemu-riscv32

## Machine config
MARCH = rv32gc_zba_zbb_zbc_zbs_zbkb_zbkc_zbkx_zknd_zkne_zknh_zksed_zksh_zkr_zkt
MABI = ilp32d

## Usage:
##
## make elf:	compile all .c to .elf executable
## make asm:	compile all .c to .s readable assemble
## make all: 	elf and asm
## make test:	use qemu to run all .elf
## make clean:	remove all .elf and .s
##


SRCS = $(wildcard Z*.c)
ASMS = $(SRCS:.c=.s)
LINUX_ELFS = $(SRCS:.c=.out)
NEWLIB_ELFS = $(SRCS:.c=.elf)


.PHONY : all 
all: linux_elf newlib_elf asm


# Compile linux elfs
.PHONY : linux_elf
linux_elf: $(LINUX_ELFS)

$(LINUX_ELFS): %.out: %.c main.c
	$(CC_LINUX_ELF) -march="$(MARCH)" -mabi=$(MABI) -O3 -static $< main.c -o $@


# Compile newlib elfs
.PHONY : newlib_elf
newlib_elf: $(NEWLIB_ELFS)

$(NEWLIB_ELFS): %.elf: %.c main.c
	$(CC_NEWLIB_ELF) -march="$(MARCH)" -mabi=$(MABI) -O3 $< main.c -o $@


# Gen assembles
.PHONY : asm
asm: $(ASMS)

$(ASMS): %.s: %.c
	$(CC_LINUX_ELF) -march="$(MARCH)" -mabi=$(MABI) -O3 $< -S


# Use qemu to run all linux elf
TESTS = $(LINUX_ELFS:=.t)
.PHONY : test_linux_elf
test_linux_elf: $(TESTS)

.PHONY : $(TESTS)
$(TESTS): %.t: %
	$(QEMU) -cpu rv32,x-b=true,x-k=true $<


# Clean
.PHONY : clean
clean:
	rm -f $(ASMS) $(LINUX_ELFS) $(NEWLIB_ELFS)
