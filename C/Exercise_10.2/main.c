#include <stdio.h>
#include <stdbool.h>

/**
 * @brief Checks if a character is lowercase.
 * 
 * @param c The character that will be checked
 * @return True when the character is lowercase false otherwise 
 */
bool isLowercase(char c) {
    if(c >= 97 && c <= 122) {
        return true;
    }
    
    return false;
}

/**
 * @brief Convert a lowercase character into a uppercase one.
 * 
 * @param c That character that will be converted
 * @return 
 */
char convertToUppercase(char c) {
    if(isLowercase(c)) {
        return c -= 32; 
    } 
    
    return c;
}

int main(int argc, char **argv)
{    
    // Check if a filename was provided
	if(argc < 2) {
        printf("No file given!\n");
        return 1;
    }
    
    char *fileName = argv[1];
    printf("The given file is: %s\n\n", fileName);
    
    // Open the file in read mode
    char c;
    FILE *fp = fopen(fileName, "r");

    if (fp) {
        while ((c = getc(fp)) != EOF) {
            c = convertToUppercase(c);
            putchar(c);
        }
        fclose(fp);
    }
    
	return 0;
}
