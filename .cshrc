#------------------------------------------------------------------------------
#          Harvard University Atmospheric Chemistry Modeling Group            !
#------------------------------------------------------------------------------
#BOP
#
# !MODULE: .cshrc
#
# !DESCRIPTION: Bob Y's .cshrc file for all Harvard Atmospheric Chemistry
#  modeling group machines.
#\\
#\\
# !CALLING SEQUENCE:
#  source ~/.cshrc
#
# !REMARKS:
# .cshrc is executed every time a new Unix shell is opened on a machine
# .login is ONLY executed the first time you log into a machine
#
# !REVISION HISTORY: 
#  13 Aug 2009 - R. Yantosca - Added ProTeX headers
#  07 Oct 2009 - R. Yantosca - Now "setenv OMP_NUM_THREADS 4" on Rhea
#  07 Oct 2009 - R. Yantosca - Now "setenv OMP_NUM_THREADS 4" on Prometheus
#  09 Oct 2009 - R. Yantosca - Added print server to lpr, lpq commands
#  03 Dec 2009 - R. Yantosca - Removed obsolete /as2/pub/ftp/pub directory 
#                              aliases; now use /as/group/geos/data.
#  15 Mar 2010 - R. Yantosca - Added aliases for Git
#  01 Apr 2010 - R. Yantosca - Reordered environment variables section
#  06 Aug 2010 - R. Yantosca - Added directories for MERRA data
#  13 Aug 2010 - R. Yantosca - Added aliases for MERRA data
#  22 Sep 2010 - R. Yantosca - Modified "qj" alias to "qstat -u bmy"
#EOP
#------------------------------------------------------------------------------
#BOC

#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#%%%    THE FOLLOWING THINGS HAVE TO BE PLACED BEFORE THE STATEMENT         %%%
#%%%   WHICH EXITS IF WE ARE NOT ON AN INTERACTIVE SHELL (bmy, 3/26/10)     %%%
#%%%         THIS IS NECESSARY FOR THE SUN GRID ENGINE SCHEDULER            %%%
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

#------------------------------------------------------------------------
# Set environment variables for ESMF & other libraries 
# Assumes Intel/GCC configuration for OpenMPI and ESMF (bmy, 3/26/10)
#-------------------------------------------------------------------------

#%%%%% LIBRARY PATHS BASED ON NASA BASELIBS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

# Baselibs 2.2.0 (full build with Intel 10.1)
setenv BASEDIR220      ~bmy/opt/Baselibs/v2.2.0/x86_64-unknown-linux-gnu/ifort

# Baselibs v3.1.5 (essential build with Intel 11.1)
setenv BASEDIR315      ~bmy/opt/Baselibs/v3.1.5/x86_64-unknown-linux-gnu/ifort

# Baselibs v3.1.7 (full build with Intel 11.1)
setenv BASEDIR317      ~bmy/opt/Baselibs/v3.1.7/x86_64-unknown-linux-gnu/ifort

# Pick one of the Baselibs
setenv BASEDIR         $BASEDIR315
setenv ARCH            Linux

# Baselib include paths
setenv BL_INC_CURL     $BASEDIR/$ARCH/include/curl
setenv BL_INC_ESMF     $BASEDIR/$ARCH/include/esmf
setenv BL_INC_HDF      $BASEDIR/$ARCH/include/hdf
setenv BL_INC_HDFEOS   $BASEDIR/$ARCH/include/hdfeos
setenv BL_INC_HDF5     $BASEDIR/$ARCH/include/hdf5
setenv BL_INC_HDFEOS5  $BASEDIR/$ARCH/include/hdfeos5
setenv BL_INC_JPEG     $BASEDIR/$ARCH/include/jpeg
setenv BL_INC_NETCDF   $BASEDIR/$ARCH/include/netcdf
setenv BL_INC_SZLIB    $BASEDIR/$ARCH/include/szlib
setenv BL_INC_ZLIB     $BASEDIR/$ARCH/include/zlib

