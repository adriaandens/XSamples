#include "EXCESS.h"

MODULE = XSamples	PACKAGE=XSamples

SV* hello_world_using_perl()
	CODE:
		RETVAL = newSVpvs("Hello World!\n");
	OUTPUT: RETVAL

char* hello_world_using_c()
	CODE:
		char* hello = "Hello World!\n";
		RETVAL = hello;
	OUTPUT: RETVAL
