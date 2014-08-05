#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

MODULE = Module::Submodule		PACKAGE = Module::Submodule

SV* another_function(SV* arg)
	CODE:
		RETVAL = SvREFCNT_inc(arg);
	OUTPUT: RETVAL
