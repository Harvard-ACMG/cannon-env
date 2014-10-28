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
#  We have included settings for both the Odyssey cluster (rc.fas.harvard.edu)
#  and for the Jacob-group Atmospheric Sciences cluster (as.harvard.edu). 
#  These settings are blocked out with if stateements such as:
#
#     if [[ $isOdyssey == 1   ]]; then ...    # Settings for Odyssey
#     if [[ $isAsCluster == 1 ]]; then ...    # Settings for AS cluster
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
umask 022          # Make files readable by everyone by default
set autolist       # Turn on list completion
set correct        #
set color          # 
set colorcat       # 
set filesc         #
set emacs          # Use an emacs-style command-line editing interface
set history        # Turn on history of commands
set ignoreeof      # Prevent EOF from terminating the shell

#==============================================================================
# %%%%% Settings for loading software modules %%%%%
#==============================================================================
if [[ $isOdyssey == 1 ]] ; then

 # Turn on lmod modules
 export LMOD_COLORIZE=yes
 source new-modules.sh

 # Load newer modules w/ "lmod".  Note the naming convention is much simpler.
 module load git

 # These modules were defined with the older "module" command but are in the
 # process of being renamed during the transition to "lmod".  We still need
 # these for the GIGC/ESMF/MPI environment, so load them by their old names.
 module load legacy
 module load hpc/intel-compilers-13.0.079
 module load hpc/openmpi-1.6.2_intel-13.0.079
 module load math/IDL-8.3
fi

#==============================================================================
# %%%%% Settings for data paths %%%%%
#==============================================================================

# %%%%% Settings for GIGCsa %%%%%
export ARCH=`uname -s`

# %%%%% Settings for netCDF, HDF, etc. libraries %%%%%
if [[ $isAsCluster == 1 ]] ; then
 export GC_BIN="/opt/GEOS-Chem-Libraries/ifort/nc4/bin"
 export GC_INCLUDE="/opt/GEOS-Chem-Libraries/ifort/nc4/include"
 export GC_LIB="/opt/GEOS-Chem-Libraries/ifort/nc4/lib"
elif [[ $isOdyssey == 1 ]] ; then
 export GC_BIN="/n/home09/ryantosca/opt/bin"
 export GC_INCLUDE="/n/home09/ryantosca/opt/include"
 export GC_LIB="/n/home09/ryantosca/opt/lib"
fi
export BIN_NETCDF=$GC_BIN
export INC_NETCDF=$GC_INCLUDE
export LIB_NETCDF=$GC_LIB
export BIN_HDF5=$GC_BIN
export INC_HDF5=$GC_INCLUDE
export LIB_HDF5=$GC_LIB

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
export HEMCO_DATA_ROOT="$dataDirReadOnly/ExtData/HEMCO"
export HEMCO_DATA_ROOT_RW="$dataDir/ExtData/HEMCO"
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

# %%%%% GitHub commands %%%%%
alias  fpu="git push https://github.com/GCST/GEOS_FP"
alias  fpp="git pull https://github.com/GCST/GEOS_FP"
alias  hcou="git push https://github.com/GCST/HEMCO"
alias  hcop="git pull https://github.com/GCST/HEMCO"

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
if [[ $isAsCluster ]] ; then
 export OMP_NUM_THREADS=4
fi
export KMP_STACKSIZE=5000000

# %%%%% Settings for MPI parallelization %%%%%
if [[ $isAsCluster == 1 ]] ; then
 export MPI_HOME="/home/mlong/tools/openmpi/1.2.8-ifort"
elif [[ $isOdyssey == 1 ]] ; then
 export MPI_HOME="/n/sw/openmpi-1.6.2_intel-13.0.079"
fi
export OMPI_FC=$FC
export OMPI_CC=$CC
export OMPI_CXX=$CXX

# %%%%% Settings for IDL %%%%%
export IDL_STARTUP="$HOME/IDL/idl_startup.pro"
alias  I="cd $HOME/IDL"
alias  IG="cd $HOME/IDL/gamap2"
alias  IS="cd $HOME/IDL/tests"

# %%%%% Settings for NCL %%%%%
if [[ isAsCluster == 1 ]] ; then
 export NCARG_ROOT="/opt/ncl-6.1.2"
 export NCL4GC="/home/bmy/NCL4GC"
 PATH=$PATH:$NCL4GC
fi

