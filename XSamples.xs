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

SV* create_and_store_key_value_in_hash(SV* key, SV* value)
	CODE:
		HV* hash = newHV();
		hv_store_ent(hash, key, SvREFCNT_inc(value), 0);
		RETVAL = newRV_noinc((SV*)hash);
	OUTPUT: RETVAL

void add_key_value_to_hash(HV* hash, SV* key, SV* value)
	CODE:
		hv_store_ent(hash, key, SvREFCNT_inc(value), 0);

SV* delete_and_return_key_from_hash(HV* hash, SV* key)
	CODE:
		RETVAL = SvREFCNT_inc(hv_delete_ent(hash, key, 0, 0));
	OUTPUT: RETVAL
		
void delete_and_discard_key_from_hash(HV* hash, SV* key)
	CODE:
		hv_delete_ent(hash, key, G_DISCARD, 0);

SV* key_exists_in_hash(HV* hash, SV* key)
	CODE:
		SV* returnvalue = newSViv((int) hv_exists_ent(hash, key, 0));
		RETVAL = returnvalue;
	OUTPUT: RETVAL

SV* get_value_for_key_in_hash(HV* hash, SV* key)
	CODE:
		HE* hashentry = hv_fetch_ent(hash, key, NULL, 0);
		RETVAL = SvREFCNT_inc(HeVAL(hashentry)); /** Get the value of the hashentry **/
	OUTPUT: RETVAL

SV* get_number_of_keys_in_hash(HV* hash)
	CODE:
		SV* number_of_keys = newSViv(HvUSEDKEYS(hash));
		RETVAL = SvREFCNT_inc(number_of_keys);
	OUTPUT: RETVAL

SV* get_list_of_keys(HV* hash)
	CODE:
		AV* keys = newAV();
		SV* sv; char* key; I32 klen; /** Used in the loop **/

		hv_iterinit(hash);
		while((sv = hv_iternextsv(hash, &key, &klen)))
			av_push(keys, newSVpv(key, klen));

		/** AV*'s and HV*'s are actually SV*'s **/
		/** The more you know... **/
		RETVAL = newRV_noinc((SV*) keys);
	OUTPUT: RETVAL
