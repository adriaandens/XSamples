#include "EXCESS.h"

MODULE = Module2	PACKAGE = Module2

SV* another_function(SV* arg)
	CODE:
		RETVAL = arg;
	OUTPUT: RETVAL
