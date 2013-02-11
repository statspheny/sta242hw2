#include "moveCars.h"
#include <stdbool.h>


/* updateBlueCarsCRoutine: This function updates the blue cars in a C routine
   Each blue car moves up by one space.
   INPUTS: int dimRow:       num of rows
           int dimCol:       num of columns
		   int numBluecars:  num of bluecars
		   int *bluecars:    pointer to the bluecars
		   int numRedcars:   num of redcars
		   int *redcars:     pointer to the redcars
		   int *newBluecars: pointer to the newset of bluecars
  
  The function will change the values inside newBluecars to reflect
the changes of the new blue cars.
*/
void
updateBlueCarsCRoutine(int dimRow, 
					   int dimCol,
					   int numBluecars,
					   int *bluecars,  // pass in reference to bluecars
					   int numRedcars,
					   int *redcars,   // pass in reference to redcars
					   int *newBluecars)  // reference to place in memory for blue cars
	   
{

	/*  Inital try using just to make sure that values can be moved
	// set the new blue cars to be the old blue car spaces
	for (int i=0; i<numBluecars; i++) {
		newBluecars[i]=bluecars[i];
	}
	*/


	for(int i=0; i<numBluecars; i++) {
		newBluecars[i] = moveOneBlueCar(bluecars[i],dimCol,
										numBluecars,bluecars,numRedcars,redcars);
	}

	
}


int
moveOneBlueCar(int oldPosition,
			   int dimCol,
			   int numBluecars,
			   int *bluecars,
			   int numRedcars,
			   int *redcars) 
{
	int newPosition;

	// move the car up one space
	newPosition = oldPosition-1;

	// if the car is at the top row, then cycle and move car to next
	if( (newPosition % dimCol) == 0) {
		newPosition = newPosition + dimCol;
	}

	// if the new position is taken by a car, then set it to the old
	// position.

	// check blue spaces
	if( checkIsCarPositionTaken(newPosition, numBluecars, bluecars) ) {
		newPosition = oldPosition;
	}

	// check red spaces
	if( checkIsCarPositionTaken(newPosition, numRedcars, redcars) ) {
		newPosition = oldPosition;
	}

	return(newPosition);
}


/* checkIsCarPositionTaken:
   This function checks to see if there is currently a car in the position.
*/
int
checkIsCarPositionTaken(int positionToCheck,
						int numCarsInArray,
						int *carArray)
{

	/* loop through all the cars in the array, and return TRUE if any
	   of them is in the position we want.  If none are taken, then
	   return FALSE 
	*/ 
	for(int i; i<numCarsInArray; i++) {
		if(positionToCheck==carArray[i]) {
			return(true);
		}
	}

	return(false);

}
