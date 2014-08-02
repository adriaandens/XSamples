MODULE = Module		PACKAGE = Module::Submodule

SV* another_function(SV* arg)
	CODE:
		RETVAL = arg;
	OUTPUT: RETVAL
