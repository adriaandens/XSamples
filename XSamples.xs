#include "EXCESS.h"

int ftn(int a, int b) {
	int c = a + b;
	return c;
}

MODULE = XSamples	PACKAGE = XSamples

SV* hello_world_using_perl()
	CODE:
		RETVAL = newSVpvs("Hello World!\n");
	OUTPUT: RETVAL

char* hello_world_using_c()
	CODE:
		char* hello = "Hello World!\n";
		RETVAL = hello;
	OUTPUT: RETVAL

MODULE = XSamples	PACKAGE = XSamples::Hashes

HV* create_and_store_key_value_in_hash(SV* key, SV* value)
	CODE:
		HV* hash = newHV();
		hv_store_ent(hash, key, value, 0);
		RETVAL = hash;
	OUTPUT: RETVAL
