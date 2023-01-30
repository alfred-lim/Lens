This directory contains a precompiled version of Lens that runs under Mac OS X
(64-bit).  Here is what you have to do to be able to run the binaries (lens
and alens).

1) Open a Terminal and run "which X".  If it returns a full pathname
(something like "/opt/X11/bin/X") you can skip this step. (NOTE: if you later
run into a problem where it can't load /usr/X11/lib/libX11.6.dylib, you should
install XQuartz anyway.)  Otherwise, you'll need to install an X-windows
server.  To do this, download the latest version of XQuartz from

  https://www.xquartz.org

or download

  http://ni.cmu.edu/~plaut/Lens/XQuartz-2.8.4.pkg

Double-click the pkg file to open and run the installer.  When it finishes,
you'll need to log out of your laptop account and log back in (this may happen
automatically). Note that rebooting your laptop will also work but is not
necessary, whereas just exiting and restarting the terminal is not enough; if
you get an error message like the following:

    FATAL ERROR: Tk_Init failed: no display name and no $DISPLAY environment variable

you need to log out of your laptop and log back in (or reboot).

2) If the "Lens" folder is not on your desktop, edit bash_profile.txt and
modify the setting for LENSDIR to correspond to its location.  Be sure to save
the file as a plain text file.

3) Open a Terminal and navigate to your Lens folder (e.g., "cd Desktop/Lens").
If the titlebar of the Terminal window contains "bash", run this command:

   cat bash_profile.txt >> ~/.bash_profile

If, instead, it contains "zsh", run this:

   cat bash_profile.txt >> ~/.zshrc

These modifiy start-up scripts so the settings will be present whenever you
open a Terminal (bash or zsh).  If you get a permissions error for ~/.zshrc,
do this first

   mv ~/.zshrc ~/.zshrc.orig
   cp ~/.zshrc.orig ~/.zshrc

and try the "cat" line for .zshrc above again.  If you ever change your default
shell, you'll need to repeat this step for the new shell.

4) Exit the Terminal app---don't just close the current window, exit entirely
out of the app using "Exit" from the menu---and then re-open a Terminal
window.  If you now run "which lens" in the Terminal, it should say something like

   /Users/plaut/Desktop/Lens/Bin/x86_64/lens

(with your own username, of course).  If it says nothing, something has gone
wrong.....:-( 

RUNNING LENS

You can run Lens by double-clicking on the "lens" executable in
Lens/Bin/x86_64/.  The first time you do this, lens will be slow to start
because the X window system has to be started first.  Then macOSX will complain
that lens is from an unknown developer.  Click OK (or Open or Cancel, but NOT
Move to Trash), then go to "Security & Privacy" (under Settings), and allow
"lens" to be run (by clicking "Allow Anyway").  You'll then get a second
notification about "libtcl8.5.dylib" (a local library that lens uses).  Click
"Open" or "Cancel" (NOT "Move to Trash"), and then click "Allow Anyway" under
Security & Privacy. You may have to do this second part (for libtcl8.5.dylib)
more than once.  Keep exiting and restarting lens, and clicking either "Open"
or "Allow Anyway" (*never* "Move to Trash") until lens opens cleanly with no
security pop-ups.

When you open Lens by double-clicking on it, Lens will open its own terminal
along with the main console.  To open a script, you'll have to navigate to the
appropriate folder using the directory/file window in Lens.

You can also run Lens by opening a Terminal, using the "cd" command to
navigate to the folder containing your Lens script files, and running "lens"
(or run "lens network.in" if network.in is the name of your script).  This has
the advantage that you won't need to navigate to your folder from within Lens.

An offline version of the Lens manual can be read by pointing your browser at
Lens/Manual/index.html.

One final Mac-related note: Lens uses a right-click to display certain types of
information, but the standard method of using Control-click to generate a
right-click may not work.  Instead, you may have to click with two fingers
together on the trackpad (and make sure this method is enabled in System
Preferences->Trackpad).

David Plaut
plaut@cmu.edu
19 Jan 2023
