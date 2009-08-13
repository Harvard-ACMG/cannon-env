# $Id: .cshrc,v 1.35 2009/08/13 18:09:15 bmy Exp $
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
#EOP
#------------------------------------------------------------------------------
#BOC

#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#%%%    THE FOLLOWING THINGS HAVE TO BE PLACED BEFORE THE STATEMENT         %%%
#%%%   WHICH EXITS IF WE ARE NOT ON AN INTERACTIVE SHELL (bmy, 9/26/08)     %%%
#%%%         THIS IS NECESSARY FOR THE SUN GRID ENGINE SCHEDULER            %%%
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

#-------------------------------------------------------------------------
# Set environment variables for ESMF & other libraries (bmy, 6/4/08)
# %%% NOTE: Everyone except Bob, Philippe, & Claire can ignore this! %%%
#-------------------------------------------------------------------------

# For OpenMPI
setenv MPI_HOME   /opt/openmpi
setenv MPI_INC    $MPI_HOME/include
setenv MPI_LIB    $MPI_HOME/lib
setenv OMPI_FC    ifort
setenv OMPI_CC    icc
setenv OMPI_CXX   icpc

# For Baselibs
setenv ROOTDIR    /home/bmy/NASA/basedir
setenv BASEDIR    $ROOTDIR/x86_64-unknown-linux-gnu/ifort/Linux
setenv BASELIB    $BASEDIR/lib
setenv ESMF_INC   $BASEDIR/include/esmf
setenv ESMF_LIB   $BASEDIR/lib
setenv HDF_BIN    $BASEDIR/bin
setenv HDF_INC    $BASEDIR/include/hdf
setenv HDF_LIB    $BASEDIR/lib
setenv HDFEOS_INC $BASEDIR/include/hdfeos
setenv HDFEOS_LIB $BASEDIR/lib
setenv JPEG_LIB   $BASEDIR/lib
setenv NETCDF_BIN $BASEDIR/bin
setenv NETCDF_INC $BASEDIR/include/netcdf
setenv NETCDF_LIB $BASEDIR/lib
setenv SZLIB_LIB  $BASEDIR/lib
setenv ZLIB_LIB   $BASEDIR/lib

# for MAPL
setenv ESMADIR    /home/bmy/NASA/esmadir

# For GNU C-Compiler
setenv GCC_LIB    /usr/lib/gcc/x86_64-redhat-linux/4.1.2/

# Set the local root directory for CVS version control
setenv CVSROOT    /home/bmy/CVS            

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
alias  disk        "du -k"
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
alias  m           "more"
alias  mail        "Mail"
alias  proc        "ps -ef | grep $user | sort"
alias  pu          "rm *~"
alias  qj          "pbstat"
alias  ssh         "ssh -X"
alias  tf          "tail --follow"
alias  vt          "setenv TERM vt100; stty dec; setenv IDL_DEVICE null"
alias  w           "w | sort"
alias  who         "who | sort"
alias  zap         "kill -9"

# Directory display (replacing paths w/ generic /home, /as, /as2 links)
alias  pwd         "pwd | sed 's/\/mnt\/lstr04\/srv\/home\/b\/bmy/\/home\/bmy/' | sed 's/\/mnt\/lstr05\/srv/\/as/'| sed 's/\/mnt\/lstr01\/srv/\/as2/' | sed 's/\/mnt\/group/\/as\/group/' | sed 's/\/lustre\/group/\/as\/group/' | sed 's/\/lustre\/pub/\/as2\/pub/'"

# IDL settings
setenv IDL_STARTUP "$home/IDL/idl_startup.pro"
alias  I           "cd $home/IDL"
alias  IG          "cd $home/IDL/gamap2"
alias  IM          "cd $home/IDL/makefile"
alias  IS          "cd $home/IDL/tests"
    
# Logins to other machines (delete what you don't need)
alias  nccs        "$home/bin/xt -h login.nccs.nasa.gov &"
alias  arg         "$home/bin/xt -h argus &"
alias  sol         "$home/bin/xt -h sol &"
alias  tet         "$home/bin/xt -h tethys &"
alias  seas        "$home/bin/xt -h login.seas.harvard.edu -u yantosca &"
alias  bgf         "$home/bin/xt -h boggle.seas.harvard.edu -u yantosca &"
alias  pro         "$home/bin/xt -h prometheus &"
alias  rhe         "$home/bin/xt -h rhea &"

