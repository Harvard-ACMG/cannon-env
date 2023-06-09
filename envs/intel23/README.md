<a href="https://acmg.seas.harvard.edu"><img src="https://acmg.seas.harvard.edu/sites/projects.iq.harvard.edu/files/acmg/files/img_acmg_logo_small.png" width="200" height="187" alt="ACMG logo"></a>

# cannon-env/envs: Environment files for Cannon

**Environment files** contain the commands to load software modules (e.g. compiler, netCDF, MPI) that you will need to run GEOS-Chem or GCHP.

When you run the `copy-cannon-env` script, these files will be copied to your `$HOME/envs` folder on Cannon.  You can copy or link these to a more convenient location (such as your home directory).

## Environment files for current GEOS-Chem and GCHP versions


### With FASRC-built and Spack-built packages

To be added soon

### With minimal packages needed for GEOS-Chem

These environment files contain settings to load only the FASRC-built packages that are absolutely essential to running GEOS-Chem Classic and GCHP.  You can use these in simulation run scripts for the Cannon queues, or to initialize clean Spack software builds.


| Environment file                    | Model              | For compilers             |
| ----------------------------------- | ------------------ | ------------------------- |
| `gcclassic.rocky+intel23.minimal.env` | GEOS-Chem Classic  | gcc, g++, gfortran 10.2.0 |

GCHP will be added soon.

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
$ source ~/envs/gcclassic.rocky+intel23.minimal.env
```

etc for the other environment files listed above.
