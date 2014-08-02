MODULE = Module		PACKAGE = Module::Submodule

SV* another_function(SV* arg)
	CODE:
		RETVAL = SvREFCNT_inc(arg);
	OUTPUT: RETVAL
