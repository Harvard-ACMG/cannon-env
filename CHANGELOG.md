# Changelog

This file documents all notable changes to the cannon-env repository since version 1.0.0. 

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [2.0.7] - 2024-12-04
### Changed
- Add module load commands for TAU profiler to gnu12 environment files

## [2.0.6] - 2024-10-29
### Changed
- Comment out `ulimit -c unlimited` in environment files, as this is now disallowed on Cannon

## [2.0.5] - 2024-05-13
### Fixed
- Now use if statements instead of `[[ -f ~/.bash_aliases ]]` etc. are present in the root folder.  These cause an error code to persist as described in #3. 

## [2.0.4] - 2024-03-25
### Added
- Module load commands for the Spack-built `rclone` package

## [2.0.3] - 2024-01-30
### Added
- Alias `sainfo` to get info about jobs on the sapphire partition

## [2.0.2] - 2024-01-04
### Fixed
- Updated VT100 keybindings in `.root/.Xresources` to allow CTRL-INSERT (cut) and SHIFT-INSERT (paste)

## [2.0.1] - 2023-12-15
### Fixed
- Removed the `&& ssh -CY $SLURM_JOB_NODELIST`, as this was causing some X11 forwarding issues after the update to SLURM 23.02.7

## [2.0.0] - 2023-09-23
### Added
- Environment files for Intel compilers in `envs/intel23`
- `README.md` files in `envs/gnu10`, `envs/gnu12`, `envs/intel23`
- Now load Spack-built modules for `jq` and `parallel`

### Changed
- The `envs` folder has been subdivided into `gnu10`, `gnu12`, and  `intel23` subdirectories
- Moved content from `envs/README.md` to `README.md` in subdirectories
- GCHP environment files now point to ESMF 8.4.2 installation
- Unload all packages loaded with `spack load` in environment files
- Send the output of `unalias diff` to `/dev/null` to squelch error messages
- Added extra xterm settings and font selections in `root/.Xresources`
- Rewrote `copy_cannon_env` to back up configuration files
- Updated `root/.Xresources` with additional options and font selections
- `.bash_profile`, `.bashrc`, etc. files are now chmod 644
- Updated `bin/myjobs` to exclude job ID's ending in `.1`, `.2`, etc.
- The `bin/interactive` script uses `--mem` instead of `--mem-per-cpu`
- Updated env files for the new library path `/n/jacob_lab/Lab/RockyLinux/`
- Updated `README.md ` files accordingly

### Removed
- Removed the `ROCKY_ROOT` variable from environment files

## [1.0.0] - 2023-06-05
### Added
- Environment files for RockyLinux (w/ FASRC + Spack modules) in `envs/*`
- Added logo and links to the `README.md` file
- Added `CHANGELOG.md` file
- Added `LICENSE.txt` file
- Added environment fnles that only load FASRC-built packages
- Added `ROCKY_ROOT` to env files (points to RockyLinux library root folder)

### Changed
- Move Spack intitialization and module path updates to top of environment file scripts
- Add more informational messages in environment files
- Make sure NETCDF_HOME is defined properly in environment files
- Do not load CDO module in environment files, use "spack load" instead
- Explicitly load netcdf-c in module files
- Updated `envs/README.md` with a table of env files, plus subsections
- Now load FASRC-built IDL module in GCClassic environment files
- Renamed `*.nospack.env` environment files to `*.minimal.env`

### Removed
- Environment files for CentOS (w/ FASRC modules) in `envs/*`
