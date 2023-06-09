# Changelog

This file documents all notable changes to the cannon-env repository since version 1.0.0. 

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]
### Added
- Environment files for Intel compilers in `envs/intel23`
- `README.md` files in `envs/gnu10`, `envs/gnu12`, `envs/intel23`

### Changed
- The `envs` folder has been subdivided into `gnu10`, `gnu12`, and  `intel23` subdirectories
- Moved content from `envs/README.md` to `README.md` in subdirectories


## [1.0.0]
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
