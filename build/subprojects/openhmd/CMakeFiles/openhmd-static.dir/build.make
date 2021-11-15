# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.20

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
CMAKE_SOURCE_DIR = /home/msparks/Development/PSVR-SteamVR-openHMD

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/msparks/Development/PSVR-SteamVR-openHMD/build

# Include any dependencies generated for this target.
include subprojects/openhmd/CMakeFiles/openhmd-static.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include subprojects/openhmd/CMakeFiles/openhmd-static.dir/compiler_depend.make

# Include the progress variables for this target.
include subprojects/openhmd/CMakeFiles/openhmd-static.dir/progress.make

# Include the compile flags for this target's objects.
include subprojects/openhmd/CMakeFiles/openhmd-static.dir/flags.make

subprojects/openhmd/CMakeFiles/openhmd-static.dir/src/openhmd.c.o: subprojects/openhmd/CMakeFiles/openhmd-static.dir/flags.make
subprojects/openhmd/CMakeFiles/openhmd-static.dir/src/openhmd.c.o: ../subprojects/openhmd/src/openhmd.c
subprojects/openhmd/CMakeFiles/openhmd-static.dir/src/openhmd.c.o: subprojects/openhmd/CMakeFiles/openhmd-static.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/msparks/Development/PSVR-SteamVR-openHMD/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object subprojects/openhmd/CMakeFiles/openhmd-static.dir/src/openhmd.c.o"
	cd /home/msparks/Development/PSVR-SteamVR-openHMD/build/subprojects/openhmd && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT subprojects/openhmd/CMakeFiles/openhmd-static.dir/src/openhmd.c.o -MF CMakeFiles/openhmd-static.dir/src/openhmd.c.o.d -o CMakeFiles/openhmd-static.dir/src/openhmd.c.o -c /home/msparks/Development/PSVR-SteamVR-openHMD/subprojects/openhmd/src/openhmd.c

subprojects/openhmd/CMakeFiles/openhmd-static.dir/src/openhmd.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/openhmd-static.dir/src/openhmd.c.i"
	cd /home/msparks/Development/PSVR-SteamVR-openHMD/build/subprojects/openhmd && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/msparks/Development/PSVR-SteamVR-openHMD/subprojects/openhmd/src/openhmd.c > CMakeFiles/openhmd-static.dir/src/openhmd.c.i

subprojects/openhmd/CMakeFiles/openhmd-static.dir/src/openhmd.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/openhmd-static.dir/src/openhmd.c.s"
	cd /home/msparks/Development/PSVR-SteamVR-openHMD/build/subprojects/openhmd && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/msparks/Development/PSVR-SteamVR-openHMD/subprojects/openhmd/src/openhmd.c -o CMakeFiles/openhmd-static.dir/src/openhmd.c.s

subprojects/openhmd/CMakeFiles/openhmd-static.dir/src/platform-win32.c.o: subprojects/openhmd/CMakeFiles/openhmd-static.dir/flags.make
subprojects/openhmd/CMakeFiles/openhmd-static.dir/src/platform-win32.c.o: ../subprojects/openhmd/src/platform-win32.c
subprojects/openhmd/CMakeFiles/openhmd-static.dir/src/platform-win32.c.o: subprojects/openhmd/CMakeFiles/openhmd-static.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/msparks/Development/PSVR-SteamVR-openHMD/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object subprojects/openhmd/CMakeFiles/openhmd-static.dir/src/platform-win32.c.o"
	cd /home/msparks/Development/PSVR-SteamVR-openHMD/build/subprojects/openhmd && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT subprojects/openhmd/CMakeFiles/openhmd-static.dir/src/platform-win32.c.o -MF CMakeFiles/openhmd-static.dir/src/platform-win32.c.o.d -o CMakeFiles/openhmd-static.dir/src/platform-win32.c.o -c /home/msparks/Development/PSVR-SteamVR-openHMD/subprojects/openhmd/src/platform-win32.c

