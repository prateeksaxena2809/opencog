
IF (HAVE_SERVER)
	ADD_SUBDIRECTORY(benchmark)
	IF (HAVE_CYTHON)
		ADD_SUBDIRECTORY(python)
	ENDIF (HAVE_CYTHON)
	IF (HAVE_ZMQ AND TBB_FOUND)
		ADD_SUBDIRECTORY(events)
	ENDIF (HAVE_ZMQ AND TBB_FOUND)
ENDIF (HAVE_SERVER)

# ----------------------------------------
# Link-grammar cogserver module

IF (HAVE_GUILE AND HAVE_LINK_GRAMMAR)
	ADD_LIBRARY (LGDictModule SHARED
		LGDictModule
	)

	TARGET_LINK_LIBRARIES (LGDictModule lg-dict server)

	INSTALL (TARGETS LGDictModule
		LIBRARY DESTINATION "lib${LIB_DIR_SUFFIX}/opencog/modules"
	)
ENDIF (HAVE_GUILE AND HAVE_LINK_GRAMMAR)

# Build the query (pattern-matching) cogserver module
ADD_LIBRARY(QueryModule SHARED
	QueryModule.cc
)
TARGET_LINK_LIBRARIES(QueryModule
	${ATOMSPACE_LIBRARIES}
)

INSTALL (TARGETS QueryModule
	LIBRARY DESTINATION "lib${LIB_DIR_SUFFIX}/opencog/modules"
)
# ----------------------------------------
# The SQL persistance module

ADD_LIBRARY (PersistModule SHARED
	PersistModule.cc
)

TARGET_LINK_LIBRARIES(PersistModule
	# server  # needed for definition of _ZTIN7opencog7RequestE
	${ATOMSPACE_LIBRARIES}
)

INSTALL (TARGETS PersistModule
	LIBRARY DESTINATION "lib${LIB_DIR_SUFFIX}/opencog/modules"
)

# ----------------------------------------
# Build the RuleEngine cogserver module

ADD_LIBRARY(RuleEngineModule SHARED
	RuleEngineModule.cc
)

TARGET_LINK_LIBRARIES(RuleEngineModule
	${ATOMSPACE_LIBRARIES}
)

INSTALL (TARGETS RuleEngineModule
	LIBRARY DESTINATION "lib${LIB_DIR_SUFFIX}/opencog/modules"
)
# ----------------------------------------
# Surface realization cogserver module

IF (HAVE_GUILE AND HAVE_LINK_GRAMMAR)
	ADD_LIBRARY (SuRealModule SHARED
		SuRealModule
	)

	ADD_DEPENDENCIES (SuRealModule
		nlp_atom_types
	)

	TARGET_LINK_LIBRARIES(SuRealModule
		sureal
	)

	INSTALL (TARGETS SuRealModule
		LIBRARY DESTINATION "lib${LIB_DIR_SUFFIX}/opencog/modules"
	)
ENDIF (HAVE_GUILE AND HAVE_LINK_GRAMMAR)
