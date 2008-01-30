#==============================================================================
# $Id: .cshrc,v 1.11 2008/01/30 15:02:26 bmy Exp $
# 
# Bob Y's .cshrc file for all machines at Harvard (bmy, 1/29/08)
#
# .cshrc is executed every time a new Unix shell is opened on a machine
# .login is ONLY executed the first time you log into a machine
#==============================================================================

# Get default path setting for the given machine
if ( -e /usr/local/env/path ) set path = ( `/bin/cat /usr/local/env/path` )

# Exit if this isn't an interactive shell
if ( ! $?prompt ) exit(0)

#==============================================================================
# System settings for all machines
#==============================================================================

# System name (e.g. "IRIX64", "Linux")
set    sysname  =  `uname -s`

# Host name (e.g. "sol", "io")
set    hostname =  `uname -n`

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
set    prompt   =  "[! $hostname $cwd:t]% "
alias  cd  'set old=$cwd; chdir \!*; set prompt = "[! $hostname $cwd:t]% "'

# Set messages on
set    notify
mesg   y

#==============================================================================
# Unix command aliases for all machines
#==============================================================================

# General aliases
alias  AD          "cd ~/archive/data"
alias  disk        "du -k"
alias  g           "grep -in"
alias  gv          "ghostview -swap"
alias  gf          "gifview -a"
alias  ls          "ls -CF"
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
    
# Logins to other machines
alias  cto         "$home/bin/xt -h callisto &"
alias  dirac       "$home/bin/xt -h dirac &"
alias  eur         "$home/bin/xt -h europa &"
alias  her         "$home/bin/xt -h hera &"
alias  sol         "$home/bin/xt -h sol &"
alias  tet         "$home/bin/xt -h tethys &"
alias  rhe         "$home/bin/xt -h rhea &"
alias  seas        "$home/bin/xt -h login.deas.harvard.edu -u yantosca &"
alias  bgf         "$home/bin/xt -h boggle.deas.harvard.edu -u yantosca &"

# For monitoring /as2/dao directories
alias  AL          "cd /as2/data/dao/logs"
alias  GL          "ls -lt /as2/data/dao/logs | more"
alias  GI          "ls -l /as2/data/dao/input | more"
alias  GT          "ls -lt /as2/data/dao/input | more"

# CVS commands
setenv CVS_RSH     "ssh"
alias  cvsl        "cvs -d /as/home/ctm/bmy/CVS"

# PBS commands
alias  qf          "qstat -f"
alias  qq          "qstat -Q"
alias  qs          "qstat -a @europa @amalthea"
alias  qt          "qstat -a @terra @terra-02"
alias  qa          "qstat -a @altix @titan"
alias  qc          "qstat -a @ceres"

#==============================================================================
# Data directory aliases on /as2/data/ (all machines)
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

#=============================================================================
# NRT directories 
#==============================================================================

alias  N      "cd /as2/priv/ftp/priv/NRT/"
alias  NBB    "cd /as2/priv/ftp/priv/NRT/biomass"
alias  NBB1   "cd /as2/priv/ftp/priv/NRT/INTEXB/BB_emissions_daily"
alias  NB     "cd /as2/priv/ftp/priv/NRT/bpch"
alias  NC     "cd /as2/priv/ftp/priv/NRT/columns"
alias  NF     "cd /as2/priv/ftp/priv/NRT/firecounts"
alias  NFT    "cd /as2/priv/ftp/priv/NRT/flighttrack"
alias  NO     "cd /as2/priv/ftp/priv/NRT/co_ox_pl"
alias  NP     "cd /as2/priv/ftp/priv/NRT/plane"
alias  NR     "cd /as2/priv/ftp/priv/NRT/restarts"
alias  NT     "cd /as2/priv/ftp/priv/NRT/timeseries"
alias  Nc     "cd /as/home/ctm/bmy/NRT-ARCTAS/Code.ARCTAS"
alias  Nl     "cd /as/home/ctm/bmy/NRT-ARCTAS/logs"
alias  Np     "cd /as/home/ctm/bmy/NRT-ARCTAS/perl"
alias  Nr     "cd /as/home/ctm/bmy/NRT-ARCTAS/run"
alias  NA     "cd /as2/pub/ftp/pub/geos-chem/data/NRT_archive"

