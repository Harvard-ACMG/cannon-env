# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

cannon-env is a collection of shell configuration files and scripts that customize a user's login environment on Harvard FASRC's Cannon HPC cluster, primarily to build and run GEOS-Chem Classic and GCHP (atmospheric chemistry models). This is a dotfiles-style repo, not an application: there is no build, lint, or test tooling, and no CI.

## Before making changes

1. Read this file and check `git status`.
2. Propose a plan before editing files.
3. Stay inside this repository for anything you write. To test `copy-cannon-env`, point `$HOME` at a scratch directory (see below); never run it against the real `$HOME` without explicit approval, since it moves existing dotfiles into backup folders.

## Repository layout

- `root/` — shell startup and config files copied to `$HOME`: `.bashrc`, `.bash_profile`, `.my_personal_settings`, `.Xresources`, `.emacs`, `.tmux.conf`. (`root/.login` was removed in 2.0.13.)
- `bin/` — convenience scripts copied to `$HOME/bin`: `interactive`, `jobinfo`, `jobstats`, `job_depend.pl`, `myjobs`, `ncd`, `startup`, `xt`, plus Emacs Lisp modes (`cmake-mode.el`, `kpp.el`, `ncl.el`, `yaml-mode.el`). `bin/netcdf-scripts` is a git submodule (`geoschem/netcdf-scripts`).
- `envs/` — environment files (`module load` scripts), one subdirectory per compiler toolchain. The set is not uniform:

  | Folder | Full (FASRC + Spack-built) | Minimal (FASRC-built only) | Compiler |
  |---|---|---|---|
  | `envs/gnu12/` | `gcclassic`, `gchp` | `gcclassic`, `gchp` | GCC 12.2.0 |
  | `envs/gnu14/` | none | `gcclassic`, `gchp` | GCC 14.2.0 |
  | `envs/intel23/` | none | `gcclassic`, `gchp` | Intel oneAPI 23.0.0 |

  `envs/gnu10/` was removed in 2.1.0.
- `IDL/` — IDL session startup script (`idl_startup.pro`).
- `_static/ACMG_logo.jpg` — logo shown at the top of every `README.md`.
- `copy-cannon-env` — top-level install script.

## Key workflow: copy-cannon-env

`copy-cannon-env` (bash) is the only "deployment" mechanism in this repo. Its `main()` copies each folder in its `folders` array into `$HOME` (for `root`) or `$HOME/<folder>` (for everything else), using `backup_and_copy`. Before overwriting a file, `backup_and_copy` moves the existing copy into a timestamped `.backup.<ISO-datetime>` folder next to it.

The `folders` array lists every folder to install explicitly: `root`, `bin`, `bin/netcdf-scripts`, `IDL`, `envs`, `envs/gnu12`, `envs/gnu14`, `envs/intel23`. **When adding or removing an `envs/<compiler>/` folder, update this array too.** A folder listed there but missing from the repo causes a `cp: cannot stat` error. A new folder left out of it is still copied by the `envs` pass, but its files are overwritten without being backed up.

Each file or subfolder is copied with `cp -fR "${srcDir}/${file}" "${trgDir}/"`, i.e. *into* the target folder. Keep that form: copying to `"${trgDir}/${file}"` instead makes `cp -R` nest an existing subfolder inside itself on every re-run (e.g. `~/envs/gnu12/gnu12`).

To test the script without touching your own dotfiles, run it twice from the repository root with a scratch `$HOME` (it reads `root="${HOME}"`):

```bash
mkdir -p /tmp/fakehome
HOME=/tmp/fakehome bash copy-cannon-env
HOME=/tmp/fakehome bash copy-cannon-env   # second run exercises the backup/merge path
```

Then confirm there were no `cp` errors and no nested folders: `ls -d /tmp/fakehome/envs/*/*/` should print nothing (the `.backup.*` folders are hidden from that glob).

## Environment file conventions (envs/*/*.env)

These files are *sourced*, not executed, into a login shell: `source envs/gnu12/gcclassic.rocky+gnu12.env`. When editing or adding one, follow the existing structure (see e.g. `envs/gnu12/gcclassic.rocky+gnu12.env`):

1. Header comment block whose second line is the file's own name, followed by the model/OS/compiler combination.
2. Interactive-only status messages guarded by `if [[ $- = *i* ]]`.
3. Spack initialization and `MODULEPATH` setup (full files only; the minimal files only run `spack unload --all`).
4. `module purge` / `spack unload --all` to reset the environment.
5. FASRC-built `module load` calls (compiler, MPI, netcdf-c, netcdf-fortran, flex, cmake, etc.), each with a trailing `# comment` naming the package's purpose. `flex` was restored to the minimal files in 2.1.1, because KPP needs it.
6. Spack-built `module load` calls (full files only).
7. Environment variables: `CC`/`CXX`/`FC`/`F77`, `NETCDF_*_ROOT`, `KPP_FLEX_LIB_DIR`. The `gcclassic` files also set `OMP_NUM_THREADS` (from `SLURM_CPUS_PER_TASK` when set, else 8) and `OMP_STACKSIZE`; the `gchp` files do not, since GCHP runs with MPI.
8. `ulimit` settings: `ulimit -v unlimited` and `ulimit -s unlimited` (plus `ulimit -l unlimited` in `envs/intel23/gchp.rocky+intel23.minimal.env`). Do not add `ulimit -c` or `ulimit -u`: Cannon no longer permits them, and both have been removed from every env file.
9. `module list` plus a final echo block printing the resulting environment variables.

Naming pattern: `<model>.rocky+<compiler><version>[.minimal].env`, where `<model>` is `gcclassic` or `gchp`.

## README conventions

- Each `envs/<compiler>/` folder has its own `README.md` with a table of its env files and compiler versions; `envs/README.md` and the top-level `README.md` summarize at a higher level. When adding or changing an env file, update the relevant table(s) too, and check that the file names and compiler versions in them match the files.
- Every `README.md` starts with an `<img src=".../_static/ACMG_logo.jpg">` link. The `../` depth must match the README's folder: `_static/` at the top level, `../_static/` one level down (`bin/`, `envs/`, `root/`, `IDL/`), `../../_static/` two levels down (`envs/<compiler>/`).

## Making changes

- There is no automated test suite or CI. Validate env-file changes by sourcing the file on Cannon and checking that the modules load and the printed environment variables look correct. Validate `copy-cannon-env` changes with the scratch-`$HOME` test above.
- `CHANGELOG.md` follows Keep a Changelog and Semantic Versioning. Add an entry for any user-facing change under `## [Unreleased] - TBD`, in the appropriate `### Added`/`### Changed`/`### Fixed`/`### Removed` subsection, matching the existing level of detail. If there is no `[Unreleased]` section (right after a release), create one above the newest release rather than appending to a released section.
- Per `root/README.md`, `root/.bash_profile` and `root/.bashrc` contain Cannon-specific defaults that should **not** be modified; user customizations belong in `root/.my_personal_settings` instead.
- `.gitattributes` enforces LF line endings for all text (these files are sourced on Linux) and marks images as binary. Never write CRLF into scripts or env files.
- Security issues go through `SECURITY.md` (GitHub private vulnerability reporting, which is enabled for this repository), not a public issue.
