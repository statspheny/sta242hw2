
/***************************************************************/
/* This file contains the following functions to move the cars */
/* void updateBlueCarsCRoutine								   */
/* void updateRedCarsCRoutine								   */
/* int moveOneBlueCar										   */
/* int moveOneRedCar										   */
/* int checkIsCarPositionTake								   */
/* void setArray											   */
/* void updateManyStepsCRoutine								   */
/***************************************************************/

#include "moveCars.h"
#include <stdbool.h>

 /**************************************/
 /* header files for private functions */
 /**************************************/

void
setArray(int arraySize, int *arrayToUpdate, int *arrayWithValues);


 /*********************/
 /* Beginning of code */
 /*********************/

  
/***************************************************************************/
/*   The function will change the values inside newBluecars to reflect	   */
/* 	the changes of the new blue cars.									   */
/***************************************************************************/
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
		newBluecars[i] = moveOneBlueCar(bluecars[i],dimRow,
										numBluecars,bluecars,numRedcars,redcars);
	}

	
}


 /***************************************************************/
 /* This function will update all the redcars and place the new */
 /* locations of the cars in the array newRedcars.			    */
 /***************************************************************/
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
		newRedcars[i] = moveOneRedCar(redcars[i],dimRow,dimCol,
										numBluecars,bluecars,numRedcars,redcars);
	}

	
}



 /**********************************************************************/
 /* function to move a single blue car according to the rules.		   */
 /*   This function returns the new location of the car as an integer. */
 /**********************************************************************/

int
moveOneBlueCar(int oldPosition,
			   int dimRow,
			   int numBluecars,
			   int *bluecars,
			   int numRedcars,
			   int *redcars) 
{
	int newPosition;

	// move the car up one space
	newPosition = oldPosition-1;

	// if the car is at the top row, then cycle and move car to next
	if( (newPosition % dimRow) == 0) {
		newPosition = newPosition + dimRow;
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



 /*******************************************************************/
 /* function to move a single red car according to the rules.  This */
 /* function returns the new location of the car as an integer.     */
 /* This function is called by updateRedCarsCRoutine.			    */
 /*******************************************************************/

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
	newPosition = oldPosition + dimRow;
	
	// if the car position is at the right-most row, cycle back to the left.
	// do this by subtracting if total position is greater than than
	//the total size of the grid.

	int totalSize = dimRow * dimCol;
	if( newPosition > totalSize ) {
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


/****************************************************************************/
/*  checkIsCarPositionTaken:											    */
/* This function checks to see if there is currently a car in the position. */
/****************************************************************************/

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

  /**********************************************************************/
  /* setArray: This is a helper function that is used to set the values */
  /*  from one array to another array.								    */
  /**********************************************************************/
void 
setArray(int arraySize, int *arrayToUpdate, int *arrayWithValues) 
{ 
	for(int i=0; i < arraySize; i++) {
		arrayToUpdate[i] = arrayWithValues[i];
	}

}




/* updateManyStepsCRoutine: This function will just loop over
   updateBlueCarsCRoutine and updateRedCarsCRoutine for numsteps
   times.  It will start with the bluecars first each time.
*/

void
updateManyStepsCRoutine(int dimRow, int dimCol,
						int numBluecars, int *bluecars,
						int numRedcars, int *redcars,
						int numMoves,
						int *newBluecars, int *newRedcars)
{

	// At each time step, the previous car locations will be stored at
	// tempBluecars and tempRedcars, and the newly updated locations
	// will be stored at newBluecars and newRedcars

	int tempBluecars[numBluecars], tempRedcars[numRedcars];

	// initialize all the car arrays
	setArray(numBluecars, newBluecars, bluecars);
	setArray(numRedcars, newRedcars, redcars);
	setArray(numBluecars, tempBluecars, bluecars);
	setArray(numRedcars, tempRedcars, redcars);

	// loop over numMoves times
	for(int i=0; i < numMoves; i++) {

		// if i is even, so it's an odd time step (because i starts at 0 not 1)
		// update the blue cars
		if( (i % 2) == 0 ) {

			updateBlueCarsCRoutine(dimRow, dimCol, numBluecars, tempBluecars,
								   numRedcars, tempRedcars, newBluecars);
			
			setArray(numBluecars, tempBluecars, newBluecars);
		}
		// i is not even, update the red cars
		else {
			
			updateRedCarsCRoutine(dimRow, dimCol, numBluecars, tempBluecars,
								  numRedcars, tempRedcars, newRedcars);

			setArray(numRedcars, tempRedcars, newRedcars);
		}

	} 

	// finish!

}
