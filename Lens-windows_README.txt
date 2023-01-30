Lens under Windows does not handle pathnames with spaces well.  A good way to
avoid this problem (if you have Administrator privileges) is to place the Lens
folder at the top level of your main drive (e.g., C:\Lens).  This document
assumes that you've unzipped the contents of the Lens-windows.zip file and
moved the resulting Lens folder to this location.  If you place it somewhere
else you should adjust the pathnames below accordingly.

In addition to this file (README.rtf) you should find the following
files/subfolders:

        Bin\            executable programs
        Examples\       example networks
        Manual\         user manual (html)
        Src\            source code
        Commands\       documentation of commands
        Makefile        makefile for compilation
        Obj\            object files produced by compilation
        TclTk\          interface files

Inside the Bin folder are two executable files, lens and alens (don't worry
about the difference between them at this point - you can just use lens for
the time being).


To be able to run Lens, you need to add a new environment variable LENSDIR,
and add the Bin folder to your search path.  Here's how you do that.

Search for "Edit environment variables" and open the result.  Under the top
panel (User variables), click on the "New" button.  Type LENSDIR (all caps) in
the "Variable name" text box, and the full path to the Lens folder (without
the \Bin) in the value text box.

        Variable name   LENSDIR
        Variable value  C:\Lens        (or wherever you put the Lens folder)

Click OK.  Then, also in the top panel, select the existing "Path" variable
and click "Edit". Then click "New" in the pop-up and add the following on a
new line

        %LENSDIR%\Bin

Then click OK, and OK again.


To run the Lens executable on Windows

You can run Lens by double-clicking on the lens executable in the Bin folder.
Alternatively, you can open a Command Prompt, cd (change directory) to a
particular folder, and type "lens".  This latter method is often preferable
when you want to be able to load a network script from a particular folder
(e.g., the Examples folder).

Lens will now open with two windows: the console and the Lens main window
(along with a Command Prompt window, which you can ignore, if you started Lens
by double-clicking).  For information on lens.exe and alens.exe, and the
general Lens manual, point your browser at index.html inside the Manual folder
visit or, alternatively, visit

        https://ni.cmu.edu/~plaut/Lens/

The Lens console has scripts to execute the following commands:

        ls                      list directory contents as in unix shell
        ls-l                    lists contents with permissions and other file details
                                   (note there is no space between ls-l)
        dos                     redirects the command to the DOS shell 
        dir                     executes listing of directory as DOS command
        rmdir <directory name>  removes directory specified
        rm <file names>         removes files specified; executed as unix shell command
        del <file name>         removes file specified; executed as dos command
        mkdir <directory name>  makes new directory specified
        touch <file names>      creates files specified
        cat <file name>         flushes file contents to the lens console
        more <file name>        flushes file contents piped through operator 'more' 
                                  (page by page appearance); to terminate flow press 'q';
                                   to see next page press 'tab or enter'

Note: This zip file also contains source files.  If you wish to add in your
own code and recompile Lens, you will need to get Cygwin installed with X11
and gcc, as described in the manual.  Contact the instructor for more
information.

David Plaut
24 Jun 2022