subprojects/openhmd/CMakeFiles/openhmd-static.dir/src/platform-win32.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/openhmd-static.dir/src/platform-win32.c.i"
	cd /home/msparks/Development/PSVR-SteamVR-openHMD/build/subprojects/openhmd && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/msparks/Development/PSVR-SteamVR-openHMD/subprojects/openhmd/src/platform-win32.c > CMakeFiles/openhmd-static.dir/src/platform-win32.c.i

subprojects/openhmd/CMakeFiles/openhmd-static.dir/src/platform-win32.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/openhmd-static.dir/src/platform-win32.c.s"
	cd /home/msparks/Development/PSVR-SteamVR-openHMD/build/subprojects/openhmd && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/msparks/Development/PSVR-SteamVR-openHMD/subprojects/openhmd/src/platform-win32.c -o CMakeFiles/openhmd-static.dir/src/platform-win32.c.s

subprojects/openhmd/CMakeFiles/openhmd-static.dir/src/drv_dummy/dummy.c.o: subprojects/openhmd/CMakeFiles/openhmd-static.dir/flags.make
subprojects/openhmd/CMakeFiles/openhmd-static.dir/src/drv_dummy/dummy.c.o: ../subprojects/openhmd/src/drv_dummy/dummy.c
subprojects/openhmd/CMakeFiles/openhmd-static.dir/src/drv_dummy/dummy.c.o: subprojects/openhmd/CMakeFiles/openhmd-static.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/msparks/Development/PSVR-SteamVR-openHMD/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object subprojects/openhmd/CMakeFiles/openhmd-static.dir/src/drv_dummy/dummy.c.o"
	cd /home/msparks/Development/PSVR-SteamVR-openHMD/build/subprojects/openhmd && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT subprojects/openhmd/CMakeFiles/openhmd-static.dir/src/drv_dummy/dummy.c.o -MF CMakeFiles/openhmd-static.dir/src/drv_dummy/dummy.c.o.d -o CMakeFiles/openhmd-static.dir/src/drv_dummy/dummy.c.o -c /home/msparks/Development/PSVR-SteamVR-openHMD/subprojects/openhmd/src/drv_dummy/dummy.c

subprojects/openhmd/CMakeFiles/openhmd-static.dir/src/drv_dummy/dummy.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/openhmd-static.dir/src/drv_dummy/dummy.c.i"
	cd /home/msparks/Development/PSVR-SteamVR-openHMD/build/subprojects/openhmd && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/msparks/Development/PSVR-SteamVR-openHMD/subprojects/openhmd/src/drv_dummy/dummy.c > CMakeFiles/openhmd-static.dir/src/drv_dummy/dummy.c.i

subprojects/openhmd/CMakeFiles/openhmd-static.dir/src/drv_dummy/dummy.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/openhmd-static.dir/src/drv_dummy/dummy.c.s"
	cd /home/msparks/Development/PSVR-SteamVR-openHMD/build/subprojects/openhmd && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/msparks/Development/PSVR-SteamVR-openHMD/subprojects/openhmd/src/drv_dummy/dummy.c -o CMakeFiles/openhmd-static.dir/src/drv_dummy/dummy.c.s

subprojects/openhmd/CMakeFiles/openhmd-static.dir/src/omath.c.o: subprojects/openhmd/CMakeFiles/openhmd-static.dir/flags.make
subprojects/openhmd/CMakeFiles/openhmd-static.dir/src/omath.c.o: ../subprojects/openhmd/src/omath.c
subprojects/openhmd/CMakeFiles/openhmd-static.dir/src/omath.c.o: subprojects/openhmd/CMakeFiles/openhmd-static.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/msparks/Development/PSVR-SteamVR-openHMD/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object subprojects/openhmd/CMakeFiles/openhmd-static.dir/src/omath.c.o"
	cd /home/msparks/Development/PSVR-SteamVR-openHMD/build/subprojects/openhmd && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT subprojects/openhmd/CMakeFiles/openhmd-static.dir/src/omath.c.o -MF CMakeFiles/openhmd-static.dir/src/omath.c.o.d -o CMakeFiles/openhmd-static.dir/src/omath.c.o -c /home/msparks/Development/PSVR-SteamVR-openHMD/subprojects/openhmd/src/omath.c

