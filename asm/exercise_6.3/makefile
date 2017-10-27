all: string_loop

clean:
	rm -f *.o > /dev/null

string_loop:  string_loop.o
	ld -o string_loop string_loop.o ../lib/lib.o

string_loop.o: string_loop.asm
	nasm -f elf64 -g -F dwarf string_loop.asm

