/*
  This is the file of wrappers for all the functions in order to pass the correct values to R.
 */
#include "moveCars.h"

void
RupdateBlueCarsCRoutine(int *dimRow, 
						int *dimCol,
						int *numBluecars,
						int *bluecars,
						int *numRedcars,
						int *redcars,
						int *ans)
{

	updateBlueCarsCRoutine(*dimRow,*dimCol,
						   *numBluecars,bluecars,
						   *numRedcars,redcars,ans);

}



void 
RupdateRedCarsCRoutine(int *dimRow,
					   int *dimCol,
					   int *numBluecars,
					   int *bluecars,
					   int *numRedcars,
					   int *redcars,
					   int *ans)
{

	updateRedCarsCRoutine(*dimRow,*dimCol,
						  *numBluecars,bluecars,
						  *numRedcars,redcars,ans);

}
							

void
RupdateManyStepsCRoutine(int *dimRow, int *dimCol,
						 int *numBluecars, int *bluecars,
						 int *numRedcars, int *redcars,
						 int *numMoves,
						 int *newBluecars, int *newRedcars)
{

	updateManyStepsCRoutine(*dimRow, *dimCol,
							*numBluecars, bluecars,
							*numRedcars, redcars,
							*numMoves,
							newBluecars, newRedcars);

}