subprojects/openhmd/CMakeFiles/openhmd-static.dir/src/omath.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/openhmd-static.dir/src/omath.c.i"
	cd /home/msparks/Development/PSVR-SteamVR-openHMD/build/subprojects/openhmd && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/msparks/Development/PSVR-SteamVR-openHMD/subprojects/openhmd/src/omath.c > CMakeFiles/openhmd-static.dir/src/omath.c.i

subprojects/openhmd/CMakeFiles/openhmd-static.dir/src/omath.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/openhmd-static.dir/src/omath.c.s"
	cd /home/msparks/Development/PSVR-SteamVR-openHMD/build/subprojects/openhmd && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/msparks/Development/PSVR-SteamVR-openHMD/subprojects/openhmd/src/omath.c -o CMakeFiles/openhmd-static.dir/src/omath.c.s

subprojects/openhmd/CMakeFiles/openhmd-static.dir/src/platform-posix.c.o: subprojects/openhmd/CMakeFiles/openhmd-static.dir/flags.make
subprojects/openhmd/CMakeFiles/openhmd-static.dir/src/platform-posix.c.o: ../subprojects/openhmd/src/platform-posix.c
subprojects/openhmd/CMakeFiles/openhmd-static.dir/src/platform-posix.c.o: subprojects/openhmd/CMakeFiles/openhmd-static.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/msparks/Development/PSVR-SteamVR-openHMD/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building C object subprojects/openhmd/CMakeFiles/openhmd-static.dir/src/platform-posix.c.o"
	cd /home/msparks/Development/PSVR-SteamVR-openHMD/build/subprojects/openhmd && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT subprojects/openhmd/CMakeFiles/openhmd-static.dir/src/platform-posix.c.o -MF CMakeFiles/openhmd-static.dir/src/platform-posix.c.o.d -o CMakeFiles/openhmd-static.dir/src/platform-posix.c.o -c /home/msparks/Development/PSVR-SteamVR-openHMD/subprojects/openhmd/src/platform-posix.c

subprojects/openhmd/CMakeFiles/openhmd-static.dir/src/platform-posix.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/openhmd-static.dir/src/platform-posix.c.i"
	cd /home/msparks/Development/PSVR-SteamVR-openHMD/build/subprojects/openhmd && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/msparks/Development/PSVR-SteamVR-openHMD/subprojects/openhmd/src/platform-posix.c > CMakeFiles/openhmd-static.dir/src/platform-posix.c.i

subprojects/openhmd/CMakeFiles/openhmd-static.dir/src/platform-posix.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/openhmd-static.dir/src/platform-posix.c.s"
	cd /home/msparks/Development/PSVR-SteamVR-openHMD/build/subprojects/openhmd && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/msparks/Development/PSVR-SteamVR-openHMD/subprojects/openhmd/src/platform-posix.c -o CMakeFiles/openhmd-static.dir/src/platform-posix.c.s

subprojects/openhmd/CMakeFiles/openhmd-static.dir/src/fusion.c.o: subprojects/openhmd/CMakeFiles/openhmd-static.dir/flags.make
subprojects/openhmd/CMakeFiles/openhmd-static.dir/src/fusion.c.o: ../subprojects/openhmd/src/fusion.c
subprojects/openhmd/CMakeFiles/openhmd-static.dir/src/fusion.c.o: subprojects/openhmd/CMakeFiles/openhmd-static.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/msparks/Development/PSVR-SteamVR-openHMD/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building C object subprojects/openhmd/CMakeFiles/openhmd-static.dir/src/fusion.c.o"
	cd /home/msparks/Development/PSVR-SteamVR-openHMD/build/subprojects/openhmd && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT subprojects/openhmd/CMakeFiles/openhmd-static.dir/src/fusion.c.o -MF CMakeFiles/openhmd-static.dir/src/fusion.c.o.d -o CMakeFiles/openhmd-static.dir/src/fusion.c.o -c /home/msparks/Development/PSVR-SteamVR-openHMD/subprojects/openhmd/src/fusion.c

