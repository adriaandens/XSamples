use Test::More;
use Module2;

cmp_ok(another_function("Hehe"), 'eq', 'Hehe', 'It actually works!');

done_testing();
