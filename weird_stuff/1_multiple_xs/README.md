# Multiple XS - Implementation 1

See [the main docs](../../docs/README.md) for the big picture.

## The idea

Because Makefile.PL will run every Makefile.PL it finds in subdirectories, we can make a subdirectory containing another Module with it's own lib/, t/, modules and XS files! Running make will put all modules in the same blib/ making it available to the tests in the main directory. Although there are a lot of extra files for the developer, this process is easy for the user because he can just install it without additional commands and use it without additional commands.

## The output

Running Makefile.PL indeed shows that the Makefile.PL is being found the main Makefile.PL in the top directory:
```
$ cd 1_multiple_xs/
$ perl Makefile.PL 
Writing Makefile for Module2
Writing MYMETA.yml and MYMETA.json
Writing Makefile for Module1
Writing MYMETA.yml and MYMETA.json
```

When running make, we can see that the two XS files are being treated the same, resulting in two bundles, one for each Module in our distribution. For clarity I added some comments and extra whitelines.
```
$ make
# Copying it to blib/
cp lib/Module1.pm blib/lib/Module1.pm
cp lib/Module2.pm ../blib/lib/Module2.pm


# Making the module in the subdirectory
/usr/bin/perl /System/Library/Perl/5.16/ExtUtils/xsubpp -noprototypes -typemap /System/Library/Perl/5.16/ExtUtils/typemap  SecondXS.xs > SecondXS.xsc && mv SecondXS.xsc SecondXS.c
cc -c   -arch x86_64 -arch i386 -g -pipe -fno-common -DPERL_DARWIN -fno-strict-aliasing -fstack-protector -I/usr/local/include -Os   -DVERSION=\"0.1\" -DXS_VERSION=\"0.1\"  "-I/System/Library/Perl/5.16/darwin-thread-multi-2level/CORE"   SecondXS.c
Running Mkbootstrap for Module2 ()
chmod 644 Module2.bs
rm -f ../blib/arch/auto/Module2/Module2.bundle
cc -mmacosx-version-min=10.9  -arch x86_64 -arch i386 -bundle -undefined dynamic_lookup -L/usr/local/lib -fstack-protector SecondXS.o  -o ../blib/arch/auto/Module2/Module2.bundle 	\
	     	\
	  
chmod 755 ../blib/arch/auto/Module2/Module2.bundle
cp Module2.bs ../blib/arch/auto/Module2/Module2.bs
chmod 644 ../blib/arch/auto/Module2/Module2.bs


# Making Module1
/usr/bin/perl /System/Library/Perl/5.16/ExtUtils/xsubpp -noprototypes -typemap /System/Library/Perl/5.16/ExtUtils/typemap  Main.xs > Main.xsc && mv Main.xsc Main.c
cc -c   -arch x86_64 -arch i386 -g -pipe -fno-common -DPERL_DARWIN -fno-strict-aliasing -fstack-protector -I/usr/local/include -Os   -DVERSION=\"0.1\" -DXS_VERSION=\"0.1\"  "-I/System/Library/Perl/5.16/darwin-thread-multi-2level/CORE"   Main.c
Running Mkbootstrap for Module1 ()
chmod 644 Module1.bs
rm -f blib/arch/auto/Module1/Module1.bundle
cc -mmacosx-version-min=10.9  -arch x86_64 -arch i386 -bundle -undefined dynamic_lookup -L/usr/local/lib -fstack-protector Main.o  -o blib/arch/auto/Module1/Module1.bundle 	\
	     	\
	  
chmod 755 blib/arch/auto/Module1/Module1.bundle
cp Module1.bs blib/arch/auto/Module1/Module1.bs
chmod 644 blib/arch/auto/Module1/Module1.bs
```

Running tests in the top directory shows us that the two Modules are found and the subroutines we added in XS are being executed correctly:
```
$ make test
PERL_DL_NONLAZY=1 /usr/bin/perl "-MExtUtils::Command::MM" "-e" "test_harness(0, 'blib/lib', 'blib/arch')" t/*.t
t/00_Module1.t .. ok   
t/01_Module2.t .. ok   
All tests successful.
Files=2, Tests=2,  0 wallclock secs ( 0.04 usr  0.01 sys +  0.06 cusr  0.02 csys =  0.13 CPU)
Result: PASS
No tests defined for Module2 extension.
```
