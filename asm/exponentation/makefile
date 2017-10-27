all: exponentation

clean:
	rm -f *.o > /dev/null

exponentation:  exponentation.o
	ld -o exponentation exponentation.o ../lib/lib.o

exponentation.o: exponentation.asm
	nasm -f elf64 -g -F dwarf exponentation.asm

