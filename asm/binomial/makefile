all: binomial

clean:
	rm -f *.o > /dev/null

binomial:  binomial.o
	ld -o binomial binomial.o ../lib/lib.o

binomial.o: binomial.asm
	nasm -f elf64 -g -F dwarf binomial.asm

