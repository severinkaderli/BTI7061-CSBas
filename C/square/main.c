#include <stdio.h>

int main(int argc, char **argv)
{
	printf("What is your number?\n");
    int number;
    scanf("%d", &number);
    printf("The square of %d is %d.\n", number, number * number);
	return 0;
}
