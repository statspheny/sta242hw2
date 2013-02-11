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
							
