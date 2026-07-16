# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

cannon-env is a collection of shell configuration files and scripts that customize a user's
login environment on Harvard FASRC's Cannon HPC cluster, primarily to build and run
GEOS-Chem Classic and GCHP (atmospheric chemistry models). This is a dotfiles-style repo,
not an application — there is no build, lint, or test tooling.

## Repository layout

- `root/` — shell/system startup files (`.bashrc`, `.bash_profile`, `.login`,
  `.my_personal_settings`, `.Xresources`, `.emacs`, `.tmux.conf`) copied to `$HOME`
- `bin/` — convenience scripts (`interactive*`, `jobinfo`, `jobstats`, `job_depend.pl`, `ncd`,
  `startup`, `xt`) copied to `$HOME/bin`, plus emacs-lisp mode files; `bin/netcdf-scripts` is
  a git submodule (`geoschem/netcdf-scripts`)
- `envs/` — environment files (`module load`/`spack load` scripts) organized by compiler
  toolchain subdirectory: `gnu10`, `gnu12`, `gnu14`, `intel23`. Each has a full
  (FASRC-built + Spack-built) variant and a `.minimal.env` (FASRC-only) variant, for both
  `gcclassic` and `gchp`
- `IDL/` — IDL session startup script
- `copy-cannon-env` — top-level install script

## Key workflow: copy-cannon-env

`copy-cannon-env` (bash) is the only "deployment" mechanism in this repo. Its `main()`
function copies `root/`, `bin/`, `bin/netcdf-scripts`, `IDL/`, `envs/`, and the
`envs/gnu10`, `envs/gnu12`, `envs/intel23` subdirectories into `$HOME` (and
`$HOME/<folder>` for the non-`root` folders), backing up any pre-existing files into a
timestamped `.backup.<ISO-datetime>` directory first (`backup_and_copy`). There is no
other build step — validating a change means running this script (or manually sourcing
the changed file) on Cannon itself.

Note: the `folders` array in `copy-cannon-env` was not updated for the newer `gnu14`
subdirectory — check whether that's intentional before assuming every `envs/*` subdir
is copied.

## Environment file conventions (envs/*/*.env)

These files are *sourced*, not executed, into a login shell:
`source envs/gnu12/gcclassic.rocky+gnu12.env`. When editing or adding one, follow the
existing structure (see e.g. `envs/gnu12/gcclassic.rocky+gnu12.env`):

1. Header comment block naming the file and describing the model/OS/compiler combo
2. Interactive-only status messages guarded by `if [[ $- = *i* ]]`
3. Spack init + `MODULEPATH` setup (non-minimal files only)
4. `module purge` / `spack unload --all` to reset the environment
5. FASRC-built `module load` calls (compiler, MPI, netcdf-c, netcdf-fortran, flex, cmake,
   etc.), each with a trailing `# comment` naming the package's purpose
6. Spack-built `module load`/`spack load` calls (non-minimal files only)
7. Environment variables: `CC`/`CXX`/`FC`/`F77`, `NETCDF_*_ROOT`, `KPP_FLEX_LIB_DIR`,
   `OMP_NUM_THREADS` (derived from `SLURM_CPUS_PER_TASK` when set, else defaults to 8),
   `OMP_STACKSIZE`
8. `ulimit` settings — note `ulimit -c unlimited` (coredumpsize) is commented out because
   it's no longer permitted on Cannon (see `CHANGELOG.md` 2.0.6 / 2.0.10)
9. `module list` plus a final echo block printing the resulting environment variables

Naming pattern: `<model>.rocky+<compiler><version>[.minimal].env`, where `<model>` is
`gcclassic` or `gchp`.

Each `envs/<compiler>/` subdirectory has its own `README.md` with a table of its files;
`envs/README.md` and the top-level `README.md` summarize at a higher level. When
adding/changing an env file, update the relevant `README.md` table(s) too.

## Making changes

- There is no automated test suite. Changes are validated by sourcing the env file (or
  running `copy-cannon-env`) on Cannon and confirming modules load and the printed
  environment variables at the bottom of the script look correct.
- `CHANGELOG.md` follows Keep a Changelog + Semantic Versioning — add an entry for any
  user-facing change, matching the existing level of detail (one bullet per file/behavior
  changed, under `### Added`/`### Changed`/`### Fixed`/`### Removed`).
- Per `root/README.md`, `root/.login`, `root/.bash_profile`, and `root/.bashrc` are
  Cannon-specific defaults that should **not** be modified; user customizations belong in
  `root/.my_personal_settings` instead.
