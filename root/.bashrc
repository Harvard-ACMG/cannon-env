#------------------------------------------------------------------------------
#          Harvard University Atmospheric Chemistry Modeling Group            !
#------------------------------------------------------------------------------
#BOP
#
# !MODULE: .bashrc
#
# !DESCRIPTION: File containing environment settings for the bash shell on
#  either the AS cluster or the Odyssey cluster.
#\\
#\\
# !CALLING SEQUENCE:
#  source ~/.bashrc
#
# !REMARKS:
#  We have included settings that are common to all GEOS-Chem users on both
#  the Odyssey cluster (rc.fas.harvard.edu) and for the Jacob-group 
#  Atmospheric Sciences cluster (as.harvard.edu).  These settings are blocked 
#  out with if stateements such as:
#
#     if [[ $isOdyssey == 1   ]]; then ...    # Settings for Odyssey
#     if [[ $isAsCluster == 1 ]]; then ...    # Settings for AS cluster
#
#  You can define additional aliases that are only applicable to your own
#  environment in the file .my_personal_aliases.
#
# !REVISION HISTORY: 
#  07 Oct 2014 - R. Yantosca - Initial version
#  14 Oct 2014 - R. Yantosca - Fixes to add IDL on Odyssey
#  14 Oct 2014 - R. Yantosca - Use $HOME, $USER instead of $home, $user
#  15 Oct 2014 - R. Yantosca - Now use bash syntax for Unix prompt
#  15 Oct 2014 - R. Yantosca - Do not display message of the day, this 
#                              causes WinSCP to choke
#  16 Oct 2014 - R. Yantosca - Remove "set notify"\
#  20 Oct 2014 - R. Yantosca - Bug fix: set MPI_HOME and compilers for Odyssey
#  23 Oct 2014 - R. Yantosca - Now use GEOS-Chem-Libraries for netCDF etc.
#  28 Oct 2014 - R. Yantosca - Now do not set $OMP_NUM_THREADS on Odyssey;
#                              you will have to set that depending on # CPUs
#  28 Oct 2014 - R. Yantosca - Also fix paths for HEMCO on Odyssey
#  30 Oct 2014 - R. Yantosca - Now max out stacksize and other limits
#  30 Oct 2014 - R. Yantosca - Now look for user-defined aliases and env
#                              settings in the .my_personal_aliases file.
#  31 Oct 2014 - R. Yantosca - Set the KMP_STACKSIZE value 100x higher
#  14 Nov 2014 - R. Yantosca - Found proper netCDF module command for Odyssey
#  11 Dec 2014 - R. Yantosca - Also load ncview, nco modules
#  12 Dec 2014 - R. Yantosca - Bug fix: now look for ~/.my_personal_aliases
#  16 Dec 2014 - R. Yantosca - Now specifically pick ifort/13.0.079
#  07 Jan 2015 - R. Yantosca - Now specify openmpi/1.8.1-fasrc01 explicitly
#  12 Jan 2015 - R. Yantosca - Bug fix; now unset env vars for NCL 6.1.2
#  07 Apr 2015 - R. Yantosca - Bug fix: for now just load netCDF/4.1.3
#  07 Apr 2015 - R. Yantosca - Bug fix: load an older version of ncview
#  10 Apr 2015 - R. Yantosca - Migrate to IFORT 15 and related modules
#  12 May 2015 - R. Yantosca - Now define separate variables for nc-fortran
#                              bin, include, and lib paths
#  12 May 2015 - R. Yantosca - Add module loads for PGI compiler
#  21 Jul 2015 - M. Sulprizio- Add sshod alias for establishing a ssh connection
#                              to Odyssey in the background. This can be used
#                              to simplify transfers between AS and Odyssey.
#  04 Aug 2015 - R. Yantosca - Add module load commands for Jacob Group
#                              customized libraries   
#EOP
#------------------------------------------------------------------------------
#BOC

#==============================================================================
# %%%%% General system startup settings %%%%%
#==============================================================================

# %%%%% Source systemwide global definitions from /etc/bashrc %%%%%
if [[ -f /etc/bashrc ]] ; then
 . /etc/bashrc
fi

# %%%%% Query if we are on the AS cluster or on Odyssey %%%%%
if [[ $HOSTNAME =~ 'rc.fas.harvard.edu' ]] ; then
 export isOdyssey=1
 export isAsCluster=0
else
 if [[ $HOSTNAME =~ 'as.harvard.edu' ]] ; then
  export isOdyssey=0
  export isAsCluster=1
 fi
fi

# %%%%% Set Unix prompt to be "[USER@HOST CWD]%" %%%%%
PS1="[\u@\h \W]% "

