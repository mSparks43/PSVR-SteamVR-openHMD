# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.13

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
CMAKE_COMMAND = /usr/bin/cmake3

# The command to remove a file.
RM = /usr/bin/cmake3 -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /media/storage/openhmd/SteamVR-OpenHMD

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /media/storage/openhmd/SteamVR-OpenHMD/build

# Include any dependencies generated for this target.
include subprojects/openhmd/examples/simple/CMakeFiles/simple.dir/depend.make

# Include the progress variables for this target.
include subprojects/openhmd/examples/simple/CMakeFiles/simple.dir/progress.make

# Include the compile flags for this target's objects.
include subprojects/openhmd/examples/simple/CMakeFiles/simple.dir/flags.make

subprojects/openhmd/examples/simple/CMakeFiles/simple.dir/simple.c.o: subprojects/openhmd/examples/simple/CMakeFiles/simple.dir/flags.make
subprojects/openhmd/examples/simple/CMakeFiles/simple.dir/simple.c.o: ../subprojects/openhmd/examples/simple/simple.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/media/storage/openhmd/SteamVR-OpenHMD/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object subprojects/openhmd/examples/simple/CMakeFiles/simple.dir/simple.c.o"
	cd /media/storage/openhmd/SteamVR-OpenHMD/build/subprojects/openhmd/examples/simple && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/simple.dir/simple.c.o   -c /media/storage/openhmd/SteamVR-OpenHMD/subprojects/openhmd/examples/simple/simple.c

subprojects/openhmd/examples/simple/CMakeFiles/simple.dir/simple.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/simple.dir/simple.c.i"
	cd /media/storage/openhmd/SteamVR-OpenHMD/build/subprojects/openhmd/examples/simple && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /media/storage/openhmd/SteamVR-OpenHMD/subprojects/openhmd/examples/simple/simple.c > CMakeFiles/simple.dir/simple.c.i

subprojects/openhmd/examples/simple/CMakeFiles/simple.dir/simple.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/simple.dir/simple.c.s"
	cd /media/storage/openhmd/SteamVR-OpenHMD/build/subprojects/openhmd/examples/simple && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /media/storage/openhmd/SteamVR-OpenHMD/subprojects/openhmd/examples/simple/simple.c -o CMakeFiles/simple.dir/simple.c.s

# Object files for target simple
simple_OBJECTS = \
"CMakeFiles/simple.dir/simple.c.o"

# External object files for target simple
simple_EXTERNAL_OBJECTS =

subprojects/openhmd/examples/simple/simple: subprojects/openhmd/examples/simple/CMakeFiles/simple.dir/simple.c.o
subprojects/openhmd/examples/simple/simple: subprojects/openhmd/examples/simple/CMakeFiles/simple.dir/build.make
subprojects/openhmd/examples/simple/simple: subprojects/openhmd/examples/simple/CMakeFiles/simple.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/media/storage/openhmd/SteamVR-OpenHMD/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable simple"
	cd /media/storage/openhmd/SteamVR-OpenHMD/build/subprojects/openhmd/examples/simple && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/simple.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
subprojects/openhmd/examples/simple/CMakeFiles/simple.dir/build: subprojects/openhmd/examples/simple/simple

.PHONY : subprojects/openhmd/examples/simple/CMakeFiles/simple.dir/build

subprojects/openhmd/examples/simple/CMakeFiles/simple.dir/clean:
	cd /media/storage/openhmd/SteamVR-OpenHMD/build/subprojects/openhmd/examples/simple && $(CMAKE_COMMAND) -P CMakeFiles/simple.dir/cmake_clean.cmake
.PHONY : subprojects/openhmd/examples/simple/CMakeFiles/simple.dir/clean

subprojects/openhmd/examples/simple/CMakeFiles/simple.dir/depend:
	cd /media/storage/openhmd/SteamVR-OpenHMD/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /media/storage/openhmd/SteamVR-OpenHMD /media/storage/openhmd/SteamVR-OpenHMD/subprojects/openhmd/examples/simple /media/storage/openhmd/SteamVR-OpenHMD/build /media/storage/openhmd/SteamVR-OpenHMD/build/subprojects/openhmd/examples/simple /media/storage/openhmd/SteamVR-OpenHMD/build/subprojects/openhmd/examples/simple/CMakeFiles/simple.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : subprojects/openhmd/examples/simple/CMakeFiles/simple.dir/depend

