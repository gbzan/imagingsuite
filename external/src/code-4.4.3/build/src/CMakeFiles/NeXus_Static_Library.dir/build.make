# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.4

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /Applications/CMake.app/Contents/bin/cmake

# The command to remove a file.
RM = /Applications/CMake.app/Contents/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/chiaracarminati/Downloads/code-4.4.3

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/chiaracarminati/Downloads/code-4.4.3/build

# Include any dependencies generated for this target.
include src/CMakeFiles/NeXus_Static_Library.dir/depend.make

# Include the progress variables for this target.
include src/CMakeFiles/NeXus_Static_Library.dir/progress.make

# Include the compile flags for this target's objects.
include src/CMakeFiles/NeXus_Static_Library.dir/flags.make

src/CMakeFiles/NeXus_Static_Library.dir/napi.c.o: src/CMakeFiles/NeXus_Static_Library.dir/flags.make
src/CMakeFiles/NeXus_Static_Library.dir/napi.c.o: ../src/napi.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/chiaracarminati/Downloads/code-4.4.3/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object src/CMakeFiles/NeXus_Static_Library.dir/napi.c.o"
	cd /Users/chiaracarminati/Downloads/code-4.4.3/build/src && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/NeXus_Static_Library.dir/napi.c.o   -c /Users/chiaracarminati/Downloads/code-4.4.3/src/napi.c

src/CMakeFiles/NeXus_Static_Library.dir/napi.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/NeXus_Static_Library.dir/napi.c.i"
	cd /Users/chiaracarminati/Downloads/code-4.4.3/build/src && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/chiaracarminati/Downloads/code-4.4.3/src/napi.c > CMakeFiles/NeXus_Static_Library.dir/napi.c.i

src/CMakeFiles/NeXus_Static_Library.dir/napi.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/NeXus_Static_Library.dir/napi.c.s"
	cd /Users/chiaracarminati/Downloads/code-4.4.3/build/src && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/chiaracarminati/Downloads/code-4.4.3/src/napi.c -o CMakeFiles/NeXus_Static_Library.dir/napi.c.s

src/CMakeFiles/NeXus_Static_Library.dir/napi.c.o.requires:

.PHONY : src/CMakeFiles/NeXus_Static_Library.dir/napi.c.o.requires

src/CMakeFiles/NeXus_Static_Library.dir/napi.c.o.provides: src/CMakeFiles/NeXus_Static_Library.dir/napi.c.o.requires
	$(MAKE) -f src/CMakeFiles/NeXus_Static_Library.dir/build.make src/CMakeFiles/NeXus_Static_Library.dir/napi.c.o.provides.build
.PHONY : src/CMakeFiles/NeXus_Static_Library.dir/napi.c.o.provides

src/CMakeFiles/NeXus_Static_Library.dir/napi.c.o.provides.build: src/CMakeFiles/NeXus_Static_Library.dir/napi.c.o


src/CMakeFiles/NeXus_Static_Library.dir/napiu.c.o: src/CMakeFiles/NeXus_Static_Library.dir/flags.make
src/CMakeFiles/NeXus_Static_Library.dir/napiu.c.o: ../src/napiu.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/chiaracarminati/Downloads/code-4.4.3/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object src/CMakeFiles/NeXus_Static_Library.dir/napiu.c.o"
	cd /Users/chiaracarminati/Downloads/code-4.4.3/build/src && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/NeXus_Static_Library.dir/napiu.c.o   -c /Users/chiaracarminati/Downloads/code-4.4.3/src/napiu.c

src/CMakeFiles/NeXus_Static_Library.dir/napiu.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/NeXus_Static_Library.dir/napiu.c.i"
	cd /Users/chiaracarminati/Downloads/code-4.4.3/build/src && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/chiaracarminati/Downloads/code-4.4.3/src/napiu.c > CMakeFiles/NeXus_Static_Library.dir/napiu.c.i

src/CMakeFiles/NeXus_Static_Library.dir/napiu.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/NeXus_Static_Library.dir/napiu.c.s"
	cd /Users/chiaracarminati/Downloads/code-4.4.3/build/src && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/chiaracarminati/Downloads/code-4.4.3/src/napiu.c -o CMakeFiles/NeXus_Static_Library.dir/napiu.c.s

