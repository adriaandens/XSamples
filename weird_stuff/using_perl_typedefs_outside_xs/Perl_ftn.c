#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include<stdio.h>
#include<stdlib.h>

char* refcount_to_string(char* string, int refcount) {
	char* buf = calloc(100, sizeof(char));
	snprintf(buf, sizeof(char)*100, "%s %d\n", string, refcount);
	return buf;
} 

void append_to_log_file(char* logline) {
	FILE* fp; 
	fp = fopen("logging_refs.txt", "a");
	fprintf(fp, "%s", logline);
	fclose(fp);
	free(logline);
}

SV* call_ftn(SV* arg) {
	append_to_log_file(refcount_to_string("Refcount 3 (inside the callee):", SvREFCNT(arg)));
	FILE* fp;
	fp = fopen("print_scalar.txt", "w");
	fprintf(fp, "%s", SvPV_nolen(arg));
	fclose(fp);
	SvREFCNT_dec(arg);
	append_to_log_file(refcount_to_string("Refcount 4 (inside the callee, after dec):", SvREFCNT(arg)));
	return arg;
}
