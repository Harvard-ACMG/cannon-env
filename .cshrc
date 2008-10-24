#==============================================================================
# $Id: .cshrc,v 1.34 2008/10/24 19:49:07 bmy Exp $
# 
# Bob Y's .cshrc file for all machines at Harvard (bmy, 10/23/08)
#
# .cshrc is executed every time a new Unix shell is opened on a machine
# .login is ONLY executed the first time you log into a machine
#==============================================================================

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
set    hostabbr =  `perl -e '$a=qx(uname -n); $a=~s/.as.harvard.edu//g; print $a'`

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
alias  ls          "ls -CF --time-style=long-iso"
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
alias  tf          "tail -f"
alias  vt          "setenv TERM vt100; stty dec; setenv IDL_DEVICE null"
alias  w           "w | sort"
alias  who         "who | sort"
alias  xemacs      "xemacs >& /dev/null"
alias  zap         "kill -9"

# IDL settings
setenv IDL_STARTUP "$home/IDL/idl_startup.pro"
alias  I           "cd $home/IDL"
alias  IG          "cd $home/IDL/gamap2"
alias  IM          "cd $home/IDL/makefile"
alias  IS          "cd $home/IDL/tests"
    
# Logins to other machines (delete what you don't need)
alias  nccs        "$home/bin/xt -h login.nccs.nasa.gov &"
alias  sol         "$home/bin/xt -h sol &"
alias  tet         "$home/bin/xt -h tethys &"
alias  seas        "$home/bin/xt -h login.seas.harvard.edu -u yantosca &"
alias  bgf         "$home/bin/xt -h boggle.seas.harvard.edu -u yantosca &"
alias  pro         "$home/bin/xt -h prometheus &"

# For monitoring /as2/dao directories
alias  AL          "cd /as2/data/dao/logs"
alias  GL          "ls -lt /as2/data/dao/logs | more"
alias  GI          "ls -l /as2/data/dao/input | more"
alias  GT          "ls -lt /as2/data/dao/input | more"

# CVS commands
setenv CVS_RSH     "ssh"
alias  cvsl        "cvs -d /as/home/ctm/bmy/CVS"

# Sun Grid Engine commands
alias  qq          "qconf -spl"
alias  qs          "qstat -f"
alias  qj          "qstat -f -j"

#==============================================================================
# Data directory aliases on /as/data-rw/geos/ (aka /as/data writeable disk)
#
# NOTE: These are Bob Y's aliases.  You may not need these.
#==============================================================================

# GEOS_05x05 
alias  XCC    "cd /as/data-rw/geos/GEOS_0.5x0.666_CH"
alias  XCC5   "cd /as/data-rw/geos/GEOS_0.5x0.666_CH.d/GEOS_5"
    
# GEOS_1x1 
alias  X1     "cd /as/data-rw/geos/GEOS_1x1"
alias  XC     "cd /as/data-rw/geos/GEOS_1x1_CH"
alias  XC3    "cd /as/data-rw/geos/GEOS_1x1_CH/GEOS_3"
alias  XN     "cd /as/data-rw/geos/GEOS_1x1_NA"
alias  XN3    "cd /as/data-rw/geos/GEOS_1x1_NA/GEOS_3"
	
# GEOS_1x1.25.d
alias  X14    "cd /as/data-rw/geos/GEOS_4_v4"
alias  X1F    "cd /as/data-rw/geos/GEOS_4_flk"
		    
# GEOS_2x2.5	   
alias  X2     "cd /as/data-rw/geos/GEOS_2x2.5"
alias  X21    "cd /as/data-rw/geos/GEOS_2x2.5/GEOS_1"
alias  X2S    "cd /as/data-rw/geos/GEOS_2x2.5/GEOS_S"
alias  X23    "cd /as/data-rw/geos/GEOS_2x2.5/GEOS_3"
alias  X24    "cd /as/data-rw/geos/GEOS_2x2.5/GEOS_4_v4"
alias  X2F    "cd /as/data-rw/geos/GEOS_2x2.5/GEOS_4_flk"
alias  X25    "cd /as/data-rw/geos/GEOS_2x2.5/GEOS_5"
		   
# GEOS_4x5	   
alias  X4     "cd /as/data-rw/geos/GEOS_4x5"
alias  X41    "cd /as/data-rw/geos/GEOS_4x5.d/GEOS_1"
alias  X4S    "cd /as/data-rw/geos/GEOS_4x5.d/GEOS_S"
alias  X43    "cd /as/data-rw/geos/GEOS_4x5.d/GEOS_3"
alias  X44    "cd /as/data-rw/geos/GEOS_4x5.d/GEOS_4_v4"
alias  X4F    "cd /as/data-rw/geos/GEOS_4x5.d/GEOS_4_flk"
alias  X45    "cd /as/data-rw/geos/GEOS_4x5.d/GEOS_5"

