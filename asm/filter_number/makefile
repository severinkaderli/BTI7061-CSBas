all: filter_number

clean:
	rm -f *.o > /dev/null

filter_number: filter_number.o
	ld -o filter_number filter_number.o

filter_number.o: filter_number.asm
	nasm -f elf64 -g -F dwarf filter_number.asm
