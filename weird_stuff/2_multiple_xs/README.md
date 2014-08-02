# Multiple XS - Implementation 2

See [the main docs](../../docs/README.md) for the big picture.

## The idea

Perl XS provides the INCLUDE: keyword. Let's see what we can do with that.

## Teh results

As a starter, rename the extension of all secondary .xs files to .xsh. That way, they don't get transformed to a .c file and compiled to .o files. Then just put the following statement in the .xs file:
```
INCLUDE: Hashes.xsh
```

You can have #include en #define statements in your .xsh files but you can't have C functions in it because - like the name says - it just includes the file at that line. 


You do end up with the same problem as I had before. Everything gets compiled in one bundle, so when using XSamples::Hashes, you need to _use_ the base module in order to dynamically load the XS subroutines of the Hashes submodule. On the upside, you can split the functions belonging to submodules in their own file (including the MODULE= en PACKAGE= statements).
