package XSamples;

use XSLoader;
use Exporter qw(import);

our $VERSION = '0.1';
our @EXPORT = qw(hello_world_using_perl hello_world_using_c); # Subroutines to export

XSLoader::load(__PACKAGE__, $VERSION);

1;
