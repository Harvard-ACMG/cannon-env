#------------------------------------------------------------------------------
#          Harvard University Atmospheric Chemistry Modeling Group            !
#------------------------------------------------------------------------------
#BOP
#
# !MODULE: .my_module_settings.sh
#
# !DESCRIPTION: File containing bash functions to load software packages,
#  compilers, and libraries into your Unix environment via the "module"
#  command.  Also defines the relevant environment variables for netCDF
#  etc. library paths.
#\\
#\\
# !CALLING SEQUENCE:
#  export MY_COMPILER="gfortran63"
#  source ~/.my_module_settings.sh
#  SetupMyEnvironment
#  unset MY_COMPILER
#
# !REMARKS:
#  (1) Used in conjunction with the .bashrc_OD file, which is the Jacob-group
#       .bashrc specifically for Odyssey.
#  (2) You can add more module load statements to the functions
#       LoadBasePackages or LoadCompilers as you wish.
#
# !REVISION HISTORY:
#  Change directory to ~/env and type 'gitk' at the prompt to browse
#  revision history.
#EOP
#------------------------------------------------------------------------------
#BOC

#=============================================================================
# SetupMyEnvironment: Loads software packages and compilers via "module load"
#=============================================================================
function SetupMyEnvironment() {

  # Echo info if it's an interactive session
  if [[ $- = *i* ]] ; then
    echo "Loading modules for compiler $MY_COMPILER, please wait ..."
  fi
    
  # Initialize the module system
  InitModules

  # Load packages used by all logins
  LoadBasePackages

  # Load a specific compiler version
  LoadCompilers $MY_COMPILER

  # Define environment variables for netCDF library & include paths
  DefineNetcdfVars

  # Display loaded modules if it's an interactive session
  if [[ $- = *i* ]] ; then
    module list
  fi
}

#=============================================================================
# InitModules: Initializes the LMOD module system
#=============================================================================
function InitModules() {
  export LMOD_COLORIZE=yes
  source new-modules.sh
  export MODULEPATH="/n/holylfs/EXTERNAL_REPOS/GEOS-CHEM/modulefiles:$MODULEPATH"
  module purge
}

#=============================================================================
# LoadBasePackages: Loads software modules common to all Unix sessions
#=============================================================================
function LoadBasePackages() {

  # Unset variables
  unset PYTHON_HOME
  unset PERL_HOME
  unset IDL_HOME
  unset EMACS_HOME

  # Load modules
  module load git
  module load perl
  module load IDL
  module load python/3.4.1-fasrc01
}