# Baselib library paths
setenv BL_LIB_CURL     $BASEDIR/$ARCH/lib
setenv BL_LIB_ESMF     $BASEDIR/$ARCH/lib
setenv BL_LIB_HDF      $BASEDIR/$ARCH/lib
setenv BL_LIB_HDFEOS   $BASEDIR/$ARCH/lib
setenv BL_LIB_HDF5     $BASEDIR/$ARCH/lib
setenv BL_LIB_HDFEOS5  $BASEDIR/$ARCH/lib
setenv BL_LIB_JPEG     $BASEDIR/$ARCH/lib
setenv BL_LIB_NETCDF   $BASEDIR/$ARCH/lib
setenv BL_LIB_NCO      $BASEDIR/$ARCH/lib
setenv BL_LIB_SZLIB    $BASEDIR/$ARCH/lib
setenv BL_LIB_ZLIB     $BASEDIR/$ARCH/lib

# Baselib binary paths
setenv BL_BIN_CURL     $BASEDIR/$ARCH/bin
setenv BL_BIN_ESMF     $BASEDIR/$ARCH/bin
setenv BL_BIN_HDF      $BASEDIR/$ARCH/bin
setenv BL_BIN_HDFEOS   $BASEDIR/$ARCH/bin
setenv BL_BIN_HDF5     $BASEDIR/$ARCH/bin
setenv BL_BIN_HDFEOS5  $BASEDIR/$ARCH/bin
setenv BL_BIN_JPEG     $BASEDIR/$ARCH/bin
setenv BL_BIN_NETCDF   $BASEDIR/$ARCH/bin
setenv BL_BIN_SZLIB    $BASEDIR/$ARCH/bin
setenv BL_BIN_ZLIB     $BASEDIR/$ARCH/bin

#%%%%% OTHER ENVIRONMENT VARIABLES %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

# Compilers: Intel Fortran and GNU C/C++ compilers
setenv FC              ifort
setenv F90             $FC
setenv F77             $FC
setenv CC              gcc   
setenv CXX             g++
setenv OMPI_FC         $FC
setenv OMPI_CC         $CC
setenv OMPI_CXX        $CXX

# For GEOS-Chem column code (use Baselibs 3.1.5 for now!!!)
alias  COL             "cd ~/GEOSCHEMsa/src/Components/GEOSCHEMchem_GridComp"
setenv ESMADIR         /home/bmy/GEOSCHEMsa
setenv ESMA_FC         mpif90
setenv USER_FFLAGS     "-extend-source -traceback -O2"
setenv ESMF_LDFLAGS    "-lmpi_cxx -lstdc++ -limf -lrt -ldl"

# Set the local root directory for CVS version control
setenv CVSROOT         /home/bmy/CVS            

# Exit if this isn't an interactive shell
if ( ! $?prompt ) exit(0)

#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#%%%        THE FOLLOWING THINGS CAN BE PLACED AFTER THE STATEMENT          %%%
#%%%   WHICH EXITS IF WE ARE NOT ON AN INTERACTIVE SHELL (bmy, 9/26/08)     %%%
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

#==============================================================================
# System settings for all machines
#==============================================================================

# System name (e.g. "irix-6", "solaris-10", etc.)
set    sysname  =  `whatami`

# Host name (e.g. "sol.as.harvard.edu")
set    hostname =  `uname -n`

# Abbreviated host name (e.g. "sol" instead of "sol.as.harvard.edu")
set    hostabbr  = `uname -n | sed 's/.as.harvard.edu//'`

# Turn on file correction
set    correct  =  all
set    filec 

# History settings
set    history  =  200
set    savehist =  50   

# Don't overwrite existing files 
set    noclobber 

# Default include path (e.g. for C compilation)
set    inc      =  /usr/include

# Prevent EOF from terminating the shell
set    ignoreeof          

# Time display setting
set    time     =  (30 "%Uu %Ss %E %P %X+%Dk %I+%Oio %Fpf+%Ww %Mk")

