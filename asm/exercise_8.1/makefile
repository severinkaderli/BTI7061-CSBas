all: duration

clean:
	rm -f *.o > /dev/null

duration:  duration.o
	ld -o duration duration.o ../lib/lib.o

duration.o: duration.asm
	nasm -f elf64 -g -F dwarf duration.asm

