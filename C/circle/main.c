#include <stdio.h>

#define PI 3.141592

int main(int argc, char **argv)
{
    double radius;
    printf("Input your radius:\n");
    scanf("%lf", &radius);
    
	printf("Radius = %.2f\n", radius);
    printf("Area = r² * π = %.2f\n", radius * radius * PI);
    printf("Circumference = 2 * π * r = %.2f\n", 2 * PI * radius);
	return 0;
}
