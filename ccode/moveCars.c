////////////////////////////////////////////////////////////////////////////////
// This file contains the following functions to move the cars
// void updateBlueCarsCRoutine
// void updateRedCarsCRoutine
// int moveOneBlueCar
// int moveOneRedCar
// int checkIsCarPositionTake

#include "moveCars.h"
#include <stdbool.h>




////////////////////////////////////////////////////////////////////////////////
// Beginning of code

  
/*  The function will change the values inside newBluecars to reflect
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


/* This function will update all the redcars and place the new
   locations of the cars in the array newRedcars.
*/

void
updateRedCarsCRoutine(int dimRow, 
					  int dimCol,
					  int numBluecars,
					  int *bluecars,  // pass in reference to bluecars
					  int numRedcars,
					  int *redcars,   // pass in reference to redcars
					  int *newRedcars)  // reference to place in memory for blue cars
	
{

	for(int i=0; i<numRedcars; i++) {
		newRedcars[i] = moveOneRedCar(redcars[i],dimCol,
										numBluecars,bluecars,numRedcars,redcars);
	}

	
}



/* function to move a single blue car according to the rules.
   This function returns the new location of the car as an integer.
 */
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



/* function to move a single red car according to the rules.  This
   function returns the new location of the car as an integer. 
   This function is called by updateRedCarsCRoutine.
*/
int
moveOneRedCar(int oldPosition,
			  int dimRow,
			  int dimCol,
			  int numBluecars,
			  int *bluecars,
			  int numRedcars,
			  int *redcars) 
{
	int newPosition;
	
	// move the car one space to the right
	newPosition = oldPosition + dimCol;
	
	// if the car position is at the right-most row, cycle back to the left.
	// do this by subtracting if total position is greater than than
	//the total size of the grid.

	int totalSize = dimRow * dimCol;
	if( (newPosition > totalSize) {
		newPosition = newPosition - totalSize;
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

