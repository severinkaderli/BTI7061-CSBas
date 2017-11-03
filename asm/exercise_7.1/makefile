all: log

clean:
	rm -f *.o > /dev/null

log:  log.o
	ld -o log log.o ../lib/lib.o

log.o: log.asm
	nasm -f elf64 -g -F dwarf log.asm