# Set prompt to display directory name 
set    prompt   =  "[! $hostabbr $cwd:t]% "
alias  cd  'set old=$cwd; chdir \!*; set prompt = "[! $hostabbr $cwd:t]% "'

# Set messages on
set    notify
mesg   y

#----------------------------------
# Default terminal color settings
#----------------------------------

# Set the colors to my preferences
# Get the string below by typing "dircolors ~/.dircolors.db"
setenv LS_COLORS 'no=00:fi=00:di=01;33:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;37:*.tgz=01;37:*.arj=01;37:*.taz=01;37:*.lzh=01;37:*.zip=01;37:*.z=01;37:*.Z=01;37:*.gz=01;37:*.bz2=01;37:*.deb=01;37:*.rpm=01;37:*.jar=01;37:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.flac=01;35:*.mp3=01;35:*.mpc=01;35:*.ogg=01;35:*.wav=01;35:'

# to get list of completions with the tab key, and in color!
set    autolist
set    color
set    colorcat

# grep colorized output (32 is green, list of colors here:
# http://www.termsys.demon.co.uk/vtansi.htm#colors
setenv GREP_OPTIONS --color=auto
setenv GREP_COLOR 32

#==============================================================================
# Unix command aliases for all machines (you can edit these!)
#==============================================================================

# General aliases
alias  AD          "cd ~/archive/data"
alias  disk        "du -m"
alias  ED          "cd ~/ESMF/dev"
alias  EO          "cd ~/ESMF/dev/output/doc"
alias  g           "grep -in"
alias  gf          "gifview -a"
alias  ls          "ls -CF --time-style=long-iso --color=auto"
alias  l1          "ls -1"
alias  ll          "ls -l"
alias  llt         "ls -lt"
alias  la          "ls -a"
alias  lla         "ls -la"
alias  llh         "ls -lh"
alias  m           "less"
alias  mail        "Mail"
alias  proc        "ps -ef | grep $user | sort"
alias  pu          "rm *~"
alias  ssh         "ssh -X -A"
alias  tf          "tail --follow"
alias  w           "w | sort"
alias  who         "who | sort"
alias  zap         "kill -9"

# Directory display (replacing paths w/ generic /home, /as, /as2 links)
alias  pwd         "pwd | sed 's/\/mnt\/lstr00\/srv\/home/\/home/'|  sed 's/\/mnt\/lstr04\/srv\/home/\/home/' | sed 's/\/mnt\/lstr05\/srv/\/as/'| sed 's/\/mnt\/lstr01\/srv/\/as2/' | sed 's/\/mnt\/group/\/as\/group/' | sed 's/\/lustre\/group/\/as\/group/' | sed 's/\/lustre\/pub/\/as2\/pub/'"

# IDL settings
setenv IDL_STARTUP "$home/IDL/idl_startup.pro"
alias  I           "cd $home/IDL"
alias  IG          "cd $home/IDL/gamap2"
alias  IS          "cd $home/IDL/tests"

# KPP settings    
setenv KPP_HOME    "$home/KPP/kpp-2.2.1.December2006"
set    path =      ( $path $home/KPP/kpp-2.2.1.December2006/bin )
alias  KPP         "cd $KPP_HOME"

# Logins to other machines (delete what you don't need)
alias  nccs        "$home/bin/xt -h login.nccs.nasa.gov &"
alias  arg         "$home/bin/xt -h argus &"
alias  sol         "$home/bin/xt -h sol &"
alias  pro         "$home/bin/xt -h prometheus &"
alias  rhe         "$home/bin/xt -h rhea &"
alias  seas        "$home/bin/xt -h login.seas.harvard.edu -u yantosca &"
alias  wum         "$home/bin/xt -h wumpus.seas.harvard.edu -u yantosca &"
alias  gmao        "ftp ftp-priv.as.harvard.edu"