src/CMakeFiles/NeXus_Static_Library.dir/napiu.c.o.requires:

.PHONY : src/CMakeFiles/NeXus_Static_Library.dir/napiu.c.o.requires

src/CMakeFiles/NeXus_Static_Library.dir/napiu.c.o.provides: src/CMakeFiles/NeXus_Static_Library.dir/napiu.c.o.requires
	$(MAKE) -f src/CMakeFiles/NeXus_Static_Library.dir/build.make src/CMakeFiles/NeXus_Static_Library.dir/napiu.c.o.provides.build
.PHONY : src/CMakeFiles/NeXus_Static_Library.dir/napiu.c.o.provides

src/CMakeFiles/NeXus_Static_Library.dir/napiu.c.o.provides.build: src/CMakeFiles/NeXus_Static_Library.dir/napiu.c.o


src/CMakeFiles/NeXus_Static_Library.dir/nxstack.c.o: src/CMakeFiles/NeXus_Static_Library.dir/flags.make
src/CMakeFiles/NeXus_Static_Library.dir/nxstack.c.o: ../src/nxstack.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/chiaracarminati/Downloads/code-4.4.3/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object src/CMakeFiles/NeXus_Static_Library.dir/nxstack.c.o"
	cd /Users/chiaracarminati/Downloads/code-4.4.3/build/src && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/NeXus_Static_Library.dir/nxstack.c.o   -c /Users/chiaracarminati/Downloads/code-4.4.3/src/nxstack.c

src/CMakeFiles/NeXus_Static_Library.dir/nxstack.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/NeXus_Static_Library.dir/nxstack.c.i"
	cd /Users/chiaracarminati/Downloads/code-4.4.3/build/src && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/chiaracarminati/Downloads/code-4.4.3/src/nxstack.c > CMakeFiles/NeXus_Static_Library.dir/nxstack.c.i

src/CMakeFiles/NeXus_Static_Library.dir/nxstack.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/NeXus_Static_Library.dir/nxstack.c.s"
	cd /Users/chiaracarminati/Downloads/code-4.4.3/build/src && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/chiaracarminati/Downloads/code-4.4.3/src/nxstack.c -o CMakeFiles/NeXus_Static_Library.dir/nxstack.c.s

src/CMakeFiles/NeXus_Static_Library.dir/nxstack.c.o.requires:

.PHONY : src/CMakeFiles/NeXus_Static_Library.dir/nxstack.c.o.requires

src/CMakeFiles/NeXus_Static_Library.dir/nxstack.c.o.provides: src/CMakeFiles/NeXus_Static_Library.dir/nxstack.c.o.requires
	$(MAKE) -f src/CMakeFiles/NeXus_Static_Library.dir/build.make src/CMakeFiles/NeXus_Static_Library.dir/nxstack.c.o.provides.build
.PHONY : src/CMakeFiles/NeXus_Static_Library.dir/nxstack.c.o.provides

src/CMakeFiles/NeXus_Static_Library.dir/nxstack.c.o.provides.build: src/CMakeFiles/NeXus_Static_Library.dir/nxstack.c.o


src/CMakeFiles/NeXus_Static_Library.dir/stptok.c.o: src/CMakeFiles/NeXus_Static_Library.dir/flags.make
src/CMakeFiles/NeXus_Static_Library.dir/stptok.c.o: ../src/stptok.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/chiaracarminati/Downloads/code-4.4.3/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object src/CMakeFiles/NeXus_Static_Library.dir/stptok.c.o"
	cd /Users/chiaracarminati/Downloads/code-4.4.3/build/src && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/NeXus_Static_Library.dir/stptok.c.o   -c /Users/chiaracarminati/Downloads/code-4.4.3/src/stptok.c

src/CMakeFiles/NeXus_Static_Library.dir/stptok.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/NeXus_Static_Library.dir/stptok.c.i"
	cd /Users/chiaracarminati/Downloads/code-4.4.3/build/src && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/chiaracarminati/Downloads/code-4.4.3/src/stptok.c > CMakeFiles/NeXus_Static_Library.dir/stptok.c.i

