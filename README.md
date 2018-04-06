# Compilation of Fluent `UDF`s

The procedure to compile `UDF`s via command line is briefly described on
the `makefile_nt.udf` file, quoting:

> Usage:
>
> - Change file name `'makefile_nt.udf'` to `'makefile'`.
> - Place the makefile file in the target dir.
> - Place the helper file `'user_nt.udf'` in same directory.
> - Edit `user_nt.udf` file.
> - Execute an `'nmake'`  (no arguments needed).

To use these instructions, first the directory folder for the
compilation must be created and the files placed in the correct folders.

## `UDF` versions

:exclamation: The newer versions of Fluent are always executed in
parallel version. If serial execution is selected on the launcher, a
parallel run with just one node is created!

## Compilation procedure

For all versions, the procedure for compilation is the same. So a single
script to perform the compilation was developed. The steps taken on this
procedure are detailed below.

## `UDF` directory tree

The directory three for the generation of the `UDF` library is shown
here, a simple description of the content of each folder is presented.

```text
library-name/         -> The name that identifies the library on Fluent.
├── src/              -> Contains copies of source files (.h and .c).
└── win64|lin64/      -> Architecture
    ├── 2d/           ┌
    ├── 2d_host/      │ Different possible configurations for the given
    ├── 2d_node/      │ architecture.
    ├── 2ddp/         │
    ├── 2ddp_host/    │ Versions without the 'dp' component are single
    ├── 2ddp_node/    │ precision, while the ones containing it are
    ├── 3d/           │ double precision.
    ├── 3d_host/      │
    ├── 3d_node/      │ Versions 'host' have code to run in the host
    ├── 3ddp/         │ node of a parallel run and the 'node' have the
    ├── 3ddp_host/    │ library compiled to the compute nodes.
    └── 3ddp_node/    └
```

This directory tree is generated automatically by the compilation script
under the `build` directory.

## Files copying

All source code files (.h and .c files) must be copied into the
directory `library-name/src/`. The files `makefile_nt.udf` must be
copied to all version directories and renamed to `makefile`. The final
copy needed is to place the `user_nt.udf` also inside every version 
folder.

## `user_nt.udf` editing

The file `user_nt.udf` must be edited to define the version to be
compiled, the 


## Commands to set the terminal

```bat
set FLUENT_INC=%AWP_ROOT190%\fluent
set PATH=%PATH%;%FLUENT_INC%\ntbin\win64
```
