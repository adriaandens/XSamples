#include "EXCESS.h"

MODULE = Module1	PACKAGE = Module1

SV* just_a_function(SV* arg)
	CODE:
		RETVAL = arg;
	OUTPUT: RETVAL