# %%%%% Startup settings %%%%%
umask 022                          # Make files readable by everyone by default
set autolist                       # Turn on list completion
set correct                        #
set color                          # 
set colorcat                       # 
set filesc                         #
set emacs                          # Use an emacs-style editing interface
set history                        # Turn on history of commands
set ignoreeof                      # Prevent EOF from terminating the shell
ulimit -t unlimited                # Max out cputime
ulimit -f unlimited                # Max out filesize
ulimit -d unlimited                # Max out datasize
ulimit -s unlimited                # Max out stacksize
ulimit -c unlimited                # Max out coredumpsize
umask 022

#==============================================================================
# %%%%% Settings for loading software modules %%%%%
#==============================================================================
if [[ $isOdyssey == 1 ]] ; then
 export LMOD_COLORIZE=yes                                  # Colorize display
 source new-modules.sh                                     # Turn on Lmod
 module purge                                              # Unload everything
 module load git                                           # Load Git
 module load perl                                          # Load Perl
 module load IDL                                           # Load IDL
#------------------------------------------------------------------------------
# %%%%% JACOB-GROUP LIBRARIES %%%%% 
# If you just want to compile GEOS-Chem "Classic" (i.e. 
# without using the ESMF/MPI interface) then you should 
# use these modules.  These replicate the setup that we
# had on the AS cluster. (bmy, 8/4/15)
 export MODULEPATH="/n/seasasfs01/modulefiles:$MODULEPATH" # Jacob grp modules
 module load GEOS-Chem-Libraries                           # netCDF/HDF5
 module load intel/11.1                                    # IFORT compiler
 module load totalview                                     # Totalview debugger
#------------------------------------------------------------------------------
# %%%%% FOR GEOS-CHEM HP with IFORT 13 %%%%%
# module load intel/13.0.079-fasrc01 openmpi/1.8.1-fasrc01 # Load ifort/openmpi
# module load ncview nco netcdf/4.1.3-fasrc01              # Load netCDF
#------------------------------------------------------------------------------
# %%%%% FOR GEOS-CHEM HP with IFORT 15 %%%%%
# module load intel/15.0.0-fasrc01 openmpi/1.8.3-fasrc02   # Load ifort, MPI
# module load netcdf/4.1.3-fasrc04                         # Load netCDF
# module load ncview/2.1.5-fasrc01                         # Load ncview
# module load nco/4.3.6-fasrc01                            # Load nco
#------------------------------------------------------------------------------
# %%%%% FOR GEOS-CHEM with PGI COMPILER (EXPERIMENTAL) %%%%%
# module load pgi/14.10-fasrc01                            # Load PGI
# module load hpc/netcdf-4.2 hpc/netcdf-fortran-4.2        # Load netCDF
#------------------------------------------------------------------------------
 # Display loaded modules
 module list
fi

#==============================================================================
# %%%%% Settings for data paths %%%%%
#==============================================================================

# %%%%% Settings for GIGCsa %%%%%
export ARCH=`uname -s`

# %%%%% Settings for netCDF, HDF, etc. libraries %%%%%
if [[ $isAsCluster == 1 ]] ; then
 export NETCDF_HOME="/opt/GEOS-Chem-Libraries/ifort/nc4"   # nc dir
 export NETCDF_F_HOME=$NETCDF_HOME                         # nc-fortran dir
elif [[ $isOdyssey == 1 ]] ; then
 export NETCDF_HOME=`nc-config --prefix`                   # nc dir
 export NETCDF_F_HOME=`nf-config --prefix 2>/dev/null`     # nc-fortran dir
 if [[ $NETCDF_F_HOME == "" ]] ; then                      # If not found,
  export NETCDF_F_HOME=$NETCDF_HOME                        #  set nc-fortran
 fi                                                        #  same as nc dir.
fi
export GC_BIN="$NETCDF_HOME/bin"                           # netcdf bin dir
export GC_INCLUDE="$NETCDF_HOME/include"                   # netcdf include dir
export GC_LIB="$NETCDF_HOME/lib"                           # netcdf library dir
export BIN_NETCDF=$GC_BIN                                  # aka GC_BIN
export INC_NETCDF=$GC_INCLUDE                              # aka GC_INCLUDE
export LIB_NETCDF=$GC_LIB                                  # aka GC_LIB
export BIN_HDF5=$GC_BIN                                    # aka GC_BIN
export INC_HDF5=$GC_INCLUDE                                # aka GC_INCLUDE
export LIB_HDF5=$GC_LIB                                    # aka GC_LIB

# %%%%% Settings for met field & emissions directories %%%%%
if [[ $isAsCluster == 1 ]] ; then
 dataDir="/mnt/gcgrid-rw/data"
 dataDirReadOnly="/mnt/gcgrid/data"
