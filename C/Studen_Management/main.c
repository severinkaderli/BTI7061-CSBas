#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_STUDENTS 32

// Structure for a student
typedef struct {
	char id[10];
	char name[20];
	char sex;
	float mark1, mark2, mark3, mark4, mark5;
	float total;
} Student;

/**
 * Prints a divider to the output.
 */
void printDivider() {
	puts("========================================");
}

/**
 * Prompts the user to enter a choice.
 */
void printChoicePrompt() {
	puts("Enter your choice (1-9):");
}

/**
 * Displays the menu which provides the different choices
 * to the user.
 */
void displayMenu() {
	printDivider();
	puts("- MENU                                 -");
	printDivider();
	puts("");
	puts("1. Add student record");
	puts("2.");
	puts("3.");
	puts("4. View student records");
	puts("");
}

/**
 * Adds a new student to the students array.
 */
void addRecord(Student *students, int *numberOfStudents) {
	// Ask for the information for the new student
	Student student;
	strcpy(student.id, "132432");
	strcpy(student.name, "Severin");
	student.sex = 'M';
	student.mark1 = 1;
	student.mark2 = 2;
	student.mark3 = 3;
	student.mark4 = 4;
	student.mark5 = 5;
	student.total = 34324;

	// Add the new student at the first free position in the array
	students = students + ((*numberOfStudents) * sizeof(Student));
	*students = student;
	(*numberOfStudents)++;
}

/**
 * Displays all user records in a table.
 */
void displayStudents(Student *students, int numberOfStudents) {
	printf("Number of students: %d\n", numberOfStudents);
	for(int i = 0; i < numberOfStudents; i++) {
		puts(students[i].id);
		puts(students[i].name);
		printDivider();
	}
}


/**
 * Executes the function which the user entered.
 */
void processChoice(int choice, Student *students, int *numberOfStudents) {
	switch(choice) {
		case 1: addRecord(students, numberOfStudents); break;
		case 2: break;
		case 3: break;
		case 4: displayStudents(students, *numberOfStudents); break;
		case 5: break;
		case 6: break;
		case 7: break;
		case 8: break;
		case 9: break;
	}
}

int main(int argc, char **argv) {
	// Create an array for the students
	Student students[MAX_STUDENTS];
	int numberOfStudents = 0;


	// Display the menu
	displayMenu();
	int choice;
	char confirmationPrompt;
	
	// Get the choice of the user and process it
	do {
		printChoicePrompt();
		scanf("%d", &choice);
		processChoice(choice, students, &numberOfStudents);
		printf("Number of students: %d\n", numberOfStudents);
		puts("Press y or Y to continue:");
		scanf("%s", &confirmationPrompt);
	} while(confirmationPrompt == 'y' || confirmationPrompt == 'Y');

	return 0;
}
