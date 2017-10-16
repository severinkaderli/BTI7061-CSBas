all: sum

clean:
	rm -f *.o > /dev/null

sum: sum.o
	ld -o sum sum.o

sum.o: sum.asm
	nasm -f elf64 -g -F dwarf sum.asm
