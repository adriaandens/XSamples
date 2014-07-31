package XSamples::Hashes;

use XSLoader;
use Exporter qw(import);

our $VERSION = '0.1';
our @EXPORT = qw(create_and_store_key_value_in_hash); # Subroutines to export

XSLoader::load(__PACKAGE__, $VERSION);

1;
