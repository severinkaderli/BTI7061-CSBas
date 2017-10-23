all: hello

clean:
	rm -f *.o > /dev/null

hello: lib.o hello.o
	ld -o hello hello.o lib.o

hello.o: hello.asm
	nasm -f elf64 -g -F dwarf hello.asm

lib.o: lib.asm
	nasm -f elf64 -g -F dwarf lib.asm
