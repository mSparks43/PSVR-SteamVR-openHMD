# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.27

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/msparks/Development/PSVR-SteamVR-openHMD/subprojects/openhmd

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/msparks/Development/PSVR-SteamVR-openHMD/subprojects/openhmd/build

# Include any dependencies generated for this target.
include examples/simple/CMakeFiles/simple.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include examples/simple/CMakeFiles/simple.dir/compiler_depend.make

# Include the progress variables for this target.
include examples/simple/CMakeFiles/simple.dir/progress.make

# Include the compile flags for this target's objects.
include examples/simple/CMakeFiles/simple.dir/flags.make

examples/simple/CMakeFiles/simple.dir/simple.c.o: examples/simple/CMakeFiles/simple.dir/flags.make
examples/simple/CMakeFiles/simple.dir/simple.c.o: /home/msparks/Development/PSVR-SteamVR-openHMD/subprojects/openhmd/examples/simple/simple.c
examples/simple/CMakeFiles/simple.dir/simple.c.o: examples/simple/CMakeFiles/simple.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/msparks/Development/PSVR-SteamVR-openHMD/subprojects/openhmd/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object examples/simple/CMakeFiles/simple.dir/simple.c.o"
	cd /home/msparks/Development/PSVR-SteamVR-openHMD/subprojects/openhmd/build/examples/simple && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT examples/simple/CMakeFiles/simple.dir/simple.c.o -MF CMakeFiles/simple.dir/simple.c.o.d -o CMakeFiles/simple.dir/simple.c.o -c /home/msparks/Development/PSVR-SteamVR-openHMD/subprojects/openhmd/examples/simple/simple.c

examples/simple/CMakeFiles/simple.dir/simple.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing C source to CMakeFiles/simple.dir/simple.c.i"
	cd /home/msparks/Development/PSVR-SteamVR-openHMD/subprojects/openhmd/build/examples/simple && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/msparks/Development/PSVR-SteamVR-openHMD/subprojects/openhmd/examples/simple/simple.c > CMakeFiles/simple.dir/simple.c.i

examples/simple/CMakeFiles/simple.dir/simple.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling C source to assembly CMakeFiles/simple.dir/simple.c.s"
	cd /home/msparks/Development/PSVR-SteamVR-openHMD/subprojects/openhmd/build/examples/simple && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/msparks/Development/PSVR-SteamVR-openHMD/subprojects/openhmd/examples/simple/simple.c -o CMakeFiles/simple.dir/simple.c.s

# Object files for target simple
simple_OBJECTS = \
"CMakeFiles/simple.dir/simple.c.o"

# External object files for target simple
simple_EXTERNAL_OBJECTS =

examples/simple/simple: examples/simple/CMakeFiles/simple.dir/simple.c.o
examples/simple/simple: examples/simple/CMakeFiles/simple.dir/build.make
examples/simple/simple: examples/simple/CMakeFiles/simple.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/home/msparks/Development/PSVR-SteamVR-openHMD/subprojects/openhmd/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable simple"
	cd /home/msparks/Development/PSVR-SteamVR-openHMD/subprojects/openhmd/build/examples/simple && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/simple.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
examples/simple/CMakeFiles/simple.dir/build: examples/simple/simple
.PHONY : examples/simple/CMakeFiles/simple.dir/build

examples/simple/CMakeFiles/simple.dir/clean:
	cd /home/msparks/Development/PSVR-SteamVR-openHMD/subprojects/openhmd/build/examples/simple && $(CMAKE_COMMAND) -P CMakeFiles/simple.dir/cmake_clean.cmake
.PHONY : examples/simple/CMakeFiles/simple.dir/clean

examples/simple/CMakeFiles/simple.dir/depend:
	cd /home/msparks/Development/PSVR-SteamVR-openHMD/subprojects/openhmd/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/msparks/Development/PSVR-SteamVR-openHMD/subprojects/openhmd /home/msparks/Development/PSVR-SteamVR-openHMD/subprojects/openhmd/examples/simple /home/msparks/Development/PSVR-SteamVR-openHMD/subprojects/openhmd/build /home/msparks/Development/PSVR-SteamVR-openHMD/subprojects/openhmd/build/examples/simple /home/msparks/Development/PSVR-SteamVR-openHMD/subprojects/openhmd/build/examples/simple/CMakeFiles/simple.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : examples/simple/CMakeFiles/simple.dir/depend

