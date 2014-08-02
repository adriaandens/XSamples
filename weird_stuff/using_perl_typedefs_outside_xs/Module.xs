#define PERL_NO_GET_CONTEXT
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include "ppport.h"
#include "Perl_ftn.h"

MODULE = Module 	PACKAGE = Module

SV* just_a_function(SV* arg)
	CODE:
		append_to_log_file(refcount_to_string("Refcount 1 (entering sub called from Perl):", SvREFCNT(arg)));
		SvREFCNT_inc(arg);
		append_to_log_file(refcount_to_string("Refcount 2 (increment just before call which uses the SV*):", SvREFCNT(arg)));
		SV* a = call_ftn(arg);
		append_to_log_file(refcount_to_string("Refcount 5 (after calling the function):", SvREFCNT(arg)));
		append_to_log_file(refcount_to_string("Refcount 6 (refcount of a):", SvREFCNT(a)));
		RETVAL = SvREFCNT_inc(a);
		append_to_log_file(refcount_to_string("Refcount 7 (increment a):", SvREFCNT(a)));
		append_to_log_file(refcount_to_string("Refcount 8 (arg has also incremented):", SvREFCNT(arg)));
	/** Return with refcount 2 **/
	OUTPUT: RETVAL
