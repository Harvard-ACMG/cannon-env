# cannon-env/envs: Environment files

**Environment files** contain the commands to load software modules (e.g. compiler, netCDF, MPI) that you will need to run GEOS-Chem or GCHP.

When you run the `copy-cannon-env` script, these files will be copied to your `$HOME/envs` folder on Cannon.  You can copy or link these to a more convenient location (such as your home directory).

## Environment files for current GEOS-Chem and GCHP versions

| Environment file            | Model              | For compilers             |
| --------------------------- | ------------------ | ------------------------- |
| `gcclassic.rocky+gnu10.env` | GEOS-Chem Classic  | gcc, g++, gfortran 10.2.0 |
| `gchp.rocky+gnu10.env`      | GCHP               | gcc, g++, gfortran 10.2.0 |
| `gcclassic.rocky+gnu12.env` | GEOS-Chem Classic  | gcc, g++, gfortran 12.2.0 |
| `gchp.rocky+gnu10.env`      | GCHP               | gcc, g++, gfortran 12.2.0 |


## Using environment files

Use the `source` command to apply the settings in an environment file to your login environment:

```console
source <environment-file-name>
```

NOTE: In the `bash` shell, you can also use a `.` instead of `source`, e.g.

```console
. <environment-file-name>
```

For example, if you wish to load software modules for GEOS-Chem Classic based on the GNU compilers version 10.2.0, use this command:

```console
$ source ~/envs/gcclassic.rocky+gnu10.env
```

etc.