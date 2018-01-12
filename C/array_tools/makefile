all: array_tools

clean:
	rm -f *.o > /dev/null

array_tools:  main.o
	gcc -o array_tools main.o

main.o: main.c
	gcc -c main.c