# For monitoring /as2/dao directories
alias  AL          "cd /as/group/geos/dao/logs"
alias  GL          "ls -lt /as/group/geos/dao/logs | more"

# CVS commands (now on rhea.as.harvard.edu)
setenv CVS_RSH     "ssh"
alias  cvsl        "cvs -d /home/bmy/CVS"
alias  remacs      "ssh -X bmy@rhea emacs &"

# Sun Grid Engine commands
alias  qq          "qconf -spl"
alias  qs          "qstat -f"
alias  qj          "qstat -f -j"

# Printer aliases
alias  lport       "lpr -o sides=two-sided-long-edge -P prc-1flr-clr"
alias  lland       "lpr -o sides=two-sided-short-edge -P prc-1flr-clr"
alias  lpq         "lpq -P prc-1flr-clr"

# Column code development directory aliases
alias  RC         "cd ~/gc_column/run/column"
alias  RR         "cd ~/gc_column/run/reference"
alias  CB         "cd ~/gc_column/Code/GeosCore"
alias  CH         "cd ~/gc_column/Code/Headers"
alias  CL         "cd ~/gc_column/Code/loop"
alias  CR         "cd ~/gc_column/Code/ref"

# Updated GEOS-5 code & script directories (bmy, 7/31/09)
alias  M          "cd $home/regrid/GEOS_5/"
alias  Mb         "cd $home/regrid/GEOS_5/bin"
alias  Mc         "cd $home/regrid/GEOS_5/Code"
alias  Md         "cd $home/regrid/GEOS_5/doc"
alias  Mp         "cd $home/regrid/GEOS_5/perl"
alias  ML         "ls -lt $home/regrid/GEOS_5/logs/ | more"

#==============================================================================
# Data directory aliases on /as/group/geos/data
#
# NOTE: These are Bob Y's aliases.  You may not need these.
#==============================================================================

# Data directory
set dataDir = "/as/group/geos/data"

# GEOS_05x0667
alias  XCC    "cd $dataDir/GEOS_0.5x0.666_CH"
alias  XCC5   "cd $dataDir/GEOS_0.5x0.666_CH.d/GEOS_5"
alias  XNA    "cd $dataDir/GEOS_0.5x0.666_NA"
alias  XNA5   "cd $dataDir/GEOS_0.5x0.666_NA.d/GEOS_5"
   
# GEOS_1x1 
alias  X1     "cd $dataDir/GEOS_1x1"
alias  XC     "cd $dataDir/GEOS_1x1_CH"
alias  XC3    "cd $dataDir/GEOS_1x1_CH/GEOS_3"
alias  XN     "cd $dataDir/GEOS_1x1_NA"
alias  XN3    "cd $dataDir/GEOS_1x1_NA/GEOS_3"
	
# GEOS_1x1.25.d
alias  X14    "cd $dataDir/GEOS_4_v4"
alias  X1F    "cd $dataDir/GEOS_4_flk"
		    
# GEOS_2x2.5	   
alias  X2     "cd $dataDir/GEOS_2x2.5"
alias  X21    "cd $dataDir/GEOS_2x2.5/GEOS_1"
alias  X2S    "cd $dataDir/GEOS_2x2.5/GEOS_S"
alias  X23    "cd $dataDir/GEOS_2x2.5/GEOS_3"
alias  X24    "cd $dataDir/GEOS_2x2.5/GEOS_4_v4"
alias  X2F    "cd $dataDir/GEOS_2x2.5/GEOS_4_flk"
alias  X25    "cd $dataDir/GEOS_2x2.5/GEOS_5"
		   
# GEOS_4x5	   
alias  X4     "cd $dataDir/GEOS_4x5"
alias  X41    "cd $dataDir/GEOS_4x5.d/GEOS_1"
alias  X4S    "cd $dataDir/GEOS_4x5.d/GEOS_S"
alias  X43    "cd $dataDir/GEOS_4x5.d/GEOS_3"
alias  X44    "cd $dataDir/GEOS_4x5.d/GEOS_4_v4"
alias  X4F    "cd $dataDir/GEOS_4x5.d/GEOS_4_flk"
alias  X45    "cd $dataDir/GEOS_4x5.d/GEOS_5"

# Dao met field disks
alias  D5     "cd /as/group/geos/dao/bin/GEOS_5"
alias  DP     "cd /as/group/geos/dao/bin/perl"

# Unset the temp variable
unset dataDir

