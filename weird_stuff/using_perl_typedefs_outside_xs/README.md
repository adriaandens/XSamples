# Using Perl typedefs outside XS

This was a quick test to see what headers are required when doing work in functions with scalar values and the lot. Conclusion, you need three headers: perl.h, EXTERN.h and XSUB.h in order to make it compile successfully. While doing this I also added some extra statements to see what happens when we don't increment the value of retval to two (OUTPUT decrements it). It seems that it doesn't crash right away, but only after being called a few times. (I made a loop in the test file, to check this)