subprojects/openhmd/CMakeFiles/openhmd-static.dir/src/fusion.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/openhmd-static.dir/src/fusion.c.i"
	cd /home/msparks/Development/PSVR-SteamVR-openHMD/build/subprojects/openhmd && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/msparks/Development/PSVR-SteamVR-openHMD/subprojects/openhmd/src/fusion.c > CMakeFiles/openhmd-static.dir/src/fusion.c.i

subprojects/openhmd/CMakeFiles/openhmd-static.dir/src/fusion.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/openhmd-static.dir/src/fusion.c.s"
	cd /home/msparks/Development/PSVR-SteamVR-openHMD/build/subprojects/openhmd && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/msparks/Development/PSVR-SteamVR-openHMD/subprojects/openhmd/src/fusion.c -o CMakeFiles/openhmd-static.dir/src/fusion.c.s

subprojects/openhmd/CMakeFiles/openhmd-static.dir/src/shaders.c.o: subprojects/openhmd/CMakeFiles/openhmd-static.dir/flags.make
subprojects/openhmd/CMakeFiles/openhmd-static.dir/src/shaders.c.o: ../subprojects/openhmd/src/shaders.c
subprojects/openhmd/CMakeFiles/openhmd-static.dir/src/shaders.c.o: subprojects/openhmd/CMakeFiles/openhmd-static.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/msparks/Development/PSVR-SteamVR-openHMD/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building C object subprojects/openhmd/CMakeFiles/openhmd-static.dir/src/shaders.c.o"
	cd /home/msparks/Development/PSVR-SteamVR-openHMD/build/subprojects/openhmd && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT subprojects/openhmd/CMakeFiles/openhmd-static.dir/src/shaders.c.o -MF CMakeFiles/openhmd-static.dir/src/shaders.c.o.d -o CMakeFiles/openhmd-static.dir/src/shaders.c.o -c /home/msparks/Development/PSVR-SteamVR-openHMD/subprojects/openhmd/src/shaders.c

subprojects/openhmd/CMakeFiles/openhmd-static.dir/src/shaders.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/openhmd-static.dir/src/shaders.c.i"
	cd /home/msparks/Development/PSVR-SteamVR-openHMD/build/subprojects/openhmd && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/msparks/Development/PSVR-SteamVR-openHMD/subprojects/openhmd/src/shaders.c > CMakeFiles/openhmd-static.dir/src/shaders.c.i

subprojects/openhmd/CMakeFiles/openhmd-static.dir/src/shaders.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/openhmd-static.dir/src/shaders.c.s"
	cd /home/msparks/Development/PSVR-SteamVR-openHMD/build/subprojects/openhmd && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/msparks/Development/PSVR-SteamVR-openHMD/subprojects/openhmd/src/shaders.c -o CMakeFiles/openhmd-static.dir/src/shaders.c.s

subprojects/openhmd/CMakeFiles/openhmd-static.dir/src/drv_psvr/psvr.c.o: subprojects/openhmd/CMakeFiles/openhmd-static.dir/flags.make
subprojects/openhmd/CMakeFiles/openhmd-static.dir/src/drv_psvr/psvr.c.o: ../subprojects/openhmd/src/drv_psvr/psvr.c
subprojects/openhmd/CMakeFiles/openhmd-static.dir/src/drv_psvr/psvr.c.o: subprojects/openhmd/CMakeFiles/openhmd-static.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/msparks/Development/PSVR-SteamVR-openHMD/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building C object subprojects/openhmd/CMakeFiles/openhmd-static.dir/src/drv_psvr/psvr.c.o"
	cd /home/msparks/Development/PSVR-SteamVR-openHMD/build/subprojects/openhmd && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT subprojects/openhmd/CMakeFiles/openhmd-static.dir/src/drv_psvr/psvr.c.o -MF CMakeFiles/openhmd-static.dir/src/drv_psvr/psvr.c.o.d -o CMakeFiles/openhmd-static.dir/src/drv_psvr/psvr.c.o -c /home/msparks/Development/PSVR-SteamVR-openHMD/subprojects/openhmd/src/drv_psvr/psvr.c