src/CMakeFiles/NeXus_Static_Library.dir/stptok.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/NeXus_Static_Library.dir/stptok.c.s"
	cd /Users/chiaracarminati/Downloads/code-4.4.3/build/src && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/chiaracarminati/Downloads/code-4.4.3/src/stptok.c -o CMakeFiles/NeXus_Static_Library.dir/stptok.c.s

src/CMakeFiles/NeXus_Static_Library.dir/stptok.c.o.requires:

.PHONY : src/CMakeFiles/NeXus_Static_Library.dir/stptok.c.o.requires

src/CMakeFiles/NeXus_Static_Library.dir/stptok.c.o.provides: src/CMakeFiles/NeXus_Static_Library.dir/stptok.c.o.requires
	$(MAKE) -f src/CMakeFiles/NeXus_Static_Library.dir/build.make src/CMakeFiles/NeXus_Static_Library.dir/stptok.c.o.provides.build
.PHONY : src/CMakeFiles/NeXus_Static_Library.dir/stptok.c.o.provides

src/CMakeFiles/NeXus_Static_Library.dir/stptok.c.o.provides.build: src/CMakeFiles/NeXus_Static_Library.dir/stptok.c.o


src/CMakeFiles/NeXus_Static_Library.dir/nxdataset.c.o: src/CMakeFiles/NeXus_Static_Library.dir/flags.make
src/CMakeFiles/NeXus_Static_Library.dir/nxdataset.c.o: ../src/nxdataset.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/chiaracarminati/Downloads/code-4.4.3/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building C object src/CMakeFiles/NeXus_Static_Library.dir/nxdataset.c.o"
	cd /Users/chiaracarminati/Downloads/code-4.4.3/build/src && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/NeXus_Static_Library.dir/nxdataset.c.o   -c /Users/chiaracarminati/Downloads/code-4.4.3/src/nxdataset.c

src/CMakeFiles/NeXus_Static_Library.dir/nxdataset.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/NeXus_Static_Library.dir/nxdataset.c.i"
	cd /Users/chiaracarminati/Downloads/code-4.4.3/build/src && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/chiaracarminati/Downloads/code-4.4.3/src/nxdataset.c > CMakeFiles/NeXus_Static_Library.dir/nxdataset.c.i

src/CMakeFiles/NeXus_Static_Library.dir/nxdataset.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/NeXus_Static_Library.dir/nxdataset.c.s"
	cd /Users/chiaracarminati/Downloads/code-4.4.3/build/src && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/chiaracarminati/Downloads/code-4.4.3/src/nxdataset.c -o CMakeFiles/NeXus_Static_Library.dir/nxdataset.c.s

src/CMakeFiles/NeXus_Static_Library.dir/nxdataset.c.o.requires:

.PHONY : src/CMakeFiles/NeXus_Static_Library.dir/nxdataset.c.o.requires

src/CMakeFiles/NeXus_Static_Library.dir/nxdataset.c.o.provides: src/CMakeFiles/NeXus_Static_Library.dir/nxdataset.c.o.requires
	$(MAKE) -f src/CMakeFiles/NeXus_Static_Library.dir/build.make src/CMakeFiles/NeXus_Static_Library.dir/nxdataset.c.o.provides.build
.PHONY : src/CMakeFiles/NeXus_Static_Library.dir/nxdataset.c.o.provides

src/CMakeFiles/NeXus_Static_Library.dir/nxdataset.c.o.provides.build: src/CMakeFiles/NeXus_Static_Library.dir/nxdataset.c.o


src/CMakeFiles/NeXus_Static_Library.dir/napi_fortran_helper.c.o: src/CMakeFiles/NeXus_Static_Library.dir/flags.make
src/CMakeFiles/NeXus_Static_Library.dir/napi_fortran_helper.c.o: ../src/napi_fortran_helper.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/chiaracarminati/Downloads/code-4.4.3/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building C object src/CMakeFiles/NeXus_Static_Library.dir/napi_fortran_helper.c.o"
	cd /Users/chiaracarminati/Downloads/code-4.4.3/build/src && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/NeXus_Static_Library.dir/napi_fortran_helper.c.o   -c /Users/chiaracarminati/Downloads/code-4.4.3/src/napi_fortran_helper.c