# Git commands (on rhea.as.harvard.edu)
setenv MY_GIT_DIR  "/as/pub/git/bmy"
alias  MG          "cd $MY_GIT_DIR; pwd"
alias  gci         "git cvsimport -v -d /home/bmy/CVS"
alias  gui         "git gui &"
alias  gk          "gitk &"
alias  gka         "gitk --all &"

# Website commands
setenv ACMG_WEB    "/as/pub/git/jhy/acmg.seas.harvard.edu"
alias  WG          "cd $home/web/geos"
alias  WH          "cd $home/web/htdocs"
alias  WP          "cd $home/web/publications"
alias  wpg         "git pull $ACMG_WEB/geos master"
alias  wph         "git pull $ACMG_WEB/htdocs master"
alias  wpp         "git pull $ACMG_WEB/publications master"

# Sun Grid Engine commands
alias  qq          "qconf -spl"
alias  qs          "qstat -f"
alias  qj          "qstat -u bmy"

# Aliases for the "pj" printer
alias  pr_pj      "lpr -H print.seas.harvard.edu -P pj"
alias  pq_pj      "lpq -h print.seas.harvard.edu -P pj"
alias  rm_pj      "lprm -h print.seas.harvard.edu -P pj"

# Aliases for the "prc-1flr-clr" printer
alias  pr_1f_1s   "lpr -H print.seas.harvard.edu -P prc-1flr-clr -o sides=one-sided"
alias  pr_1f_2p   "lpr -H print.seas.harvard.edu -P prc-1flr-clr -o sides=two-sided-long-edge"
alias  pr_1f_2l   "lpr -H print.seas.harvard.edu -P prc-1flr-clr -o sides=two-sided-short-edge" 
alias  pq_1f      "lpq -h print.seas.harvard.edu -P prc-1flr-clr"
alias  rm_1f      "lprm -h print.seas.harvard.edu -P prc-1flr-clr"

# Aliases for the "prc-2flr-clr" printer
alias  pr_2f_1s   "lpr -H print.seas.harvard.edu -P prc-2flr-clr -o sides=one-sided"
alias  pr_2f_2p   "lpr -H print.seas.harvard.edu -P prc-2flr-clr -o sides=two-sided-long-edge"
alias  pr_2f_2l   "lpr -H print.seas.harvard.edu -P prc-2flr-clr -o sides=two-sided-short-edge" 
alias  pq_2f      "lpq -h print.seas.harvard.edu -P prc-2flr-clr"
alias  rm_2f      "lprm -h print.seas.harvard.edu -P prc-2flr-clr"

# Column code development directory aliases
alias  RC          "cd ~/gc_column/run/column"
alias  RR          "cd ~/gc_column/run/reference"
alias  CB          "cd ~/gc_column/Code/GeosCore"
alias  CH          "cd ~/gc_column/Code/Headers"
alias  CL          "cd ~/gc_column/Code/loop"
alias  CR          "cd ~/gc_column/Code/ref"

# GEOS-5 code & script directories
alias  G           "cd $home/regrid/GEOS_5/"
alias  Gb          "cd $home/regrid/GEOS_5/bin"
alias  Gc          "cd $home/regrid/GEOS_5/Code"
alias  Gd          "cd $home/regrid/GEOS_5/doc"
alias  Gp          "cd $home/regrid/GEOS_5/perl"
alias  GL          "ls -lt $home/regrid/GEOS_5/logs/ | less"

# Updated MERRA code & script directories
alias  M           "cd $home/regrid/MERRA/"
alias  Mb          "cd $home/regrid/MERRA/bin"
alias  Mc          "cd $home/regrid/MERRA/Code"
alias  Md          "cd $home/regrid/MERRA/doc"
alias  Mp          "cd $home/regrid/MERRA/perl"
alias  Ml          "cd $home/regrid/MERRA/logs"
alias  ML          "ls -lt $home/regrid/MERRA/logs/ | less"

#==============================================================================
# Data directory aliases on /as/group/geos/data
#
# NOTE: These are Bob Y's aliases.  You may not need these.
#==============================================================================

set dataDir =      "/as/group/geos/data"                     # Root data dir