subprojects/openhmd/CMakeFiles/openhmd-static.dir/src/drv_psvr/psvr.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/openhmd-static.dir/src/drv_psvr/psvr.c.i"
	cd /home/msparks/Development/PSVR-SteamVR-openHMD/build/subprojects/openhmd && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/msparks/Development/PSVR-SteamVR-openHMD/subprojects/openhmd/src/drv_psvr/psvr.c > CMakeFiles/openhmd-static.dir/src/drv_psvr/psvr.c.i

subprojects/openhmd/CMakeFiles/openhmd-static.dir/src/drv_psvr/psvr.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/openhmd-static.dir/src/drv_psvr/psvr.c.s"
	cd /home/msparks/Development/PSVR-SteamVR-openHMD/build/subprojects/openhmd && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/msparks/Development/PSVR-SteamVR-openHMD/subprojects/openhmd/src/drv_psvr/psvr.c -o CMakeFiles/openhmd-static.dir/src/drv_psvr/psvr.c.s

subprojects/openhmd/CMakeFiles/openhmd-static.dir/src/drv_psvr/packet.c.o: subprojects/openhmd/CMakeFiles/openhmd-static.dir/flags.make
subprojects/openhmd/CMakeFiles/openhmd-static.dir/src/drv_psvr/packet.c.o: ../subprojects/openhmd/src/drv_psvr/packet.c
subprojects/openhmd/CMakeFiles/openhmd-static.dir/src/drv_psvr/packet.c.o: subprojects/openhmd/CMakeFiles/openhmd-static.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/msparks/Development/PSVR-SteamVR-openHMD/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building C object subprojects/openhmd/CMakeFiles/openhmd-static.dir/src/drv_psvr/packet.c.o"
	cd /home/msparks/Development/PSVR-SteamVR-openHMD/build/subprojects/openhmd && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT subprojects/openhmd/CMakeFiles/openhmd-static.dir/src/drv_psvr/packet.c.o -MF CMakeFiles/openhmd-static.dir/src/drv_psvr/packet.c.o.d -o CMakeFiles/openhmd-static.dir/src/drv_psvr/packet.c.o -c /home/msparks/Development/PSVR-SteamVR-openHMD/subprojects/openhmd/src/drv_psvr/packet.c

subprojects/openhmd/CMakeFiles/openhmd-static.dir/src/drv_psvr/packet.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/openhmd-static.dir/src/drv_psvr/packet.c.i"
	cd /home/msparks/Development/PSVR-SteamVR-openHMD/build/subprojects/openhmd && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/msparks/Development/PSVR-SteamVR-openHMD/subprojects/openhmd/src/drv_psvr/packet.c > CMakeFiles/openhmd-static.dir/src/drv_psvr/packet.c.i

subprojects/openhmd/CMakeFiles/openhmd-static.dir/src/drv_psvr/packet.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/openhmd-static.dir/src/drv_psvr/packet.c.s"
	cd /home/msparks/Development/PSVR-SteamVR-openHMD/build/subprojects/openhmd && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/msparks/Development/PSVR-SteamVR-openHMD/subprojects/openhmd/src/drv_psvr/packet.c -o CMakeFiles/openhmd-static.dir/src/drv_psvr/packet.c.s

