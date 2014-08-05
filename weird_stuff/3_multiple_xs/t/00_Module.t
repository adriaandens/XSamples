use Test::More;
use Module;

cmp_ok(just_a_function('hai'), 'eq', 'hai', 'OK');

done_testing();