alias  XCC         "cd $dataDir/GEOS_0.5x0.666_CH"           # GEOS 0.5x0.666 
alias  XCC5        "cd $dataDir/GEOS_0.5x0.666_CH.d/GEOS_5"    
alias  XNA         "cd $dataDir/GEOS_0.5x0.666_NA"             
alias  XNA5        "cd $dataDir/GEOS_0.5x0.666_NA.d/GEOS_5"    
alias  X1          "cd $dataDir/GEOS_1x1"                    # GEOS 1x1
alias  XC          "cd $dataDir/GEOS_1x1_CH"
alias  XC3         "cd $dataDir/GEOS_1x1_CH/GEOS_3"
alias  XN          "cd $dataDir/GEOS_1x1_NA"
alias  XN3         "cd $dataDir/GEOS_1x1_NA/GEOS_3"
alias  X14         "cd $dataDir/GEOS_4_v4"                   # GEOS 1 x 1.25
alias  X1F         "cd $dataDir/GEOS_4_flk" 
alias  X2          "cd $dataDir/GEOS_2x2.5"                  # GEOS 2 x 2.5
alias  X21         "cd $dataDir/GEOS_2x2.5.d/GEOS_1"
alias  X2S         "cd $dataDir/GEOS_2x2.5.d/GEOS_S"
alias  X23         "cd $dataDir/GEOS_2x2.5.d/GEOS_3"
alias  X24         "cd $dataDir/GEOS_2x2.5.d/GEOS_4_v4"
alias  X2F         "cd $dataDir/GEOS_2x2.5.d/GEOS_4_flk"
alias  X25         "cd $dataDir/GEOS_2x2.5.d/GEOS_5"
alias  X4          "cd $dataDir/GEOS_4x5"                    # GEOS 4x5
alias  X41         "cd $dataDir/GEOS_4x5.d/GEOS_1"
alias  X4S         "cd $dataDir/GEOS_4x5.d/GEOS_S"
alias  X43         "cd $dataDir/GEOS_4x5.d/GEOS_3"
alias  X44         "cd $dataDir/GEOS_4x5.d/GEOS_4_v4"
alias  X4F         "cd $dataDir/GEOS_4x5.d/GEOS_4_flk"
alias  X45         "cd $dataDir/GEOS_4x5.d/GEOS_5"
alias  X4M         "cd $dataDir/GEOS_4x5.d/MERRA"

unset dataDir

# Met field scratch directories
alias  D5          "cd /as/group/geos/dao/bin/GEOS_5"
alias  DP          "cd /as/group/geos/dao/bin/perl"
alias  ME          "cd /as/scratch/tmp/bmy/MERRA"

#==============================================================================
#  Specific settings for interactive Linux login machines and clusters
#==============================================================================
if ( $sysname  == "linux-rhel5-x86_64" ) then

    # Max out machine limits
    limit cputime      unlimited
    limit filesize     unlimited
    limit datasize     unlimited
    limit stacksize    unlimited
    limit coredumpsize unlimited
    limit memoryuse    unlimited
    limit vmemoryuse   unlimited
    limit descriptors  unlimited
    limit memorylocked unlimited
    limit maxproc      unlimited

    # GhostScript 
    setenv GS_DEVICE  "x11"

#==============================================================================
# Specific settings for other machines
#==============================================================================
else
 
    # Max out machine limits
    limit cputime      unlimited
    limit filesize     unlimited
    limit datasize     unlimited
    limit stacksize    unlimited  
    limit memoryuse    unlimited
    limit descriptors  unlimited
    limit threads      unlimited
    limit vmemoryuse   unlimited

endif

#==============================================================================
# Set the # of threads for OpenMP (selected hosts only)
#==============================================================================
if ( $hostabbr == "rhea" || $hostabbr == "prometheus" ) then
   setenv OMP_NUM_THREADS 4
endif

#==============================================================================
# Display message of the day (if it exists)
#==============================================================================
if ( -f "/etc/motd" ) cat /etc/motd
#EOC
