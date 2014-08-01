package Module2;
use XSLoader;
use Exporter qw(import);

@EXPORT = qw(another_function);

XSLoader::load(__PACKAGE__, '0.1');

1;
