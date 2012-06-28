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
#  08 Jun 2011 - R. Yantosca - Now replace "/lustre/home" w/ "/home" in pwd
#  06 Jul 2011 - R. Yantosca - Updated aliases for SGE commands
#  24 Oct 2011 - R. Yantosca - Updated netCDF4, HDF5 paths for GEOS-5.7.2
#  22 Nov 2011 - R. Yantosca - Added Git aliases for presentations repo
#  06 Dec 2011 - R. Yantosca - Added aliases for jacobsgroup-prn printer
#  08 Dec 2011 - R. Yantosca - Use paths beginning with /as or /home
#  16 Dec 2011 - R. Yantosca - Now point to the readonly /as/group/geos/data
#                              from Sol.  Point to the read-write mount
#                              /as/group/geos-rw/data from other machines.
#  20 Dec 2011 - R. Yantosca - Use sed to replace /mnt from filepaths
#  04 Jan 2012 - R. Yantosca - Updated Pierce Hall printer names
#  04 Jan 2012 - R. Yantosca - Updated aliases for GEOS-5 chdir commands
#  13 Jan 2012 - R. Yantosca - Added chdir commands for GEOS-5.7 dirs
#  06 Jun 2012 - R. Yantosca - Updated for login.as.harvard.edu login
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
setenv BASEDIR220 /home/bmy/opt/Baselibs/v2.2.0/x86_64-unknown-linux-gnu/ifort

# Baselibs v3.1.5 (essential build with Intel 11.1)
setenv BASEDIR315 /home/bmy/opt/Baselibs/v3.1.5/x86_64-unknown-linux-gnu/ifort

# Baselibs v3.1.7 (full build with Intel 11.1)
setenv BASEDIR317 /home/bmy/opt/Baselibs/v3.1.7/x86_64-unknown-linux-gnu/ifort

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

#------------------------------------------------------------------------------
# Reset for locally-defined netCDF, HDF5 libraries; for reading GEOS-5.7.2 data
# These are now located in /opt/GEOS-Chem-Libraries/ifort path
setenv BL_INC_NETCDF   /opt/GEOS-Chem-Libraries/ifort/nc4/include
setenv BL_LIB_NETCDF   /opt/GEOS-Chem-Libraries/ifort/nc4/lib
setenv BL_INC_HDF5     /opt/GEOS-Chem-Libraries/ifort/nc4/include
setenv BL_LIB_HDF5     /opt/GEOS-Chem-Libraries/ifort/nc4/lib
setenv BL_LIB_ZLIB     /opt/GEOS-Chem-Libraries/ifort/nc4/lib

# For the new GEOS-Chem-Libraries path (bmy, 5/9/12)
setenv GC_BIN          /opt/GEOS-Chem-Libraries/ifort/nc4/bin
setenv GC_INCLUDE      /opt/GEOS-Chem-Libraries/ifort/nc4/include 
setenv GC_LIB          /opt/GEOS-Chem-Libraries/ifort/nc4/lib
alias  gcnc            $GC_BIN/nc-config
alias  gcnf            $GC_BIN/nf-config

# For various other utility programs that use netCDF (bmy, 5/11/12)
setenv BIN_NETCDF      $GC_BIN
setenv INC_NETCDF      $GC_INCLUDE
setenv LIB_NETCDF      $GC_LIB
#------------------------------------------------------------------------------

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
alias  g           "grep -in"
alias  gt          "grep -in --text"
alias  gf          "gifview -a"
alias  gvs         "gv --orientation=seascape"
alias  ls          "ls -CF --time-style=long-iso --color=auto"
alias  l1          "ls -1"
alias  ll          "ls -l"
alias  llt         "ls -lt"
alias  la          "ls -a"
alias  lla         "ls -la"
alias  llh         "ls -lh"
alias  m           "less"
alias  proc        "ps -ef | grep $user | sort"
alias  pu          "rm *~"
alias  ssh         "ssh -X -A"
alias  tf          "tail --follow"
alias  w           "w | sort"
alias  who         "who | sort"
alias  zap         "kill -9"

