use strict;
use warnings;
use Test::More;
use XSamples::Hashes;

my $hashref = create_and_store_key_value_in_hash("I'm the key", "And I'm the value!");
my @keys_hashref = keys %$hashref;

cmp_ok(scalar(@keys_hashref), '==', 1, 'One key found. OK!');
cmp_ok($keys_hashref[0], 'eq', q{I'm the key}, 'Correct key value');
cmp_ok($hashref->{"I'm the key"}, 'eq', q{And I'm the value!}, 'Correct value of value!');

done_testing();
