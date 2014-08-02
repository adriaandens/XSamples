#include "Handy_functions.h"

MODULE = Module		PACKAGE = Module

int add(int a, int b)
	CODE:
		RETVAL = add(a, b);
	OUTPUT: RETVAL

SV* yet_another_function(SV* arg)
	CODE:
		RETVAL = SvREFCNT_inc(arg);
	OUTPUT: RETVAL
