#include "EXCESS.h"

void perl_magic_xs(pTHX_ void (*subaddr) (pTHX_ CV*), CV* cv, SV** mark) {
        dSP;
        PUSHMARK(mark);
        (*subaddr) (aTHX_ cv);
        PUTBACK;
}

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

BOOT:
extern XS(boot_XSamples__Hashes);
perl_magic_xs(aTHX_ boot_XSamples__Hashes, cv, mark);
