<a href="https://acmg.seas.harvard.edu"><img src="https://acmg.seas.harvard.edu/sites/projects.iq.harvard.edu/files/acmg/files/img_acmg_logo_small.png" width="200" height="187" alt="ACMG logo"></a>

# cannon-env/envs: Environment files for Cannon with GNU 12.2.0 Compilers

### With FASRC-built and Spack-built packages

These environment files will load FASRC-built packages, as well as locally-built Spack packages. These define the complete software environment that you will need to run GEOS-Chem Classic, and GCHP, as well as to perform post-processing on netCDF files, etc.

NOTE: Some software packages that do not use MPI and netCDF have been built with the GNU Compiler Collection 8.5.0, which comes pre-installed with Rocky Linux 8.7. This allows us to keep a single copy of these packages, instead of having to build separate copies for GNU 10.2.0 and 12.2.0.

| Environment file            | Model              | For compilers                     |
| --------------------------- | ------------------ | --------------------------------- |
| `gcclassic.rocky+gnu12.env` | GEOS-Chem Classic  | gcc, g++, gfortran 12.2.0 & 8.5.0 |
| `gchp.rocky+gnu10.env`      | GCHP               | gcc, g++, gfortran 12.2.0 & 8.5.0 |

### With minimal packages needed for GEOS-Chem

These environment files contain settings to load only the FASRC-built packages that are absolutely essential to running GEOS-Chem Classic and GCHP.  You can use these in simulation run scripts for the Cannon queues, or to initialize clean Spack software builds.

| Environment file                    | Model              | For compilers             |
| ----------------------------------- | ------------------ | ------------------------- |
| `gcclassic.rocky+gnu12.minimal.env` | GEOS-Chem Classic  | gcc, g++, gfortran 12.2.0 |
| `gchp.rocky+gnu10.minimal.env`      | GCHP               | gcc, g++, gfortran 12.2.0 |

## Using environment files

Use the `source` command to apply the settings in an environment file to your login environment:

```console
source <environment-file-name>
```

NOTE: In the `bash` shell, you can also use a `.` instead of `source`, e.g.

```console
. <environment-file-name>
```

For example:

```console
$ source ~/envs/gcclassic.rocky+gnu12.env
```

etc for the other environment files listed above.
