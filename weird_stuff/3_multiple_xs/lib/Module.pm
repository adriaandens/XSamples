package Module;
use XSLoader;
use Exporter qw(import);

@EXPORT = qw(just_a_function);

XSLoader::load(__PACKAGE__, '0.1');

1;
