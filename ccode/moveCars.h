
/* C Routine to update the blue cars */
void updateBlueCarsCRoutine(int dimRow, 
							int dimCol,
							int numBluecars,
							int *bluecars, 
							int numRedcars,
							int *redcars,
							int *newBluecars);


/* C Routine to move sinlge blue car */
int moveOneBlueCar(int oldPosition,
				   int dimCol,
				   int numBluecars,
				   int *bluecars,
				   int numRedcars,
				   int *redcars);


/* Check if there is currently a car in the given position */
int checkIsCarPositionTaken(int positionToCheck,
							int numCarsInArray,
							int *carArray);