elif [[ $isOdyssey == 1 ]] ; then
 dataDir="/net/seasasfs01/srv/export/seasasfs01/share_root/gcgrid/gcdata"
 dataDirReadOnly="/net/seasasfs01/srv/export/seasasfs01/share_root/gcgrid/gcdata"
fi
alias  XC="cd $dataDir/GEOS_0.5x0.666_CH"
alias  XC5="cd $dataDir/GEOS_0.5x0.666_CH.d/GEOS_5"
alias  XS="cd $dataDir/GEOS_0.25x0.3125_NA/"
alias  XNFP="cd $dataDir/GEOS_0.25x0.3125_NA.d/GEOS_FP/"
alias  XN="cd $dataDir/GEOS_0.5x0.666_NA"
alias  XN5="cd $dataDir/GEOS_0.5x0.666_NA.d/GEOS_5"
alias  X1="cd $dataDir/GEOS_1x1"
alias  XNN="cd $dataDir/GEOS_NATIVE"
alias  X2="cd $dataDir/GEOS_2x2.5"
alias  X24="cd $dataDir/GEOS_2x2.5.d/GEOS_4_v4"
alias  X25="cd $dataDir/GEOS_2x2.5.d/GEOS_5"
alias  X2FP="cd $dataDir/GEOS_2x2.5.d/GEOS_FP"
alias  X2M="cd $dataDir/GEOS_2x2.5.d/MERRA"
alias  X4="cd $dataDir/GEOS_4x5"
alias  X44="cd $dataDir/GEOS_4x5/GEOS_4_v4"
alias  X45="cd $dataDir/GEOS_4x5/GEOS_5"
alias  X4FP="cd $dataDir/GEOS_4x5/GEOS_FP"
alias  X4M="cd $dataDir/GEOS_4x5/MERRA"
export DATA_ROOT="$dataDir/ExtData/"
export DATA_ROOT_RW="$dataDirReadOnly/ExtData/"
export HEMCO_DATA_ROOT="$dataDirReadOnly/ExtData/HEMCO"
export HEMCO_DATA_ROOT_RW="$dataDir/ExtData/HEMCO"
export EXTDATA="$dataDirReadOnly/ExtData"
export EXTDATA_RW="$dataDir/ExtData"
unset dataDir
unset dataDirReadOnly

# %%%%% Add updates to path variable %%%%%
if [[ $isAsCluster == 1 ]] ; then
 PATH=$PATH:/usr/lib64
fi

#==============================================================================
# %%%%% Settings for Git and GitHub %%%%%
#==============================================================================

# %%%%% Basic Git commands %%%%%
if [[ $isAsCluster == 1 ]] ; then
 export MY_GIT_DIR="/as/pub/git/bmy"
 alias  MG="cd $MY_GIT_DIR; pwd"
fi
alias  gui="git gui &"
alias  gk="gitk &"
alias  gka="gitk --all &"
alias  gl="git log"
alias  glo="git log --oneline"
alias  glp="git log --pretty=format:'%h : %s' --topo-order --graph"

# %%%%% Git commands for the Jacob-group websites %%%%%
if [[ $isAsCluster == 1 ]] ; then
 export ACMG_WEB="git://git-home.as.harvard.edu/acmg.seas.harvard.edu"
 alias  WG="cd $HOME/web/geos"
 alias  WH="cd $HOME/web/htdocs"
 alias  WP="cd $HOME/web/publications"
 alias  WE="cd $HOME/web/presentations"
 alias  wpg="git pull ${ACMG_WEB}/geos master"
 alias  wph="git pull ${ACMG_WEB}/htdocs master"
 alias  wpp="git pull ${ACMG_WEB}/publications master"
 alias  wpe="git pull ${ACMG_WEB}/presentations master"
fi

# %%%%% Commands to sync .bashrc etc files %%%%%
alias  getenv="cd ~/env; git pull git://git.as.harvard.edu/bmy/env master"

#==============================================================================
# %%%%% Settings for programming languages and applications %%%%%
#==============================================================================

# %%%%% Settings for Fortran and C %%%%%
export FC=ifort
export CC=gcc
export CXX=g++
export F90=$FC
export F77=$FC

# %%%%% Settings for OpenMP parallelization %%%%%
if [[ $isAsCluster == 1 ]] ; then
 export OMP_NUM_THREADS=4               # NOTE: Set this manually on Odyssey!
fi
export KMP_STACKSIZE=500000000          # NOTE: Set 100x larger than in csh!

# %%%%% Settings for OpenMPI parallelization %%%%%
export OMPI_FC=$FC
export OMPI_CC=$CC
export OMPI_CXX=$CXX

# %%%%% Settings for IDL %%%%%
export IDL_STARTUP="$HOME/IDL/idl_startup.pro"
alias  I="cd $HOME/IDL"
alias  IG="cd $HOME/IDL/gamap2"
alias  IS="cd $HOME/IDL/tests"

