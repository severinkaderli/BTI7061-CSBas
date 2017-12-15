#include <stdio.h>
#include <string.h>
#include <stdbool.h>

#define BUFFER_LENGTH 256

/**
 * Sort a string using the bubble sort algorithm
 */
void bubbleSort(char * string) {
	int strLength = strlen(string);
	for(int i = strLength; i > 1; i--) {
		for(int j = 0; j < i - 1; j++) {
			if(string[j] > string[j + 1]) {
				char tmp = string[j];
				string[j] = string[j + 1];
				string[j + 1] = tmp;
			}
		}
	}
}

int main(int argc, char **argv) {
	// Read the string from stdin
	char string[BUFFER_LENGTH];
	puts("Please enter a string:");
	fgets(string, BUFFER_LENGTH, stdin);

	// Remove the trailing \n from fgets()
	char *strPtr = strchr(string, '\n');
	if(strPtr != NULL) {
		*strPtr = '\0';
	}

	// Sort the string using bubble sort
	bubbleSort(string);	

	// Print out the sorted string
	puts("The sorted string:");
	printf("%s\n", string);

	return 0;
}