#==============================================================================
# Data directory aliases on /as2/data/ (all machines)
#
# NOTE: These are Bob Y's aliases.  You may not need these.
#==============================================================================

# Data directory
set dataDir = "/as2/pub/ftp/pub/geos-chem/data"

# GEOS_05x05 
alias  YCC    "cd $dataDir/GEOS_0.5x0.666_CH/"
alias  YCC5   "cd $dataDir/GEOS_0.5x0.666_CH.d/GEOS_5"
alias  YNA    "cd $dataDir/GEOS_0.5x0.666_NA.d"
alias  YNA5   "cd $dataDir/GEOS_0.5x0.666_NA.d/GEOS_5"

# GEOS_1x1
alias  Y1     "cd $dataDir/GEOS_1x1"
alias  YC     "cd $dataDir/GEOS_1x1_CH"
alias  YC3    "cd $dataDir/GEOS_1x1_CH.d/GEOS_3"
alias  YN     "cd $dataDir/GEOS_1x1_NA"
alias  YN3    "cd $dataDir/GEOS_1x1_NA/GEOS_3"

# GEOS_1x1.25.d
alias  Y14    "cd $dataDir/GEOS_1x1.25.d/GEOS_4_v4"
alias  Y1F    "cd $dataDir/GEOS_1x1.25.d/GEOS_4_flk"

# GEOS_2x2.5
alias  Y2     "cd $dataDir/GEOS_2x2.5"
alias  Y21    "cd $dataDir/GEOS_2x2.5.d/GEOS_1"
alias  Y2S    "cd $dataDir/GEOS_2x2.5.d/GEOS_S"
alias  Y23    "cd $dataDir/GEOS_2x2.5.d/GEOS_3"
alias  Y24    "cd $dataDir/GEOS_2x2.5.d/GEOS_4_v4"
alias  Y2F    "cd $dataDir/GEOS_2x2.5.d/GEOS_4_flk"
alias  Y25    "cd $dataDir/GEOS_2x2.5.d/GEOS_5"

# GEOS_4x5
alias  Y4     "cd $dataDir/GEOS_4x5"
alias  Y41    "cd $dataDir/GEOS_4x5.d/GEOS_1"
alias  Y4S    "cd $dataDir/GEOS_4x5.d/GEOS_S"
alias  Y43    "cd $dataDir/GEOS_4x5.d/GEOS_3"
alias  Y44    "cd $dataDir/GEOS_4x5.d/GEOS_4_v4"
alias  Y4F    "cd $dataDir/GEOS_4x5.d/GEOS_4_flk"
alias  Y45    "cd $dataDir/GEOS_4x5.d/GEOS_5"

# ESMF data
alias  E      "cd $dataDir/ESMF_Data"

#=============================================================================
# NRT-ARCTAS directories 
#
# NOTE: These are Bob Y's aliases.  You may not need these.
#==============================================================================

# Public directories for NRT-ARCTAS output on /as2/pub/ftp/pub
alias  N      "cd /as2/pub/ftp/pub/geos-chem/NRT-ARCTAS"
alias  NB     "cd /as2/pub/ftp/pub/geos-chem/NRT-ARCTAS/bpch"
alias  NC     "cd /as2/pub/ftp/pub/geos-chem/NRT-ARCTAS/columns"
alias  NF     "cd /as2/pub/ftp/pub/geos-chem/NRT-ARCTAS/flighttrack"
alias  NE     "cd /as2/pub/ftp/pub/geos-chem/NRT-ARCTAS/flambe"
alias  NL     "cd /as2/pub/ftp/pub/geos-chem/NRT-ARCTAS/logs"
alias  NP     "cd /as2/pub/ftp/pub/geos-chem/NRT-ARCTAS/plane"
alias  NR     "cd /as2/pub/ftp/pub/geos-chem/NRT-ARCTAS/restarts"
alias  NT     "cd /as2/pub/ftp/pub/geos-chem/NRT-ARCTAS/timeseries"

# Local directories
alias  Nc     "cd /home/bmy/NRT-ARCTAS/Code.ARCTAS"
alias  Nl     "cd /home/bmy/NRT-ARCTAS/logs"
alias  Np     "cd /home/bmy/NRT-ARCTAS/perl"
alias  Nr     "cd /home/bmy/NRT-ARCTAS/run"

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
# Display message of the day (if it exists)
#==============================================================================
if ( -f "/etc/motd" ) cat /etc/motd
#EOC
