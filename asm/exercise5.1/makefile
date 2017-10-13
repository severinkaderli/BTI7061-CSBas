all: count

clean:
	rm -f *.o > /dev/null

count: count.o
	ld -o count count.o

count.o: count.asm
	nasm -f elf64 -g -F dwarf count.asm
