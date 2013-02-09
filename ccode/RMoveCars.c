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

	/*int newBluecars[*numBluecars];

	updateBlueCarsCRoutine(*dimRow,*dimCol,
								 *numBluecars,bluecars,
								 *numRedcars,redcars,newBluecars);
	ans = newBluecars;
	*/

	updateBlueCarsCRoutine(*dimRow,*dimCol,
						   *numBluecars,bluecars,
						   *numRedcars,redcars,ans);

}
