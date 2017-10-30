all: hexdump

clean:
	rm -f *.o > /dev/null

hexdump:  hexdump.o
	ld -o hexdump hexdump.o ../lib/lib.o

hexdump.o: hexdump.asm
	nasm -f elf64 -g -F dwarf hexdump.asm