# %%%%% Settings for NCL %%%%%
if [[ $isAsCluster == 1 ]] ; then
 unset  NCARG_FONTCAPS
 unset  NCARG_GRAPHCAPS
 unset  NCARG_ROOT
 unset  NCARG_DATABASE
 unset  NCARG_LIB
 unset  NCARG_NCARG
 export NCARG_ROOT="/opt/ncl-6.1.2"
fi

# %%%%% Settings for Python %%%%%
export PYTHONSTTARTUP="$HOME/python/python_startup.py"

# %%% Settings for TAU profiler %%%
if [[ $isAsCluster == 1 ]] ; then
 path= "$path /home/jlinford/TAU/pdtoolkit-3.20/x86_64/bin"
 path= "$path /home/jlinford/TAU/tau2/x86_64/bin"
 path= "$path /home/jlinford/TAU/tau-2.23b0/x86_64/bin"
 export TAU_OPTIONS="-optVerbose -optPreProcess -optContinueBeforeOMP"
 export TAU_VERBOSE=1
 export TAU_PROFILE=1
 export TAU_TRACE=0
 export TAU_OPENMP_RUNTIME=1
 export TAU_OPENMP_RUNTIME_EVENTS=1
 export TAU_OPENMP_RUNTIME_CONTEXT=region
 export TAU_TRACK_MEMORY_LEAKS=0
 alias  set_tau "source /home/jlinford/TAU/tau.csh"
 alias  pe_load 'taudb_loadtrial -c geos-chem -m "APPLICATION=geos-chem:EXPERIMENT=tutorial"'
fi

# %%%%% Settings for Ghostview %%%%%
export GS_DEVICE="x11"

#==============================================================================
# %%%%% Display options %%%%%
#==============================================================================

# %%% Settings for colorization %%%
export GREP_OPTIONS=--color=auto
export GREP_COLOR=32
export LS_COLORS='no=00:fi=00:di=01;33:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;37:*.tgz=01;37:*.arj=01;37:*.taz=01;37:*.lzh=01;37:*.zip=01;37:*.z=01;37:*.Z=01;37:*.gz=01;37:*.bz2=01;37:*.deb=01;37:*.rpm=01;37:*.jar=01;37:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.flac=01;35:*.mp3=01;35:*.mpc=01;35:*.ogg=01;35:*.wav=01;35:'

#==============================================================================
# %%%%% User-defined shortcut aliases %%%%%
#==============================================================================

# %%%%% Aliases for general Unix commands %%%%
alias  disk="du -h -s -c"
alias  g="grep -in"
alias  gf="gifview"
alias  gt="grep -in --text"
alias  gf="gifview -a"
alias  gvs="gv --orientation=seascape"
alias  m="less"
alias  me="xterm &"
alias  pan="$HOME/bin/panoply.sh &"
alias  proc="ps -ef | grep $USER | sort"
alias  pu="rm *~"
alias  sb=". ~/.bash_profile"
alias  ssh="ssh -X -A"
alias  gsh="ssh -xT"
alias  tf="tail --follow"
alias  zap="kill -9"

# %%%%% Aliases for directory listing %%%%%
alias  ls="ls -CF --time-style=long-iso --color=auto"
alias  l1="ls -1"
alias  ll="ls -l"
alias  llt="ls -lt"
alias  lltm="ls -lt | less"
alias  la="ls -a"
alias  lla="ls -la"
alias  llh="ls -lh"

# %%%%% Aliases for transferring files %%%%%
# This command sets up a ssh connection to Odyssey in the background. For it
# to work properly, you need to make sure Host OD is defined in your
# ~/.ssh/config file. You will be prompted for your password and verification
# code. Once a connection is established, you will not need to enter this
# information for subsequent ssh or scp commands.
alias sshod="ssh -Y -C -o ServerAliveInterval=30 -fN OD"

# %%%%% Sun Grid Engine commands for AS %%%%%
if [[ $isAsCluster == 1 ]] ; then
 alias  qq="qconf -spl"
 alias  qs="qstat -f"
 alias  qj="qstat -u $USER"
 alias  qja='qstat -u "*"'
 alias  qa="qacct -j"
fi

# %%%%% Source a file with your own personal aliases and settings %%%%%
# %%%%% You can keep separate copies of these on AS and Odyssey   %%%%%
if [[ -f $HOME/.my_personal_aliases ]] ; then
 . $HOME/.my_personal_aliases
fi

#==============================================================================
# %%%%% Alter standard path settings if needed %%%%%
#==============================================================================

if [[ $isOdyssey == 1 ]] ; then

 # %%%%% Add GC_LIB to the LD_LIBRARY_PATH %%%%%
 export LD_LIBRARY_PATH="$GC_LIB:$LD_LIBRARY_PATH"

fi
#EOC
