# $Id: Makefile,v 1.1 2009/08/13 18:09:14 bmy Exp $
#------------------------------------------------------------------------------
#          Harvard University Atmospheric Chemistry Modeling Group            !
#------------------------------------------------------------------------------
#BOP
#
# !MODULE: Makefile (in env subdirectory)
#
# !DESCRIPTION: Makefile for building the documentation (in PDF and 
#  PostScript formats) for the system setup files.
#\\
#\\
# !REMARKS:
# To build the documentation, call "make" with the following syntax:
#
#   make TARGET [ OPTIONAL-FLAGS ]
#
# To display a complete list of options, type "make help".
#
# You must have the LaTeX utilities (latex, dvips, dvipdf) installed
# on your system in order to build the documentation.
#
# !REVISION HISTORY: 
#  13 Aug 2009 - R. Yantosca - Initial version
#EOP
#------------------------------------------------------------------------------
#BOC

#==============================================================================
# Initialization
#==============================================================================

# Define variables
SHELL   = /bin/sh

.PHONY: all clean help

all: doc

clean:
	rm -f *.tex *.ps *.pdf

#==============================================================================
# Build documentation for system environment files
#==============================================================================

# Source files 
SRC1 =       \
./intro.txt  \
./.login     \
./.cshrc     \
./startup    \
./xt

# LaTeX etc. files
TEX1 = SystemEnvFiles.tex
DVI1 = SystemEnvFiles.dvi
PDF1 = SystemEnvFiles.pdf
PS1  = SystemEnvFiles.ps

doc:
	rm -f $(TEX1)
	protex -fS $(SRC1) > $(TEX1)
	latex $(TEX1)
	latex $(TEX1)
	latex $(TEX1)
	dvipdf $(DVI1) $(PDF1)
	dvips $(DVI1) -o $(PS1)
	rm -f *.aux *.dvi *.log *.toc  

#==============================================================================
# Help screen
#==============================================================================

help:
	@echo 'Usage: make TARGET [ OPTIONAL-FLAGS ]'
	@echo ''
	@echo 'TARGET may be one of the following:'
	@echo 'doc      Builds documentation (*.ps, *.pdf) for both source code and makefiles (default)'
	@echo 'all      Synonym for "doc"'
	@echo 'clean    Removes all files (*.tex, *.ps, *.pdf)'
	@echo 'help     Displays this help screen'
#EOC