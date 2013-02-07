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
    /* call updateBlueCarsCRoutine with the arguments */
    *ans = updateBlueCarsCRoutine(*dimRow,*dimCol,
				*numBluecars,*bluecars,
				*numRedcars,*redcars)
}
