
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
		   int *newRedcars: pointer to the newset of bluecars

 */
void updateRedCarsCRoutine(int dimRow,
						   int dimCol,
						   int numBluecars,
						   int *bluecars, 
						   int numRedcars,
						   int *redcars,
						   int *newRedcars);



/* C Routine to move single blue car and return new position.
   Called by updateBlueCarsCRoutine.
*/
int moveOneBlueCar(int oldPosition,
				   int dimCol,
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

