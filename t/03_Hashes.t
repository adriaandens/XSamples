use strict;
use warnings;
use Test::More;
use XSamples;
use XSamples::Hashes;
use Devel::Peek qw(Dump);

# Test 1
{
	my $key = q{I'm the key};
	my $value = q{And I'm the value!};
	foreach(0..9) {
		my $hashref = create_and_store_key_value_in_hash($key, $value);
		my @keys_hashref = keys %$hashref;

		cmp_ok(scalar(@keys_hashref), '==', 1, 'One key found. OK!');
		cmp_ok($keys_hashref[0], 'eq', q{I'm the key}, 'Correct key value');
		cmp_ok($hashref->{"I'm the key"}, 'eq', q{And I'm the value!}, 'Correct value of value!');
	}
	my $hashref = create_and_store_key_value_in_hash($key, $value);
}
# Test 2 and 3

{
	my %hash = (hai => 'hoi', 'hie' => 'hoe');
	add_key_value_to_hash(\%hash, 'hehe', 'ghehe');
	cmp_ok(keys %hash, '==', 3, 'Three keys');
	cmp_ok($hash{hehe}, 'eq', 'ghehe', 'OK');

	# Add 10 keys
	foreach(0..9) {
		add_key_value_to_hash(\%hash, 'oyooo' . $_, $_);
	}
	cmp_ok(keys %hash, '==', 13, 'Thirteen keys');

	my $key = 'ffsdfs'; my $value = 'dgfgfd';
	add_key_value_to_hash(\%hash, $key, $value);
	cmp_ok(keys %hash, '==', 14, 'Fourteen keys');
}

# Test 4
{
	my %hash = (one => 'two', two => 'three', three => 'four', four => 'five', five => 'six', six => 'seven', seven => 'eight', eight => 'nine', nine => 'ten', ten => 'eleven');

	# Add key to hash
	add_key_value_to_hash(\%hash, 'eleven', 'twelve');
	cmp_ok($hash{eleven}, 'eq', 'twelve', 'OK');

	# Delete a key
	delete_and_discard_key_from_hash(\%hash, 'three');
	
	# Delete another key but retrieve the deleted key
	my $value_of_eight = delete_and_return_key_from_hash(\%hash, 'eight');
	cmp_ok($value_of_eight, 'eq', 'nine', 'OK');

	# Does a key exist?
	ok(key_exists_in_hash(\%hash, 'two'), 'OK');

	# Get value of key
	my $value_of_six = get_value_for_key_in_hash(\%hash, 'six');
	cmp_ok($value_of_six, 'eq', 'seven', 'OK');

	# Get number of keys
	cmp_ok(get_number_of_keys_in_hash(\%hash), '==', 9, 'OK');

	my $array_ref = get_list_of_keys(\%hash);
	cmp_ok(@$array_ref, '==', 9, 'OK');
}

done_testing();
