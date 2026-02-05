ASM=nasm
FLAGS=-f elf64 -I include/
LD=ld

SRC=$(shell find src/ -name '*.asm')
OBJ=$(SRC:src/%.asm=build/%.o)

all: build/main

build/main: 
	mkdir -p $(dir $(OBJ))

build /%.o: src/%.asm
	$(ASM) $(ASMFLAGS) $< -o $@

build/main: $(OBJ)
	$(LD) -o $@ $^