#=============================================================================
# LoadCompilers: Loads a particular compiler + MPI + netCDF combination
#
# NOTES: 
# (1) You can look up the module combinations on the RC Portal page.
#       https://portal.rc.fas.harvard.edu/apps/modules
# (2) Use mvapich2 as the MPI version for all netcdf modules.
#=============================================================================
function LoadCompilers() {

  # Unset variables
  unset CC
  unset CXX
  unset FC
  unset F77
  unset F90
  unset NETCDF_BIN
  unset NETCDF_HOME
  unset NETCDF_INCLUDE
  unset NETCDF_LIB
  unset NETCDF_FORTRAN_BIN
  unset NETCDF_FORTRAN_HOME
  unset NETCDF_FORTRAN_INCLUDE
  unset NETCDF_FORTRAN_LIB
    
  # gfortran 6.3.0
  if [[ x$1 == "xgfortran63" ]]; then
    module load gcc/6.3.0-fasrc01       mvapich2/2.2-fasrc01
    module load netcdf/4.1.3-fasrc09

  # gfortran 6.2.0
  elif [[ x$1 == "xgfortran62" ]]; then
    module load gcc/6.2.0-fasrc01       mvapich2/2.2-fasrc01 
    module load netcdf/4.4.0-fasrc04    netcdf-fortran/4.4.3-fasrc02

  # gfortran 5.2.0 (same config as for GCHP)
  elif [[ x$1 == "xgfortran52" ]]; then
    module load gcc/5.2.0-fasrc01       mvapich2/2.2a-fasrc01
    module load netcdf/4.3.3.1-fasrc02  netcdf-fortran/4.4.2-fasrc01

  # gfortran 4.8.2
  elif [[ x$1 == "xgfortran48" ]]; then
    module load gcc/4.8.2-fasrc01       mvapich2/2.0-fasrc03
    module load netcdf/4.3.2-fasrc03    netcdf-fortran/4.4.0-fasrc02
    module load tau/2.24.1-fasrc01

  # ifort 15
  elif [[ x$1 == "xifort15" ]]; then
    module load intel/15.0.0-fasrc01    mvapich2/2.2-fasrc01
    module load netcdf/4.1.3-fasrc09    tau/2.24.1-fasrc01

  # ifort 11 (Jacob-group licenses)
  else
    module load intel/11.1              GEOS-Chem-Libraries

    # Manually point to GEOS-Chem-Libraries build
    export NETCDF_HOME=/n/seasasfs01/opt/odyssey/GEOS-Chem-Libraries/ifort/nc4
    export NETCDF_INCLUDE=${NETCDF_HOME}/include
    export NETCDF_LIB=${NETCDF_HOME}/lib
    export NETCDF_BIN=${NETCDF_HOME}/bin
    export PATH="$NETCDF_BIN:$PATH"

    # GEOS-Chem-Libraries does not set the compiler variables
    # so we must do that manually here (bmy, 1/27/16)
    export FC=ifort
    export CC=icc
    export CXX=icpc

  fi    

  # For some software packages, we also need to define
  # either F99 or F77 environment variables
  export F90=$FC
  export F77=$FC
}

#=============================================================================
# DefineNetcdfVars: Exports various environment variables related to the
# netCDF home, lib, include, and bin paths (etc.)
#=============================================================================
function DefineNetcdfVars() {

  # Unset variables
  unset GC_BIN
  unset GC_INCLUDE
  unset GC_LIB
  unset GC_F_BIN
  unset GC_F_INCLUDE
  unset GC_F_LIB
  unset BIN_NETCDF
  unset INC_NETCDF
  unset LIB_NETCDF
    
  export ARCH=`uname -s`

  # NETCDF_HOME
  if [[ "x$NETCDF_HOME" == x ]]; then
    export NETCDF_HOME=`nc-config --prefix`
  fi

  # NETCDF_BIN
  if [[ "x$NETCDF_BIN" == x ]]; then
    export NETCDF_BIN="$NETCDF_HOME/bin"
  fi

  # GC_LIB (deprecated)
  if [[ "x$NETCDF_LIB" == x ]]; then 
    export GC_LIB="$NETCDF_HOME/lib"
  else
    export GC_LIB="$NETCDF_LIB"
  fi

  # GC_INCLUDE (deprecated)
  if [[ "x$NETCDF_INCLUDE" == x ]]; then
    export GC_INCLUDE="$NETCDF_HOME/include"
  else
    export GC_INCLUDE="$NETCDF_INCLUDE"         
  fi

  # GC_BIN (deprecated)
  export GC_BIN="$NETCDF_HOME/bin"

  # If the netCDF-Fortran library is loaded separately
  # then also define the GC_F_* environment variables (deprecated)
  if [[ "x$NETCDF_FORTRAN_HOME" != x ]]; then
    export NETCDF_FORTRAN_BIN="$NETCDF_FORTRAN_HOME/bin"
    export GC_F_BIN="$NETCDF_FORTRAN_HOME/bin"
    export GC_F_INCLUDE="$NETCDF_FORTRAN_INCLUDE"
    export GC_F_LIB="$NETCDF_FORTRAN_LIB"
  fi

  # Set flags for backwards compatibility w/ other code packages
  export BIN_NETCDF=$GC_BIN
  export INC_NETCDF=$GC_INCLUDE
  export LIB_NETCDF=$GC_LIB    
}
#EOC
