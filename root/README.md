# cannon-env/root: System and shell startup files

When you run the `copy-cannon-env` script, these files will be copied to your home directory, which is referred to as `~` or `$HOME`.

## Files that should not be modified

These files contain defaults that are specific to Cannon and should not be modified.

`.login`
  - System startup file.  Executes only at initial login.

`.bash_profile`
  - System startup file.  It applies the settings in the `.bashrc` file, and also adds your `~/bin` folder to the search path.

`.bashrc`
  - System startup file.  Applies default system settings, plus some commonly-used customizations.  Also applies the settings that you have defined in your`.my_personal_settings` file.

## Files that you can customize

You can add your own Cannon environment customizations to these files:

`.my_personal_settings`
  - System statup file.  You can add aliases and other customizations here. It is good practice to add your own customizations here instead of to the `.bashrc` file.

`.Xresources`
  - X11 configuration file.  Contains settings for the "look and feel" of xterm windows and other X11 programs.  If you make any changes to this file, you can apply them by typing `xrdb ~/.Xresources`.

`.emacs`
  - Configuration file for the Emacs editor.  You can add your own emacs customizations here.

`.tmux-conf`
  - Configuration file for tmux, the Terminal Multiplexer.  Tmux allows you to split a single Unix session into multiple processes in multiple windows.  For more information, please see:
    - [A quick and easy guide to Tmux](https://www.hamvocke.com/blog/a-quick-and-easy-guide-to-tmux/)
    - [Tmux cheat sheet](https://tmuxcheatsheet.com/)
  
 