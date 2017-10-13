all: hello

clean:
	rm -f *.o > /dev/null

hello: hello.o
	ld -o hello hello.o

hello.o: hello.asm
	nasm -f elf64 -g -F dwarf hello.asm
