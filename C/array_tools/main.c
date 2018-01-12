#include <time.h>
#include <stdio.h>
#include <stdlib.h>


#define RANDOM_UPPER_BOUND 100
#define ARRAY_SIZE 10


void printArray(int* array, size_t arrayLength) {
	for(int i = 0; i < arrayLength; i++) {
		printf("%d, ", array[i]);
	}

	printf("\n");
}

void fillArray(int * array, size_t arrayLength) {
	for(int i = 0; i< arrayLength; i++) {
		array[i] = rand() % RANDOM_UPPER_BOUND + 1;
	}
}

void shuffleArray(int* array, size_t arrayLength) {
	for(int i = 0; i < arrayLength - 1; i++) {
		int j = (i + rand() % arrayLength - i);
		int tmp = array[i];
		array[i] = array[j];
		array[j] = tmp;
	}
}

int main(int argc, char **argv) {
	// Set the random seed
	srand(time(NULL));

	// Initialise the array with random values
	int originalArray[ARRAY_SIZE];
	fillArray(originalArray, ARRAY_SIZE);
	
	printArray(originalArray, ARRAY_SIZE);
	shuffleArray(originalArray, ARRAY_SIZE);
	printArray(originalArray, ARRAY_SIZE);
	
	return 0;
}
