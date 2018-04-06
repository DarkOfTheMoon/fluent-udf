@echo off
:: Script to create the directory structure of the Fluent UDF library.
:: The structure is described in the section "UDF directory tree" of
:: the file "fluent-udf.md".

:: Create the base library directory.
md libudf
:: Create the directory for the source code and the directory for the
:: current architecture.
cd libudf
md src
md win64

:: Create the directories for all versions.
cd win64
set versions = 2d 3d
set parallel_versions = _host _node
:: Optimize this loop later
(for %%d in (%dimensions%) do ( 
    md %%d 
    (for %%p in (%parallel_versions%) do ( 
	    md %%d%%parallel
	))
    md %%ddp
    (for %%p in (%parallel_versions%) do ( 
		md %%ddp%%p
    ))
))

