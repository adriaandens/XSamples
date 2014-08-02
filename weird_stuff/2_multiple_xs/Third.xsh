#include "Handy_functions.h"

MODULE = Module		PACKAGE = Module

int add(int a, int b)

SV* yet_another_function(SV* arg)
	CODE:
		RETVAL = arg;
	OUTPUT: RETVAL
