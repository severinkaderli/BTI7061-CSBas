all: print_number

clean:
	rm -f *.o > /dev/null

print_number: print_number.o
	ld -o print_number print_number.o

print_number.o: print_number.asm
	nasm -f elf64 -g -F dwarf print_number.asm