# Object files for target openhmd-static
openhmd__static_OBJECTS = \
"CMakeFiles/openhmd-static.dir/src/openhmd.c.o" \
"CMakeFiles/openhmd-static.dir/src/platform-win32.c.o" \
"CMakeFiles/openhmd-static.dir/src/drv_dummy/dummy.c.o" \
"CMakeFiles/openhmd-static.dir/src/omath.c.o" \
"CMakeFiles/openhmd-static.dir/src/platform-posix.c.o" \
"CMakeFiles/openhmd-static.dir/src/fusion.c.o" \
"CMakeFiles/openhmd-static.dir/src/shaders.c.o" \
"CMakeFiles/openhmd-static.dir/src/drv_psvr/psvr.c.o" \
"CMakeFiles/openhmd-static.dir/src/drv_psvr/packet.c.o"

# External object files for target openhmd-static
openhmd__static_EXTERNAL_OBJECTS =

subprojects/openhmd/libopenhmd.a: subprojects/openhmd/CMakeFiles/openhmd-static.dir/src/openhmd.c.o
subprojects/openhmd/libopenhmd.a: subprojects/openhmd/CMakeFiles/openhmd-static.dir/src/platform-win32.c.o
subprojects/openhmd/libopenhmd.a: subprojects/openhmd/CMakeFiles/openhmd-static.dir/src/drv_dummy/dummy.c.o
subprojects/openhmd/libopenhmd.a: subprojects/openhmd/CMakeFiles/openhmd-static.dir/src/omath.c.o
subprojects/openhmd/libopenhmd.a: subprojects/openhmd/CMakeFiles/openhmd-static.dir/src/platform-posix.c.o
subprojects/openhmd/libopenhmd.a: subprojects/openhmd/CMakeFiles/openhmd-static.dir/src/fusion.c.o
subprojects/openhmd/libopenhmd.a: subprojects/openhmd/CMakeFiles/openhmd-static.dir/src/shaders.c.o
subprojects/openhmd/libopenhmd.a: subprojects/openhmd/CMakeFiles/openhmd-static.dir/src/drv_psvr/psvr.c.o
subprojects/openhmd/libopenhmd.a: subprojects/openhmd/CMakeFiles/openhmd-static.dir/src/drv_psvr/packet.c.o
subprojects/openhmd/libopenhmd.a: subprojects/openhmd/CMakeFiles/openhmd-static.dir/build.make
subprojects/openhmd/libopenhmd.a: subprojects/openhmd/CMakeFiles/openhmd-static.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/msparks/Development/PSVR-SteamVR-openHMD/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Linking C static library libopenhmd.a"
	cd /home/msparks/Development/PSVR-SteamVR-openHMD/build/subprojects/openhmd && $(CMAKE_COMMAND) -P CMakeFiles/openhmd-static.dir/cmake_clean_target.cmake
	cd /home/msparks/Development/PSVR-SteamVR-openHMD/build/subprojects/openhmd && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/openhmd-static.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
subprojects/openhmd/CMakeFiles/openhmd-static.dir/build: subprojects/openhmd/libopenhmd.a
.PHONY : subprojects/openhmd/CMakeFiles/openhmd-static.dir/build

subprojects/openhmd/CMakeFiles/openhmd-static.dir/clean:
	cd /home/msparks/Development/PSVR-SteamVR-openHMD/build/subprojects/openhmd && $(CMAKE_COMMAND) -P CMakeFiles/openhmd-static.dir/cmake_clean.cmake
.PHONY : subprojects/openhmd/CMakeFiles/openhmd-static.dir/clean

subprojects/openhmd/CMakeFiles/openhmd-static.dir/depend:
	cd /home/msparks/Development/PSVR-SteamVR-openHMD/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/msparks/Development/PSVR-SteamVR-openHMD /home/msparks/Development/PSVR-SteamVR-openHMD/subprojects/openhmd /home/msparks/Development/PSVR-SteamVR-openHMD/build /home/msparks/Development/PSVR-SteamVR-openHMD/build/subprojects/openhmd /home/msparks/Development/PSVR-SteamVR-openHMD/build/subprojects/openhmd/CMakeFiles/openhmd-static.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : subprojects/openhmd/CMakeFiles/openhmd-static.dir/depend

