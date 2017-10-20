all: factorial

clean:
	rm -f *.o > /dev/null

factorial: factorial.o
	ld -o factorial factorial.o

factorial.o: factorial.asm
	nasm -f elf64 -g -F dwarf factorial.asm