# GCAP
alias  XG     "cd /as/data-rw/ctm/GCAP_4x5/"
alias  XG4    "cd /as/data-rw/ctm/GCAP_4x5/AGRID"

#==============================================================================
# Data directory aliases on /as2/data/ (all machines)
#
# NOTE: These are Bob Y's aliases.  You may not need these.
#==============================================================================

# GEOS_05x05 
alias  YCC    "cd /as2/pub/ftp/pub/geos-chem/data/GEOS_0.5x0.666_CH.d/"
alias  YCC5   "cd /as2/pub/ftp/pub/geos-chem/data/GEOS_0.5x0.666_CH.d/GEOS_5"
alias  YNA    "cd /as2/pub/ftp/pub/geos-chem/data/GEOS_0.5x0.666_NA.d"
alias  YNA5   "cd /as2/pub/ftp/pub/geos-chem/data/GEOS_0.5x0.666_NA.d/GEOS_5"

# GEOS_1x1
alias  Y1     "cd /as2/pub/ftp/pub/geos-chem/data/GEOS_1x1"
alias  YC     "cd /as2/pub/ftp/pub/geos-chem/data/GEOS_1x1_CH"
alias  YC3    "cd /as2/pub/ftp/pub/geos-chem/data/GEOS_1x1_CH.d/GEOS_3"
alias  YN     "cd /as2/pub/ftp/pub/geos-chem/data/GEOS_1x1_NA"
alias  YN3    "cd /as2/pub/ftp/pub/geos-chem/data/GEOS_1x1_NA/GEOS_3"

# GEOS_1x1.25.d
alias  Y14    "cd /as2/pub/ftp/pub/geos-chem/data/GEOS_1x1.25.d/GEOS_4_v4"
alias  Y1F    "cd /as2/pub/ftp/pub/geos-chem/data/GEOS_1x1.25.d/GEOS_4_flk"

# GEOS_2x2.5
alias  Y2     "cd /as2/pub/ftp/pub/geos-chem/data/GEOS_2x2.5"
alias  Y21    "cd /as2/pub/ftp/pub/geos-chem/data/GEOS_2x2.5.d/GEOS_1"
alias  Y2S    "cd /as2/pub/ftp/pub/geos-chem/data/GEOS_2x2.5.d/GEOS_S"
alias  Y23    "cd /as2/pub/ftp/pub/geos-chem/data/GEOS_2x2.5.d/GEOS_3"
alias  Y24    "cd /as2/pub/ftp/pub/geos-chem/data/GEOS_2x2.5.d/GEOS_4_v4"
alias  Y2F    "cd /as2/pub/ftp/pub/geos-chem/data/GEOS_2x2.5.d/GEOS_4_flk"
alias  Y25    "cd /as2/pub/ftp/pub/geos-chem/data/GEOS_2x2.5.d/GEOS_5"

# GEOS_4x5
alias  Y4     "cd /as2/pub/ftp/pub/geos-chem/data/GEOS_4x5"
alias  Y41    "cd /as2/pub/ftp/pub/geos-chem/data/GEOS_4x5.d/GEOS_1"
alias  Y4S    "cd /as2/pub/ftp/pub/geos-chem/data/GEOS_4x5.d/GEOS_S"
alias  Y43    "cd /as2/pub/ftp/pub/geos-chem/data/GEOS_4x5.d/GEOS_3"
alias  Y44    "cd /as2/pub/ftp/pub/geos-chem/data/GEOS_4x5.d/GEOS_4_v4"
alias  Y4F    "cd /as2/pub/ftp/pub/geos-chem/data/GEOS_4x5.d/GEOS_4_flk"
alias  Y45    "cd /as2/pub/ftp/pub/geos-chem/data/GEOS_4x5.d/GEOS_5"

# ESMF data
alias  E      "cd /as2/pub/ftp/pub/geos-chem/data/ESMF_Data"

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
alias  Nc     "cd /as/home/ctm/bmy/NRT-ARCTAS/Code.ARCTAS"
alias  Nl     "cd /as/home/ctm/bmy/NRT-ARCTAS/logs"
alias  Np     "cd /as/home/ctm/bmy/NRT-ARCTAS/perl"
alias  Nr     "cd /as/home/ctm/bmy/NRT-ARCTAS/run"

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
#  Specific settings for interactive SGI Origin machines (SOL, EUROPA, HERA)
#==============================================================================
else if ( $sysname == "irix-6" ) then

    # Max out machine limits
    limit cputime      unlimited
    limit filesize     unlimited
    limit datasize     unlimited
    limit stacksize    unlimited  
    limit memoryuse    unlimited
    limit descriptors  unlimited
    limit threads      unlimited
    limit vmemoryuse   unlimited

    # Need to use "ghostview -swap on the Origin machines
    alias gv          "ghostview -swap"

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
