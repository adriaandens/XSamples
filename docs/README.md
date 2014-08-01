# Documentation

## Multiple .xs files

Contrary to what I thought, it's not as simple as just making a new .xs file in the top directory and run the make chain of commands. The helpful folks at #xs proposed four different ways that could/should work:

* Create subdirectories with each its own distribution and thus each a Makefile and .xs file. *Implemented [here](../weird_stuff/1_multiple_xs/)*
* Use INCLUDE: in your /main/ .xs file to include another .xs file. See http://perldoc.perl.org/perlxs.html#The-INCLUDE%3a-Keyword . Although this looks like a good method, you'll have to remove any C code in the .xs into it's own file. Not too sure how this works with headers and include statements.
* Something similar as discussed here: http://search.cpan.org/~mschwern/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker/FAQ.pod#XS where you add a BOOT: statement to the main XS file to boot all other XS files. This does mean that you need to keep track of all .xs files and have to update the main one whenever you add a new .xs file. (Seems scriptable to add these)
* "put the extra boot() funcs on the export list, then call DynaLoader::dl_* funcs yourself where the symbol name and the file name dont match"

I have yet to try them out.

## One .xs multiple XS modules

This is how it currently works. We put everything in one .XS and divide the functions by the following statement:
```
MODULE = XSamples       PACKAGE = XSamples

# Functions for XSamples module

MODULE = XSamples       PACKAGE = XSamples::Hashes

# Functions for XSamples::Hashes module

MODULE = XSamples       PACKAGE = XSamples

# And back to functions for XSamples
```

In XSamples.pm we call our XS file. (Shortened for brevity) 
```perl
package XSamples;                                                                                 
use XSLoader;
XSLoader::load(__PACKAGE__, '0.1');

1;
```

And in Hashes.pm, we just have the basic package stub:
```perl
package XSamples::Hashes;
use Exporter qw(import);

our $VERSION = '0.1';
our @EXPORT = qw(subr1 subr2); # Subroutines to export

# subr1(), subr2() are defined in our XS file.

1;
```

The only downside of this method is that we have to _use_ the XSamples module in order to load the functions of XSamples::Hashes.
```perl
use XSamples;
use XSamples::Hashes;

subr1(); # Defined by calling "use XSamples;"
```
