use Test::More;
use Module;

cmp_ok(just_a_function('hai'), 'eq', 'hai', 'OK');
cmp_ok(yet_another_function('hehe'), 'eq', 'hehe', 'OK');
cmp_ok(add(100,20), '==', 120, 'OK');

done_testing();
