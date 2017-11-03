all: binary

clean:
	rm -f *.o > /dev/null

binary:  binary.o
	ld -o binary binary.o ../lib/lib.o

binary.o: binary.asm
	nasm -f elf64 -g -F dwarf binary.asm

