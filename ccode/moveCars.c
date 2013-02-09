#include "moveCars.h"


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

	// set the new blue cars to be the old blue car spaces
	for (int i=0; i<numBluecars; i++) {
		newBluecars[i]=bluecars[i];
	}
		
}



 
