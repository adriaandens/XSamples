#define PERL_NO_GET_CONTEXT
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include "ppport.h"

void perl_magic_xs(pTHX_ void (*subaddr) (pTHX_ CV*), CV* cv, SV** mark) {
        PUSHMARK(mark);
        (*subaddr) (aTHX_ cv);
}

MODULE = Module		PACKAGE = Module

SV* just_a_function(SV* arg)
	CODE:
		RETVAL = SvREFCNT_inc(arg);
	OUTPUT: RETVAL

BOOT:
extern XS_EXTERNAL(boot_Module__Submodule);
perl_magic_xs(aTHX_ boot_Module__Submodule, cv, mark);
