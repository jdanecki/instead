# - Try to locate GTK3
# This module defines:
#
#  GTK3_INCLUDE_DIRS
#  GTK3_LIBRARIES
#  GTK3_FOUND
#  GTK3_DEFINITIONS
#

FIND_PACKAGE(PkgConfig)

PKG_CHECK_MODULES(PC_GTK3 REQUIRED gtk+-3.0)

SET(GTK3_INCLUDE_DIRS ${PC_GTK3_INCLUDE_DIRS})

FOREACH(LIB ${PC_GTK3_LIBRARIES})
	FIND_LIBRARY(FOUND${LIB} HINTS ${PC_GTK3_LIBRARY_DIRS} NAMES ${LIB})
	LIST(APPEND GTK3_LIBRARIES ${FOUND${LIB}})
ENDFOREACH(LIB)

IF(GTK3_INCLUDE_DIRS AND GTK3_LIBRARIES)
	SET(GTK3_FOUND TRUE)
ENDIF(GTK3_INCLUDE_DIRS AND GTK3_LIBRARIES)

IF(GTK3_FOUND)
	IF(NOT GTK3_FIND_QUIETLY)
		MESSAGE(STATUS "Found GTK3: -I${GTK3_INCLUDE_DIRS}, ${GTK3_LIBRARIES}")
	ENDIF(NOT GTK3_FIND_QUIETLY)
ELSE(GTK3_FOUND)
	IF(GTK3_FIND_REQUIRED)
		MESSAGE(FATAL_ERROR "Could not find GTK3")
	ENDIF(GTK3_FIND_REQUIRED)
ENDIF(GTK3_FOUND)

MARK_AS_ADVANCED(GTK3_INCLUDE_DIRS GTK3_LIBRARIES GTK3_FOUND)
