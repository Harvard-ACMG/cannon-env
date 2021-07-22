# cannon-env/bin: Convenience scripts

When you run the `copy-cannon-env` script, the following utility scripts and files will be copied to your `$HOME/bin` folder.

Because `$HOME/bin` gets automatically added to your `$PATH` environment variable at login, the Bash shell will look for these files in `$HOME/bin`.  Therefore, you can run these scripts from any folder in your Cannon disk space without having to type the full path name.

## Description

`awake.sh`
  - Script that you can use to keep interactive sessions from hanging.
  
`cmake-mode.el`
`yaml-mode.el`
`ncl.el`
  - Adds customizations to Emacs for CMake, YAML, and NCL files.
  
`interactive`
`interactive_gchp`
`interactive_openmp`
`interactive_python`
  - Convenience scripts that will start interactive sessions on Cannon,
     - For GEOS-Chem Classic, use `interactive_openmp`.
     - For GCHP, use `interactive_gchp`.
     - For Python with port forwarding, use `interactive_python`.

`isCoards`
  - Perl script that checks if a netCDF file is [COARDS-compliant](http://wiki.seas.harvard.edu/geos-chem/index.php/The_COARDS_netCDF_conventions_for_earth_science_data). This is a requirement for GEOS-Chem and GCHP input data files.

`job_depend.pl`
  - Convenience script that allows you to submit multiple Slurm jobs as job dependencies.  Each successive job will not start until the previous job finishes.

`jobinfo`
`jobstats`
  - Scripts that you can use to check the status of jobs running on Cannon.  [Follow this link](https://github.com/Harvard-ACMG/knowledge-base/blob/main/using-slurm-on-cannon-3.md) for detailed usage instructions. 

`ncd`
  - Convenience script that runs the `ncdump -cts` command.  This is useful for checking netCDF file contents.

`startup`
  - Script that starts a number of xterm windows.  You can use this after logging into Cannon.

`xt`
  - Convenience script that will open a new xterm window.  Useful for opening xterm windows on external machines.
