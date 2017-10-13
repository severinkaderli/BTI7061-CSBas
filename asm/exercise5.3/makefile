all: invert

clean:
	rm -f *.o > /dev/null

invert: invert.o
	ld -o invert invert.o

invert.o: invert.asm
	nasm -f elf64 -g -F dwarf invert.asm
