#---------
#
# CppUTest  Makefile
#
#----------

#Set this to @ to keep the makefile quiet
ifndef SILENCE
	SILENCE = @
endif

#--- Inputs ----#
COMPONENT_NAME = Example
CPPUTEST_HOME = /usr
CPPUTEST_SCRIPTS = share/cpputest
TARGET_PLATFORM = x86_64-linux-gnu
TOPDIR = $(shell dirname `pwd`)

CPP_PLATFORM = Gcc
CPPUTEST_CXXFLAGS = -std=c++17

# This line is overriding the default new macros.  This is helpful
# when using std library includes like <list> and other containers
# so that memory leak detection does not conflict with stl.
#CPPUTEST_MEMLEAK_DETECTOR_NEW_MACRO_FILE = -include ApplicationLib/ExamplesNewOverrides.h
SRC_DIRS = $(TOPDIR)/optional-testcase/src

TEST_SRC_DIRS = AllTests

INCLUDE_DIRS =\
  $(SRC_DIRS)\
  AllTests\
  $(CPPUTEST_HOME)/include

# File from CppUTest distribution that simplifies building tests.
include MakefileWorker.mk
