# cannon-env/envs: Environment files

When you run the `copy-cannon-env` script, these files will be copied to your `$HOME/envs` folder on Cannon.

These are the "environment files", that is, files that contain the commands to load software modules (e.g. compiler, netCDF, MPI) that you will need to run GEOS-Chem or GCHP.

For example, if you wish to load software modules for GEOS-Chem Classic based on the GNU compilers version 10.2.0, you would type at the command-line:
```console
$ source ~/envs/gcclassic.rocky+gnu10.env
```
etc. for other environment files.

## Environment files for current GEOS-Chem and GCHP versions

These environment files load the relevant software modules for GEOS-Chem 12.6.0 and later.  These versions can be built with CMake instead of GNU Make:

### Rocky Linux 8 and GNU 10.2.0 compilers

`gcclassic.rocky+gnu10.env`
  - Loads software modules and sets environment variables for GEOS-Chem Classic

`gchp.rocky+gnu10.env`
  - Loads software modules and sets environment variables for GCHP

### Rocky Linux 8 and GNU 12.2.0 compilers

`gcclassic.rocky+gnu12.env`
  - Loads software modules and sets environment variables for GEOS-Chem Classic

`gchp.rocky+gnu12.env`
  - Loads software modules and sets environment variables for GCHP

