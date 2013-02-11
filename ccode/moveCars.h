
/* C Routine to update the blue cars.
   Called by RupdateCarsCRoutine

   Each blue car moves up by one space.
   INPUTS: int dimRow:       num of rows
           int dimCol:       num of columns
		   int numBluecars:  num of bluecars
		   int *bluecars:    pointer to the bluecars
		   int numRedcars:   num of redcars
		   int *redcars:     pointer to the redcars
		   int *newBluecars: pointer to the newset of bluecars


 */
void updateBlueCarsCRoutine(int dimRow, 
							int dimCol,
							int numBluecars,
							int *bluecars, 
							int numRedcars,
							int *redcars,
							int *newBluecars);

/* C Routine to update the red cars.
   Called by RupdateredCarsCRoutine.

   Each red car moves up by one space.
   INPUTS: int dimRow:       num of rows
           int dimCol:       num of columns
		   int numBluecars:  num of bluecars
		   int *bluecars:    pointer to the bluecars
		   int numRedcars:   num of redcars
		   int *redcars:     pointer to the redcars
		   int *newRedcars: pointer to the new set of redcars

 */
void updateRedCarsCRoutine(int dimRow,
						   int dimCol,
						   int numBluecars,
						   int *bluecars, 
						   int numRedcars,
						   int *redcars,
						   int *newRedcars);

/* C Routine to update red and blue cars for multiple steps
   Called by RupdateManyStepsCarsCRoutine.

   Will alternately move blue and red cars  for numMoves number of moves
   INPUTS: int dimRow:       num of rows
           int dimCol:       num of columns
		   int numBluecars:  num of bluecars
		   int *nluecars:    pointer to the bluecars
		   int numRedcars:   num of redcars
		   int *redcars:     pointer to the redcars
		   int numMove:      num of moves to take
		   int *newBluecars: pointer to the new set of bluecars
		   int *newRedcars:  pointer to the newset of redcars

 */
void
updateManyStepsCRoutine(int dimRow,       int dimCol,
						int numBluecars,  int *bluecars,
						int numRedcars,   int *redcars,
						int numMoves,
						int *newBluecars, int *newRedcars);



/* C Routine to move single blue car and return new position.
   Called by updateBlueCarsCRoutine.
*/
int moveOneBlueCar(int oldPosition,
				   int dimRow,
				   int numBluecars,
				   int *bluecars,
				   int numRedcars,
				   int *redcars);

/* C Routine to move single red car and return new position. 
   Called by updateRedCarsCRoutine.
 */
int moveOneRedCar(int oldPosition,
				  int dimRow,
				  int dimCol,
				  int numBluecars,
				  int *bluecars,
				  int numRedcars,
				  int *redcars);


/* Check if there is currently a car in the given position. 
*/

int checkIsCarPositionTaken(int positionToCheck,
							int numCarsInArray,
							int *carArray);

