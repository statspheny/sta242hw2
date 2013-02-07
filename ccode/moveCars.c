#include "moveCars.h"


/* updateBlueCarsCRoutine: This function updates the blue cars in a C routine
   Each blue car moves up by one space.
   INPUTS: int dimRow:      num of rows
           int dimCol:      num of columns
	   int numBluecars: num of bluecars
	   int *bluecars:   pointer to the bluecars
	   int numRedcars:  num of redcars
	   int *redcars:    pointer to the redcars
   OUTPUTS: *newBluecars: pointer to the location of the new place for bluecars
*/
int
*updateBlueCarsCRoutine(int dimRow, 
			int dimCol,
			int numBluecars,
			int *bluecars, 
			int numRedcars,
			int *redcars) 
	   
{
  int *newBluecars = *bluecars;
  return(*newBluecars);
}
