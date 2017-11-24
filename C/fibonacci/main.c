#include <stdio.h>

int fibonacci(int n) {
    if(n == 0) return 0;
    if(n == 1) return 1;
    
    return fibonacci(n - 1) + fibonacci(n - 2);
}

int main(int argc, char **argv)
{
    for(int i = 1; i <= 10; i++) {
        int fib = fibonacci(i);
        printf("fib(%d) = %d\n", i, fib);
    }
    
	return 0;
}
