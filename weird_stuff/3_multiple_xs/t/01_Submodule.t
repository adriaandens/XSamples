use Test::More;
use Module; # We need this because this bootstraps all XS subroutines
use Module::Submodule;

cmp_ok(another_function('hehe'), 'eq', 'hehe', 'OK');

done_testing();
