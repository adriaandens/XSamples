use Test::More;
use Module1;

cmp_ok(just_a_function("O hai"), "eq", "O hai", "OK!");

done_testing();
