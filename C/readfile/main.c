#include <stdio.h>

int main(int argc, char **argv)
{    
	if(argc < 2) {
        printf("No file given!\n");
        return 1;
    }
    
    char buffer[100];
    char *fileName = argv[1];
    char c;
    
    printf("The given file is: %s\n", fileName);
    FILE *fp = fopen(fileName, "r");
    if (fp) {
        while ((c = getc(fp)) != EOF)
            putchar(c);
        fclose(fp);
    }
    
	return 0;
}
