all: lib

clean:
	rm -f *.o > /dev/null

lib: lib.o lib.o
	ld -o lib lib.o

lib.o: lib.asm
	nasm -f elf64 -g -F dwarf lib.asm

