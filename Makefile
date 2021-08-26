## Simple Makefile for riscv toolchain+qemu tests

## Change follow vars to your real path
CC = ../bin/bin/riscv64-unknown-linux-gnu-gcc
QEMU = ../qemu/build/qemu-riscv64

## Machine config
MARCH = rv64gc_zba_zbb_zbc_zbs_zbkb_zbkc_zbkx_zknd_zkne_zknh_zksed_zksh_zkr_zkt
MABI = lp64d

## Usage:
##
## make elf:	compile all .c to .elf executable
## make asm:	compile all .c to .s readable assemble
## make all: 	elf and asm
## make test:	use qemu to run all .elf
## make clean:	remove all .elf and .s
##


SRCS = $(wildcard *.c)
ASMS = $(SRCS:.c=.s)
ELFS = $(SRCS:.c=.elf)

.PHONY : all 
all: elf asm


.PHONY : elf
elf: $(ELFS)

$(ELFS): %.elf: %.c
	$(CC) -march="$(MARCH)" -mabi=$(MABI) -O3 -static $< -o $@


.PHONY : asm
asm: $(ASMS)

$(ASMS): %.s: %.c
	$(CC) -march="$(MARCH)" -mabi=$(MABI) -O3 $< -S


TESTS = $(ELFS:=.t)
.PHONY : test
test: $(TESTS)

.PHONY : $(TESTS)
$(TESTS): %.t: %
	$(QEMU) -cpu rv64,x-b=true $<

.PHONY : clean
clean:
	rm $(ASMS) $(ELFS)