src/CMakeFiles/NeXus_Static_Library.dir/napi_fortran_helper.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/NeXus_Static_Library.dir/napi_fortran_helper.c.i"
	cd /Users/chiaracarminati/Downloads/code-4.4.3/build/src && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/chiaracarminati/Downloads/code-4.4.3/src/napi_fortran_helper.c > CMakeFiles/NeXus_Static_Library.dir/napi_fortran_helper.c.i

src/CMakeFiles/NeXus_Static_Library.dir/napi_fortran_helper.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/NeXus_Static_Library.dir/napi_fortran_helper.c.s"
	cd /Users/chiaracarminati/Downloads/code-4.4.3/build/src && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/chiaracarminati/Downloads/code-4.4.3/src/napi_fortran_helper.c -o CMakeFiles/NeXus_Static_Library.dir/napi_fortran_helper.c.s

src/CMakeFiles/NeXus_Static_Library.dir/napi_fortran_helper.c.o.requires:

.PHONY : src/CMakeFiles/NeXus_Static_Library.dir/napi_fortran_helper.c.o.requires

src/CMakeFiles/NeXus_Static_Library.dir/napi_fortran_helper.c.o.provides: src/CMakeFiles/NeXus_Static_Library.dir/napi_fortran_helper.c.o.requires
	$(MAKE) -f src/CMakeFiles/NeXus_Static_Library.dir/build.make src/CMakeFiles/NeXus_Static_Library.dir/napi_fortran_helper.c.o.provides.build
.PHONY : src/CMakeFiles/NeXus_Static_Library.dir/napi_fortran_helper.c.o.provides

src/CMakeFiles/NeXus_Static_Library.dir/napi_fortran_helper.c.o.provides.build: src/CMakeFiles/NeXus_Static_Library.dir/napi_fortran_helper.c.o


src/CMakeFiles/NeXus_Static_Library.dir/napi5.c.o: src/CMakeFiles/NeXus_Static_Library.dir/flags.make
src/CMakeFiles/NeXus_Static_Library.dir/napi5.c.o: ../src/napi5.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/chiaracarminati/Downloads/code-4.4.3/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building C object src/CMakeFiles/NeXus_Static_Library.dir/napi5.c.o"
	cd /Users/chiaracarminati/Downloads/code-4.4.3/build/src && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/NeXus_Static_Library.dir/napi5.c.o   -c /Users/chiaracarminati/Downloads/code-4.4.3/src/napi5.c

src/CMakeFiles/NeXus_Static_Library.dir/napi5.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/NeXus_Static_Library.dir/napi5.c.i"
	cd /Users/chiaracarminati/Downloads/code-4.4.3/build/src && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/chiaracarminati/Downloads/code-4.4.3/src/napi5.c > CMakeFiles/NeXus_Static_Library.dir/napi5.c.i

src/CMakeFiles/NeXus_Static_Library.dir/napi5.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/NeXus_Static_Library.dir/napi5.c.s"
	cd /Users/chiaracarminati/Downloads/code-4.4.3/build/src && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/chiaracarminati/Downloads/code-4.4.3/src/napi5.c -o CMakeFiles/NeXus_Static_Library.dir/napi5.c.s

src/CMakeFiles/NeXus_Static_Library.dir/napi5.c.o.requires:

.PHONY : src/CMakeFiles/NeXus_Static_Library.dir/napi5.c.o.requires

src/CMakeFiles/NeXus_Static_Library.dir/napi5.c.o.provides: src/CMakeFiles/NeXus_Static_Library.dir/napi5.c.o.requires
	$(MAKE) -f src/CMakeFiles/NeXus_Static_Library.dir/build.make src/CMakeFiles/NeXus_Static_Library.dir/napi5.c.o.provides.build
.PHONY : src/CMakeFiles/NeXus_Static_Library.dir/napi5.c.o.provides

src/CMakeFiles/NeXus_Static_Library.dir/napi5.c.o.provides.build: src/CMakeFiles/NeXus_Static_Library.dir/napi5.c.o


