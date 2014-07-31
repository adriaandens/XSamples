#include "EXCESS.h"

MODULE = XSamples::Hashes		PACKAGE = XSamples::Hashes

HV* create_and_store_key_value_in_hash(SV* key, SV* value)
	CODE:
		HV* hash = newHV();
		hv_store_ent(hash, key, value, 0);
		RETVAL = hash;
	OUTPUT: RETVAL
