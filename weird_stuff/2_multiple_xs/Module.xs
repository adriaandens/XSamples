#define PERL_NO_GET_CONTEXT
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include "ppport.h"

MODULE = Module		PACKAGE = Module

SV* just_a_function(SV* arg)
	CODE:
		RETVAL = SvREFCNT_inc(arg);
	OUTPUT: RETVAL

INCLUDE: Second.xsh

INCLUDE: Third.xsh
