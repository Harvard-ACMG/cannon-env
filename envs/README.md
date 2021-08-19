# cannon-env/envs: Environment files

When you run the `copy-cannon-env` script, these files will be copied to your `$HOME/envs` folder on Cannon.

These are the "environment files", that is, files that contain the commands to load software modules (e.g. compiler, netCDF, MPI) that you will need to run GEOS-Chem or GCHP.

For example, if you wish to load software modules for GEOS-Chem Classic based on the GNU compilers version 10.2.0, you would type at the command-line:
```
source ~/envs/gcc.gfortran10.2_cannon.env
```
etc. for other environment files.

## Environment files for current GEOS-Chem and GCHP versions

### GEOS-Chem Classic versions 12.6.0 and later

These environment files load the relevant software modules for GEOS-Chem 12.6.0 and later.  These versions can be built with CMake instead of GNU Make:

`gcc.gfortran10.2_cannon.env`
  - Loads software modules based on GNU compilers version 10.2.0

`gcc.gfortran9.3_cannon.env`
  - Loads software modules based on GNU compilers version 9.3.0

`gcc.gfortran8.3_cannon.env`
  - Loads software modules based on GNU compilers version 8.2.0

`gcc.gfortran8.2_openmpi_cannon.env`
  - Loads software modules based on GNU compilers version 10.2.0

`gcc.ifort19_openmpi_cannon.env`
  - Loads software modules based on Intel compilers version 19.0.5

`gcc.ifort18_openmpi_cannon.env`
  - Loads software modules based on Intel compilers version 18.0.5

`gcc.ifort17_openmpi_cannon.env`
  - Loads software modules based on Intel compilers version 17.0.4

### GCHP versions 13.0.0 and later

These enviroment files will load the proper software modules for the most recent GCHP versions:

`gchp.gfortran10.2_openmpi4_cannon.env`
  - Loads software modules for GCHP based on GNU compilers 10.2.0 and OpenMPI 4

`gchp.gfortran9.3_openmpi4_cannon.env`
  - Loads software modules for GCHP based on GNU compilers 9.3.0 and OpenMPI 4

`gchp.gfortran8.3_openmpi4_cannon.env`
  - Loads software modules for GCHP based on GNU compilers 8.3.0 and OpenMPI 4

`gchp.ifort19_openmpi4_cannon.env`
  - Loads software modules for GCHP based on Intel compilers 19 and OpenMPI 4

## Environment files for legacy GEOS-Chem and GCHP versions

Environment files for older versions of GEOS-Chem and GCHP may be found in the Git history. These versions are no longer supported and we recommend updating to the latest version of GEOS-Chem and/or GCHP. Please contact the GCST with any questions.