#==============================================================================
#  Specific settings for interactive Linux login machines and clusters
#==============================================================================
if ( $hostname == "tethys.as.harvard.edu"     || \
     $hostname == "rhea.as.harvard.edu"       || \
     $hostname == "pandora.as.harvard.edu"    || \
     $hostname == "prometheus.as.harvard.edu" || \
     $hostname == "ceres.as.harvard.edu"       ) then

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
    
    # GhostScript (Tethys/Rhea version only)
    setenv GS_DEVICE  "x11"

    #--------------------------------------------------------------------------
    # Data directory aliases on /mnt/as04 (aka /as/data writeable disk)
    #--------------------------------------------------------------------------

    # GEOS_05x05 
    alias  XCC        "cd /mnt/as04/data/mod/geos/GEOS_0.5x0.666_CH"
    alias  XCC5       "cd /mnt/as04/data/mod/geos/GEOS_0.5x0.666_CH.d/GEOS_5"
    
    # GEOS_1x1 
    alias  X1         "cd /mnt/as04/data/mod/geos/GEOS_1x1"
    alias  XC         "cd /mnt/as04/data/mod/geos/GEOS_1x1_CH"
    alias  XC3        "cd /mnt/as04/data/mod/geos/GEOS_1x1_CH/GEOS_3"
    alias  XN         "cd /mnt/as04/data/mod/geos/GEOS_1x1_NA"
    alias  XN3        "cd /mnt/as04/data/mod/geos/GEOS_1x1_NA/GEOS_3"
	
    # GEOS_1x1.25.d
    alias  X14        "cd /mnt/as04/data/mod/geos/GEOS_4_v4"
    alias  X1F        "cd /mnt/as04/data/mod/geos/GEOS_4_flk"
		    
    # GEOS_2x2.5	   
    alias  X2         "cd /mnt/as04/data/mod/geos/GEOS_2x2.5"
    alias  X21        "cd /mnt/as04/data/mod/geos/GEOS_2x2.5/GEOS_1"
    alias  X2S        "cd /mnt/as04/data/mod/geos/GEOS_2x2.5/GEOS_S"
    alias  X23        "cd /mnt/as04/data/mod/geos/GEOS_2x2.5/GEOS_3"
    alias  X24        "cd /mnt/as04/data/mod/geos/GEOS_2x2.5/GEOS_4_v4"
    alias  X2F        "cd /mnt/as04/data/mod/geos/GEOS_2x2.5/GEOS_4_flk"
    alias  X25        "cd /mnt/as04/data/mod/geos/GEOS_2x2.5/GEOS_5"
   		   
    # GEOS_4x5	   
    alias  X4         "cd /mnt/as04/data/mod/geos/GEOS_4x5"
    alias  X41        "cd /mnt/as04/data/mod/geos/GEOS_4x5.d/GEOS_1"
    alias  X4S        "cd /mnt/as04/data/mod/geos/GEOS_4x5.d/GEOS_S"
    alias  X43        "cd /mnt/as04/data/mod/geos/GEOS_4x5.d/GEOS_3"
    alias  X44        "cd /mnt/as04/data/mod/geos/GEOS_4x5.d/GEOS_4_v4"
    alias  X4F        "cd /mnt/as04/data/mod/geos/GEOS_4x5.d/GEOS_4_flk"
    alias  X45        "cd /mnt/as04/data/mod/geos/GEOS_4x5.d/GEOS_5"
    
    # GCAP
    alias  XG         "cd /mnt/as04/data/mod/geos/GCAP_4x5/"
    alias  XG4        "cd /mnt/as04/data/mod/geos/GCAP_4x5/AGRID"
    
