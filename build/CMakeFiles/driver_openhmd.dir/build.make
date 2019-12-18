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
include CMakeFiles/driver_openhmd.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/driver_openhmd.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/driver_openhmd.dir/flags.make

CMakeFiles/driver_openhmd.dir/driverlog.cpp.o: CMakeFiles/driver_openhmd.dir/flags.make
CMakeFiles/driver_openhmd.dir/driverlog.cpp.o: ../driverlog.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/media/storage/openhmd/SteamVR-OpenHMD/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/driver_openhmd.dir/driverlog.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/driver_openhmd.dir/driverlog.cpp.o -c /media/storage/openhmd/SteamVR-OpenHMD/driverlog.cpp

CMakeFiles/driver_openhmd.dir/driverlog.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/driver_openhmd.dir/driverlog.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /media/storage/openhmd/SteamVR-OpenHMD/driverlog.cpp > CMakeFiles/driver_openhmd.dir/driverlog.cpp.i

CMakeFiles/driver_openhmd.dir/driverlog.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/driver_openhmd.dir/driverlog.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /media/storage/openhmd/SteamVR-OpenHMD/driverlog.cpp -o CMakeFiles/driver_openhmd.dir/driverlog.cpp.s

CMakeFiles/driver_openhmd.dir/driver_openhmd.cpp.o: CMakeFiles/driver_openhmd.dir/flags.make
CMakeFiles/driver_openhmd.dir/driver_openhmd.cpp.o: ../driver_openhmd.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/media/storage/openhmd/SteamVR-OpenHMD/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/driver_openhmd.dir/driver_openhmd.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/driver_openhmd.dir/driver_openhmd.cpp.o -c /media/storage/openhmd/SteamVR-OpenHMD/driver_openhmd.cpp

CMakeFiles/driver_openhmd.dir/driver_openhmd.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/driver_openhmd.dir/driver_openhmd.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /media/storage/openhmd/SteamVR-OpenHMD/driver_openhmd.cpp > CMakeFiles/driver_openhmd.dir/driver_openhmd.cpp.i

CMakeFiles/driver_openhmd.dir/driver_openhmd.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/driver_openhmd.dir/driver_openhmd.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /media/storage/openhmd/SteamVR-OpenHMD/driver_openhmd.cpp -o CMakeFiles/driver_openhmd.dir/driver_openhmd.cpp.s

# Object files for target driver_openhmd
driver_openhmd_OBJECTS = \
"CMakeFiles/driver_openhmd.dir/driverlog.cpp.o" \
"CMakeFiles/driver_openhmd.dir/driver_openhmd.cpp.o"

# External object files for target driver_openhmd
driver_openhmd_EXTERNAL_OBJECTS =

bin/linux64/driver_openhmd.so: CMakeFiles/driver_openhmd.dir/driverlog.cpp.o
bin/linux64/driver_openhmd.so: CMakeFiles/driver_openhmd.dir/driver_openhmd.cpp.o
bin/linux64/driver_openhmd.so: CMakeFiles/driver_openhmd.dir/build.make
bin/linux64/driver_openhmd.so: subprojects/openhmd/libopenhmd.so.0.1.0
bin/linux64/driver_openhmd.so: /usr/lib64/libhidapi-libusb.so
bin/linux64/driver_openhmd.so: CMakeFiles/driver_openhmd.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/media/storage/openhmd/SteamVR-OpenHMD/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX shared library bin/linux64/driver_openhmd.so"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/driver_openhmd.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/driver_openhmd.dir/build: bin/linux64/driver_openhmd.so

.PHONY : CMakeFiles/driver_openhmd.dir/build

CMakeFiles/driver_openhmd.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/driver_openhmd.dir/cmake_clean.cmake
.PHONY : CMakeFiles/driver_openhmd.dir/clean

CMakeFiles/driver_openhmd.dir/depend:
	cd /media/storage/openhmd/SteamVR-OpenHMD/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /media/storage/openhmd/SteamVR-OpenHMD /media/storage/openhmd/SteamVR-OpenHMD /media/storage/openhmd/SteamVR-OpenHMD/build /media/storage/openhmd/SteamVR-OpenHMD/build /media/storage/openhmd/SteamVR-OpenHMD/build/CMakeFiles/driver_openhmd.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/driver_openhmd.dir/depend