# %%%%% Settings for Python %%%%%
export PYTHONSTTARTUP="$HOME/python/python_startup.py"

# %%% Settings for TAU profiler %%%
#if [[ $isAsCluster == 1 ]] ; then
#path= "$path /home/jlinford/TAU/pdtoolkit-3.20/x86_64/bin"
#path= "$path /home/jlinford/TAU/tau2/x86_64/bin"
#path= "$path /home/jlinford/TAU/tau-2.23b0/x86_64/bin"
#export TAU_OPTIONS="-optVerbose -optPreProcess -optContinueBeforeOMP"
#export TAU_VERBOSE=1
#export TAU_PROFILE=1
#export TAU_TRACE=0
#export TAU_OPENMP_RUNTIME=1
#export TAU_OPENMP_RUNTIME_EVENTS=1
#export TAU_OPENMP_RUNTIME_CONTEXT=region
#export TAU_TRACK_MEMORY_LEAKS=0
#alias  set_tau "source /home/jlinford/TAU/tau.csh"
#alias  pe_load 'taudb_loadtrial -c geos-chem -m "APPLICATION=geos-chem:EXPERIMENT=tutorial"'
#fi

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
alias  disk="du -m"
alias  g="grep -in"
alias  gf="gifview"
alias  gt="grep -in --text"
alias  gf="gifview -a"
alias  gvs="gv --orientation=seascape"
alias  m="less"
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

# %%%%% Add your personal aliases for the AS cluster here %%%%%
if [[ $isAsCluster == 1 ]] ; then

 # Local directory paths
 alias  AD="cd ~/archive/data"

 # Sun Grid Engine commands
 alias  qq="qconf -spl"
 alias  qs="qstat -f"
 alias  qj="qstat -u bmy"
 alias  qja='qstat -u "*"'
 alias  qa="qacct -j"

 # Logins from AS cluster to other machines
 alias  me="xterm &"
 alias  seas="$HOME/bin/xt -h login.seas.harvard.edu -u yantosca &"
 alias  wum="$HOME/bin/xt -h wumpus.seas.harvard.edu -u yantosca &"
 alias  nccs="$HOME/bin/xt -h login.nccs.nasa.gov -u ryantosc &"
 alias  disc="$HOME/bin/xt -h discover.nccs.nasa.gov -u ryantosc &"
 alias  dali="$HOME/bin/xt -h dali.nccs.nasa.gov -u ryantosc &"
 alias  gcfas="$HOME/bin/xt -h fas.harvard.edu -u geoschem &"
 alias  odyssey="$HOME/bin/xt -h login.rc.fas.harvard.edu -u ryantosca &"
fi

# %%%%% Add your personal aliases for Odyssey here
if [[ $isOdyssey == 1 ]] ; then
 alias  me="xterm &"
 alias  mkey="module keyword"
 alias  myscratch="cd /n/regal/jacob_lab/$USER"
fi

#==============================================================================
# %%%%% Alter standard path settings if needed %%%%%
#==============================================================================

if [[ $isOdyssey == 1 ]] ; then

 # %%%%% KLUDGE FOR ODYSSEY %%%%%
 #
 # The available OpenMPI modules labeled (Intel) are actually built with
 # ifort & gcc. The module's specified environment acts like 'mpicc' and
 # 'mpicxx' are Intel-based, when in fact they point to the GNU compilers.
 # This creates an error compiling ESMF because when ESMF looks for <math.h>,
 # it finds a version specific to Intel that DOESN'T work with mpicc/mpicxx/gcc.
 #
 # Temporary Solution: Reconfigure the CPATH environment variable to remove
 # the entries:
 #
 #   :/n/sw/intel_cluster_studio-2013/composerxe/compiler/include/
 #   :/n/sw/intel_cluster_studio-2013/composerxe/compiler/include/intel64
 #
 # thus making the GNU version in /usr/include the available and first-seen
 # version.
 #   -- Mike Long (22 Oct 2014)
 #
 CPATH=$(echo "$CPATH" | sed 's|:/n/sw/intel_cluster_studio-2013/composerxe/include/intel64||g')
 CPATH=$(echo "$CPATH" | sed 's|:/n/sw/intel_cluster_studio-2013/composerxe/include||g')
 export CPATH

 # %%%%% Add GC_LIB to the LD_LIBRARY_PATH %%%%%
 export LD_LIBRARY_PATH="$GC_LIB:$LD_LIBRARY_PATH"
fi
#EOC
