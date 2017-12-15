all: student_management

clean:
	rm -f *.o > /dev/null

student_management:  main.o
	gcc -g -o student_management main.o

main.o: main.c
	gcc -g -c main.c

