use Test::More;
use Module;
use Module::Submodule;

cmp_ok(another_function('o hai'), 'eq', 'o hai', 'OK');

done_testing();
