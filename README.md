<a href="https://acmg.seas.harvard.edu"><img src="https://acmg.seas.harvard.edu/sites/projects.iq.harvard.edu/files/acmg/files/img_acmg_logo_small.png" width="200" height="187" alt="ACMG logo"></a>

[![Latest
Release](https://img.shields.io/github/v/release/Harvard-ACMG/cannon-env?label=Latest%20Release)](https://github.com/Harvard-ACMG/cannon-env/releases) [![Release
Date](https://img.shields.io/github/release-date/Harvard-ACMG/cannon-env)](https://github.com/Harvard-ACMG/cannon-env/releases/) [![License](https://img.shields.io/badge/License-MIT-blue.svg)](https://github.com/Harvard-ACMG/cannon-env/blob/main/LICENSE.txt)

# cannon-env: Configuration files for the Cannon cluster

This repository (`cannon-env`) contains scripts and configuration files that you can use to customize your login environment on the FASRC Cannon cluster.

## Installation

We recommend downloading this repository to your Cannon home directory.  Type the following commands at the command-line prompt:
```
cd ~
git clone --recurse-submodules https://github.com/Harvard-ACMG/cannon-env.git
```

We have provided a script named `copy-cannon-env` that will copy the relevant scripts and configuration files to the proper places in your home directory.  To execute the script, type at the command-line prompt:
```
cd cannon-env
./copy-cannon-env
```

## Contents

When you run `./copy-cannon-env`, several configuration files and scripts will be copied to your home directory as well as several subfolders (which will be created if they do not exist).   

### root

This folder contains startup scripts, which will be copied to your home directory (aka `~` or `$HOME`).  You may modify some of these scripts to customize your Cannon login environment.  For a list of files in this folder, please see [`root/README.md`](root/README.md).

### bin

This folder contains several user convenience scripts, which will be copied to your `$HOME/bin` folder.  For a complete desciption, please see [`bin/README.md`](bin/README.md).

### envs

This directory contains scripts that the proper Cannon software modules for GEOS-Chem Classic and GCHP.  For a complete description, please see [`envs/README.md`](envs/README.md).

### IDL

This directory contains scripts that initialize your IDL session.  Please see [`IDL/README.md`](IDL/README.md) for more information.

## Reporting bugs or technical issues

Please report any bugs or technical issues you may encounter by [opening a new issue](https://github.com/Harvard-ACMG/cannon-env/issues).  We try to ensure that this repository is kept up-to-date as possible.  But there is always the possibility that Cannon software or operating system upgrades may "break" the functionality provided by these configuraton files.
