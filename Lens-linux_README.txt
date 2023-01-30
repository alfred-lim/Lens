This directory contains a precompiled version of Lens that runs under Linux on
x86-based machines.  Here is what you have to do to be able to run the
binaries (lens and alens). [This assumes you use the default "bash" shell and
that your Lens folder is at ~/Lens - if it's elsewhere, change the commands
below accordingly.]

1) Check the HOSTTYPE variable (by running "echo $HOSTTYPE") in a
shell/terminal.  If it reports something like "x86_64" (64-bit machine),
rename the x86_64-linux subdirectory to the value of $HOSTTYPE.  If echo
reports "HOSTTYPE: Undefined variable", then you'll need to set HOSTTYPE as an
environment variable (below).  If "echo $HOSTTYPE" reports something like
"i386" (32-bit machine), contact the instructor for access to a 32-bit version
of Lens.

2) Add the following lines to ~/.bashrc [don't add the HOSTTYPE line if it was
already set in Step 1]:

   export LENSDIR=~/Lens
   export HOSTTYPE=x86_64-linux
   export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$LENSDIR/Bin/$HOSTTYPE
   export PATH=$PATH:$LENSDIR/Bin/$HOSTTYPE

3) Exit your shell/terminal and restart another one.  You should now be able
to run lens by typing "lens" or "alens" at the shell prompt.

An offline version of the Lens manual can be read by pointing your browser at
$LENSDIR/Manual/index.html. 

David Plaut
plaut@cmu.edu
5 Jan 2017