# Directory display (replacing paths w/ generic /home, /as, /as2 links)
alias  pwd         "pwd | sed 's/\/mnt\/as\/home/\/home/'| sed 's/\/mnt\/as/\/as/'| sed 's/\/mnt\/lstr00\/srv\/home/\/home/'| sed 's/\/mnt\/lstr04\/srv\/home/\/home/' | sed 's/\/mnt\/lstr05\/srv/\/as/'| sed 's/\/mnt\/lstr01\/srv/\/as2/' | sed 's/\/mnt\/group/\/as\/group/' | sed 's/\/lustre\/group/\/as\/group/' | sed 's/\/lustre\/pub/\/as2\/pub/' | sed 's/\/lustre\/home/\/home/'"

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
alias  bob         "$home/bin/xt -h bmy.as.harvard.edu -u bmy &"
alias  seas        "$home/bin/xt -h login.seas.harvard.edu -u yantosca &"
alias  wum         "$home/bin/xt -h wumpus.seas.harvard.edu -u yantosca &"

# Git commands (on rhea.as.harvard.edu)
setenv MY_GIT_DIR  "/as/pub/git/bmy"
alias  MG          "cd $MY_GIT_DIR; pwd"
alias  gci         "git cvsimport -v -d /home/bmy/CVS"
alias  gui         "git gui &"
alias  gk          "gitk &"
alias  gka         "gitk --all &"
alias  gl          "git log"
alias  glo         "git log --oneline"

# Website commands
setenv ACMG_WEB    "/as/pub-rw/git/jhy/acmg.seas.harvard.edu"
alias  WG          "cd $home/web/geos"
alias  WH          "cd $home/web/htdocs"
alias  WP          "cd $home/web/publications"
alias  WE          "cd $home/web/presentations"
alias  wpg         "git pull $ACMG_WEB/geos master"
alias  wph         "git pull $ACMG_WEB/htdocs master"
alias  wpp         "git pull $ACMG_WEB/publications master"
alias  wpe         "git pull $ACMG_WEB/presentations master"

# Sun Grid Engine commands
alias  qq          "qconf -spl"
alias  qs          "qstat -f"
alias  qj          "qstat -u bmy"
alias  qja         'qstat -u "*"'
alias  qa          "qacct -j"

# Aliases for the "jacobsgroup-prn" printer
alias  pr_j_1s    "lpr -H print.seas.harvard.edu -P jacobsgroup-prn -o sides=one-sided"
alias  pr_j_2p    "lpr -H print.seas.harvard.edu -P jacobsgroup-prn -o sides=two-sided-long-edge"
alias  pr_j_2l    "lpr -H print.seas.harvard.edu -P jacobsgroup-prn -o sides=two-sided-short-edge" 
alias  pq_j       "lpq -h print.seas.harvard.edu -P jacobsgroup-prn"
alias  rm_j       "lprm -h print.seas.harvard.edu -P jacobsgroup-prn"

# Aliases for the "prc-1flr-clr" printer
alias  pr_1f_1s   "lpr -H print.seas.harvard.edu -P prc-1flr-clr2 -o sides=one-sided"
alias  pr_1f_2p   "lpr -H print.seas.harvard.edu -P prc-1flr-clr2 -o sides=two-sided-long-edge"
alias  pr_1f_2l   "lpr -H print.seas.harvard.edu -P prc-1flr-clr2 -o sides=two-sided-short-edge" 
alias  pq_1f      "lpq -h print.seas.harvard.edu -P prc-1flr-clr2"
alias  rm_1f      "lprm -h print.seas.harvard.edu -P prc-1flr-clr2"

# Aliases for the "prc-2flr-clr" printer
alias  pr_2f_1s   "lpr -H print.seas.harvard.edu -P prc-2flr-clr2 -o sides=one-sided"
alias  pr_2f_2p   "lpr -H print.seas.harvard.edu -P prc-2flr-clr2 -o sides=two-sided-long-edge"
alias  pr_2f_2l   "lpr -H print.seas.harvard.edu -P prc-2flr-clr2 -o sides=two-sided-short-edge" 
alias  pq_2f      "lpq -h print.seas.harvard.edu -P prc-2flr-clr2"
alias  rm_2f      "lprm -h print.seas.harvard.edu -P prc-2flr-clr2"

