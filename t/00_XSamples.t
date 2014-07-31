use strict;
use warnings;
use Test::More;
use XSamples;

cmp_ok(hello_world_using_perl(), 'eq', "Hello World!\n", "Hello World from Perl!");
cmp_ok(hello_world_using_c(), 'eq', "Hello World!\n", "Hello World from C!");

done_testing();