#==============================================================================
#  Specific settings for interactive SGI Origin machines (SOL, EUROPA, HERA)
#==============================================================================
else if ( $hostname == "sol"    ||  \
          $hostname == "europa" ||  \
          $hostname == "hera" ) then

    # Max out machine limits
    limit cputime      unlimited
    limit filesize     unlimited
    limit datasize     unlimited
    limit stacksize    unlimited  
    limit memoryuse    unlimited
    limit descriptors  unlimited
    limit threads      unlimited
    limit vmemoryuse   unlimited

    #--------------------------------------------------------------------------
    # Data directory aliases on /san/as04 (aka /as/data writeable disk)
    #--------------------------------------------------------------------------

    # GEOS_05x05 
    alias  XCC       "cd /san/as04/data/mod/geos/GEOS_0.5x0.666_CH"
    alias  XCC5      "cd /san/as04/data/mod/geos/GEOS_0.5x0.666_CH.d/GEOS_5"
    
    # GEOS_1x1 
    alias  X1        "cd /san/as04/data/mod/geos/GEOS_1x1"
    alias  XC        "cd /san/as04/data/mod/geos/GEOS_1x1_CH"
    alias  XC3       "cd /san/as04/data/mod/geos/GEOS_1x1_CH/GEOS_3"
    alias  XN        "cd /san/as04/data/mod/geos/GEOS_1x1_NA"
    alias  XN3       "cd /san/as04/data/mod/geos/GEOS_1x1_NA/GEOS_3"
	
    # GEOS_1x1.25.d
    alias  X14       "cd /san/as04/data/mod/geos/GEOS_4_v4"
    alias  X1F       "cd /san/as04/data/mod/geos/GEOS_4_flk"
		    
    # GEOS_2x2.5	   
    alias  X2        "cd /san/as04/data/mod/geos/GEOS_2x2.5/"
    alias  X21       "cd /san/as04/data/mod/geos/GEOS_2x2.5/GEOS_1"
    alias  X2S       "cd /san/as04/data/mod/geos/GEOS_2x2.5/GEOS_S"
    alias  X23       "cd /san/as04/data/mod/geos/GEOS_2x2.5/GEOS_3"
    alias  X24       "cd /san/as04/data/mod/geos/GEOS_2x2.5/GEOS_4_v4"
    alias  X2F       "cd /san/as04/data/mod/geos/GEOS_2x2.5/GEOS_4_flk"
    alias  X25       "cd /san/as04/data/mod/geos/GEOS_2x2.5/GEOS_5"
   		   
    # GEOS_4x5	   
    alias  X4        "cd /san/as04/data/mod/geos/GEOS_4x5"
    alias  X41       "cd /san/as04/data/mod/geos/GEOS_4x5.d/GEOS_1"
    alias  X4S       "cd /san/as04/data/mod/geos/GEOS_4x5.d/GEOS_S"
    alias  X43       "cd /san/as04/data/mod/geos/GEOS_4x5.d/GEOS_3"
    alias  X44       "cd /san/as04/data/mod/geos/GEOS_4x5.d/GEOS_4_v4"
    alias  X4F       "cd /san/as04/data/mod/geos/GEOS_4x5.d/GEOS_4_flk"
    alias  X45       "cd /san/as04/data/mod/geos/GEOS_4x5.d/GEOS_5"
    
    # GCAP
    alias  XG        "cd /san/as04/data/mod/geos/GCAP_4x5/"
    alias  XG4       "cd /san/as04/data/mod/geos/GCAP_4x5/AGRID"

#==============================================================================
#  Specific settings for CALLISTO (SGI Origin)
#==============================================================================
else if ( $hostname == "callisto" ) then

    # Max out machine limits
    limit cputime      unlimited
    limit filesize     unlimited
    limit datasize     unlimited
    limit stacksize    unlimited  
    limit memoryuse    unlimited
    limit descriptors  unlimited
    limit threads      unlimited
    limit vmemoryuse   unlimited

    # For batch queues
    alias  qf         "qstat -f @europa"
    alias  qq         "qstat -Q @europa"
    alias  qs         "qstat -a @europa"

#==============================================================================
#  Specific settings for ALTIX or TITAN (SGI Altix)
#==============================================================================
else if ( $hostname == "altix" || $hostname == "titan" ) then

    # Max out machine limits
    limit  cputime       unlimited
    limit  filesize      unlimited
    limit  datasize      unlimited
    limit  memoryuse     unlimited
    limit  descriptors   unlimited
    limit  maxproc       unlimited   
    limit  vmemoryuse    unlimited
    limit  memorylocked  unlimited

    #--------------------------------------------------------------------------
    # Due to a limitation in the Intel IFORT v9.x compilers, you must do the
    # following in order to avoid potential memory problems with OpenMP:
    #
    # (1) Explicitly set the "stacksize" limit to 2097152 kbytes 
    #      instead of to "unlimited".
    # 
    # (2) Explicitly set the KMP_STACKSIZE environment variable
    #      to 209715200 bytes.
    #
    # For more information see the Intel IFORT release notes:
    #  http://archimede.mat.ulaval.ca/intel/fc/9.1.036/doc/Release_Notes.htm
    #
    # This usually has to be done when running GEOS-5 on Altix or Titan.
    #
    # (bmy, 8/16/07)
    #--------------------------------------------------------------------------
    limit  stacksize     2097152 kbytes
    setenv KMP_STACKSIZE 2097152000

#==============================================================================
#  Specific settings for TERRA (Sun X4100)
#==============================================================================
#else if ( $hostname == "terra" ) then
else if ( $sysname == "SunOS" ) then

    # Extra path settings 
    set   path =          ( $path /usr/ccs /usr/ccs/bin ) 

    # Max out machine limits
    limit cputime         unlimited
    limit filesize        unlimited
    limit datasize        unlimited
    limit stacksize       unlimited
    limit vmemoryuse      unlimited
    limit descriptors     unlimited
    limit coredumpsize    0             # Prevent HUGE core dump

#==============================================================================
# Specific settings for GEOS (Data Server)
#==============================================================================
else if ( $hostname == "geos.as.harvard.edu" ) then

    # Max out machine limits
    limit cputime      unlimited
    limit filesize     unlimited
    limit datasize     unlimited   
    limit stacksize    unlimited
    limit memoryuse    unlimited
    limit descriptors  unlimited
    limit maxproc      unlimited

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