# Object files for target NeXus_Static_Library
NeXus_Static_Library_OBJECTS = \
"CMakeFiles/NeXus_Static_Library.dir/napi.c.o" \
"CMakeFiles/NeXus_Static_Library.dir/napiu.c.o" \
"CMakeFiles/NeXus_Static_Library.dir/nxstack.c.o" \
"CMakeFiles/NeXus_Static_Library.dir/stptok.c.o" \
"CMakeFiles/NeXus_Static_Library.dir/nxdataset.c.o" \
"CMakeFiles/NeXus_Static_Library.dir/napi_fortran_helper.c.o" \
"CMakeFiles/NeXus_Static_Library.dir/napi5.c.o"

# External object files for target NeXus_Static_Library
NeXus_Static_Library_EXTERNAL_OBJECTS =

src/libNeXus.a: src/CMakeFiles/NeXus_Static_Library.dir/napi.c.o
src/libNeXus.a: src/CMakeFiles/NeXus_Static_Library.dir/napiu.c.o
src/libNeXus.a: src/CMakeFiles/NeXus_Static_Library.dir/nxstack.c.o
src/libNeXus.a: src/CMakeFiles/NeXus_Static_Library.dir/stptok.c.o
src/libNeXus.a: src/CMakeFiles/NeXus_Static_Library.dir/nxdataset.c.o
src/libNeXus.a: src/CMakeFiles/NeXus_Static_Library.dir/napi_fortran_helper.c.o
src/libNeXus.a: src/CMakeFiles/NeXus_Static_Library.dir/napi5.c.o
src/libNeXus.a: src/CMakeFiles/NeXus_Static_Library.dir/build.make
src/libNeXus.a: src/CMakeFiles/NeXus_Static_Library.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/chiaracarminati/Downloads/code-4.4.3/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Linking C static library libNeXus.a"
	cd /Users/chiaracarminati/Downloads/code-4.4.3/build/src && $(CMAKE_COMMAND) -P CMakeFiles/NeXus_Static_Library.dir/cmake_clean_target.cmake
	cd /Users/chiaracarminati/Downloads/code-4.4.3/build/src && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/NeXus_Static_Library.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/CMakeFiles/NeXus_Static_Library.dir/build: src/libNeXus.a

.PHONY : src/CMakeFiles/NeXus_Static_Library.dir/build

src/CMakeFiles/NeXus_Static_Library.dir/requires: src/CMakeFiles/NeXus_Static_Library.dir/napi.c.o.requires
src/CMakeFiles/NeXus_Static_Library.dir/requires: src/CMakeFiles/NeXus_Static_Library.dir/napiu.c.o.requires
src/CMakeFiles/NeXus_Static_Library.dir/requires: src/CMakeFiles/NeXus_Static_Library.dir/nxstack.c.o.requires
src/CMakeFiles/NeXus_Static_Library.dir/requires: src/CMakeFiles/NeXus_Static_Library.dir/stptok.c.o.requires
src/CMakeFiles/NeXus_Static_Library.dir/requires: src/CMakeFiles/NeXus_Static_Library.dir/nxdataset.c.o.requires
src/CMakeFiles/NeXus_Static_Library.dir/requires: src/CMakeFiles/NeXus_Static_Library.dir/napi_fortran_helper.c.o.requires
src/CMakeFiles/NeXus_Static_Library.dir/requires: src/CMakeFiles/NeXus_Static_Library.dir/napi5.c.o.requires

.PHONY : src/CMakeFiles/NeXus_Static_Library.dir/requires

src/CMakeFiles/NeXus_Static_Library.dir/clean:
	cd /Users/chiaracarminati/Downloads/code-4.4.3/build/src && $(CMAKE_COMMAND) -P CMakeFiles/NeXus_Static_Library.dir/cmake_clean.cmake
.PHONY : src/CMakeFiles/NeXus_Static_Library.dir/clean

src/CMakeFiles/NeXus_Static_Library.dir/depend:
	cd /Users/chiaracarminati/Downloads/code-4.4.3/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/chiaracarminati/Downloads/code-4.4.3 /Users/chiaracarminati/Downloads/code-4.4.3/src /Users/chiaracarminati/Downloads/code-4.4.3/build /Users/chiaracarminati/Downloads/code-4.4.3/build/src /Users/chiaracarminati/Downloads/code-4.4.3/build/src/CMakeFiles/NeXus_Static_Library.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/CMakeFiles/NeXus_Static_Library.dir/depend