# GEOS-5.2.0 code & script directories
alias  G           "cd $home/regrid/GEOS_5/"
alias  G2b         "cd $home/regrid/GEOS_5/bin"
alias  G2c         "cd $home/regrid/GEOS_5/Code"
alias  G2d         "cd $home/regrid/GEOS_5/doc"
alias  G2p         "cd $home/regrid/GEOS_5/perl"
alias  G2L         "ls -lt $home/regrid/GEOS_5/logs/ | less"

# GEOS-5.7 code & script directories
alias  G           "cd $home/regrid/GEOS_5.7/"
alias  Gb          "cd $home/regrid/GEOS_5.7/bin"
alias  Gc          "cd $home/regrid/GEOS_5.7/Code"
alias  Gd          "cd $home/regrid/GEOS_5.7/doc"
alias  Gj          "cd $home/regrid/GEOS_5.7/jobs"
alias  Gp          "cd $home/regrid/GEOS_5.7/perl"
alias  GL          "ls -lt $home/regrid/GEOS_5.7/logs/ | less"

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

set dataDir =      "/as/group/geos-rw/data"                  # Read-write mount

alias  XC          "cd $dataDir/GEOS_0.5x0.666_CH"           # GEOS 0.5x0.666 
alias  XC5         "cd $dataDir/GEOS_0.5x0.666_CH.d/GEOS_5"    
alias  XS          "cd $dataDir/GEOS_0.25x0.3125_SEA4CRS.d/"
alias  XS57        "cd $dataDir/GEOS_0.25x0.3125_SEA4CRS.d/GEOS_5.7"    
alias  XN          "cd $dataDir/GEOS_0.5x0.666_NA"             
alias  XN5         "cd $dataDir/GEOS_0.5x0.666_NA.d/GEOS_5"    
alias  X1          "cd $dataDir/GEOS_1x1"                    # GEOS 1x1
alias  XNN         "cd $dataDir/GEOS_NATIVE"                 # GEOS NATIVE
alias  X2          "cd $dataDir/GEOS_2x2.5"                  # GEOS 2 x 2.5
alias  X23         "cd $dataDir/GEOS_2x2.5.d/GEOS_3"
alias  X24         "cd $dataDir/GEOS_2x2.5.d/GEOS_4_v4"
alias  X25         "cd $dataDir/GEOS_2x2.5.d/GEOS_5"
alias  X257        "cd $dataDir/GEOS_2x2.5.d/GEOS_5.7"
alias  X4          "cd $dataDir/GEOS_4x5"                    # GEOS 4x5
alias  X43         "cd $dataDir/GEOS_4x5.d/GEOS_3"
alias  X44         "cd $dataDir/GEOS_4x5.d/GEOS_4_v4"
alias  X45         "cd $dataDir/GEOS_4x5.d/GEOS_5"
alias  X457        "cd $dataDir/GEOS_4x5.d/GEOS_5.7"
alias  X4M         "cd $dataDir/GEOS_4x5.d/MERRA"

unset dataDir

# Met field scratch directories
alias  ME          "cd /as/scratch/tmp/bmy/MERRA"

#==============================================================================
#  Specific settings for interactive Linux login machines and clusters
#==============================================================================
if ( $sysname == "linux-rhel5-x86_64" || $sysname  == "linux-fc16-x86_64" ) then

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
# Settings for OpenMP 
#==============================================================================

# Number of threads
setenv OMP_NUM_THREADS 4

# Reset the child stack size to a large positive number
# (It's OK if this is larger than the max value, it's just a kludge)
setenv KMP_STACKSIZE 500000000

#==============================================================================
# Display message of the day (if it exists)
#==============================================================================
if ( -f "/etc/motd" ) cat /etc/motd
#EOC
