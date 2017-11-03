all: reboot

clean:
	rm -f *.o > /dev/null

reboot:  reboot.o
	ld -o reboot reboot.o ../lib/lib.o

reboot.o: reboot.asm
	nasm -f elf64 -g -F dwarf reboot.asm

