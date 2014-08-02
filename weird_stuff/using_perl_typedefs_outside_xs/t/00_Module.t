use Test::More;
use Module;

foreach(0..9) {
	cmp_ok(just_a_function("A simple string!"), "eq", "A simple string!", "OK");
	open(FH, '>> logging_refs.txt');print FH "-----------\n";close(FH);
}

done_testing();
