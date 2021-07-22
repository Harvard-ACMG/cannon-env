# cannon-env/envs: Environment files

When you run the `copy-cannon-env` script, these files will be copied to your `$HOME/envs` folder on Cannon.

These are the "environment files", that is, files that contain the commands to load software modules (e.g. compiler, netCDF, MPI) that you will need to run GEOS-Chem or GCHP.

For example, if you wish to load software modules for GEOS-Chem Classic based on the GNU compilers version 10.2.0, you would type at the command-line:
```
source ~/envs/gcc_cmake.gfortran102_cannon.env
```
etc. for other environment files.

## Environment files for current GEOS-Chem and GCHP versions

### "Modern" GEOS-Chem Classic versions (12.6.0 and later)

These environment files load the relevant software modules for "modern" GEOS-Chem versions (i.e. 12.6.0 and later).  These versions can be built with CMake instead of GNU Make:

`gcc_cmake.gfortran102_cannon.env`
  - Loads software modules based on GNU compilers version 10.2.0

`gcc_cmake.gfortran93_cannon.env`
  - Loads software modules based on GNU compilers version 9.3.0

`gcc_cmake.gfortran83_cannon.env`
  - Loads software modules based on GNU compilers version 8.2.0

`gcc_cmake.gfortran82_openmpi_cannon.env`
  - Loads software modules based on GNU compilers version 10.2.0

`gcc_cmake.ifort19_openmpi_cannon.env`
  - Loads software modules based on Intel compilers version 19.0.5

`gcc_cmake.ifort18_openmpi_cannon.env`
  - Loads software modules based on Intel compilers version 18.0.5

`gcc_cmake.ifort17_openmpi_cannon.env`
  - Loads software modules based on Intel compilers version 17.0.4

### "Modern" GCHP versions (13.0.0 and later)

These enviroment files will load the proper software modules for the most recent GCHP versions:

`gchpctm.gfortran93_openmpi4_cannon.env`
  - Loads software modules for GCHP based on GNU compilers 9.3.0 and OpenMPI 4

`gchpctm.gfortran83_openmpi4_cannon.env`
  - Loads software modules for GCHP based on GNU compilers 9.3.0 and OpenMPI 4

`gchpctm.ifort19_openmpi4_cannon.env`
  - Loads software modules for GCHP based on Intel compilers 19 and OpenMPI 4

## Environment files for legacy GEOS-Chem and GCHP versions

### Legacy GEOS-Chem versions (prior to 12.6.0)

These environment files load the relevant software modules for "legacy" GEOS-Chem versions (i.e. prior to 12.6.0).  These versions can only be built with GNU Make.

`gcc_legacy.gfortran82_openmpi_cannon.env`
  - Loads software modules for legacy GEOS-Chem based on GNU compilers 8.2.0

`gcc_legacy.ifort17_openmpi_cannon.env`
  - Loads software modules for legacy GEOS-Chem based on GNU compilers 17.0.4

### Legacy GCHP versions (prior to 13.0.0)

The most recent GCHP versions support GNU compilers 8.3.0 and later or Intel compilers 19 and later.  The following environment files load software modules that are no longer compatible with the most recent GCHP versions.  If you are using a GCHP version prior to 13.0.0, you can use one of these environment files to load the appropriate software modules.  (But we **strongly** recommend that you migrate to the most recent GCHP version!)

`gchpctm.gfortran82_openmpi3_cannon.env`
`gchpctm.ifort18_openmpi4_cannon.env`
`gchpctm.ifort17_openmpi3_cannon.env`
`gchp_legacy.gfortran82_openmpi_cannon.env`
`gchp_legacy.ifort17_openmpi_cannon.env`
`gchp_legacy.ifort18_openmpi4_cannon.env`