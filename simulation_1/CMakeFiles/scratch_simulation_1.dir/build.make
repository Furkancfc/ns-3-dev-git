# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.28

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
CMAKE_SOURCE_DIR = /mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev

# Include any dependencies generated for this target.
include scratch/simulation_1/CMakeFiles/scratch_simulation_1.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include scratch/simulation_1/CMakeFiles/scratch_simulation_1.dir/compiler_depend.make

# Include the progress variables for this target.
include scratch/simulation_1/CMakeFiles/scratch_simulation_1.dir/progress.make

# Include the compile flags for this target's objects.
include scratch/simulation_1/CMakeFiles/scratch_simulation_1.dir/flags.make

scratch/simulation_1/CMakeFiles/scratch_simulation_1.dir/simulation_1.cc.o: scratch/simulation_1/CMakeFiles/scratch_simulation_1.dir/flags.make
scratch/simulation_1/CMakeFiles/scratch_simulation_1.dir/simulation_1.cc.o: scratch/simulation_1/simulation_1.cc
scratch/simulation_1/CMakeFiles/scratch_simulation_1.dir/simulation_1.cc.o: scratch/simulation_1/CMakeFiles/scratch_simulation_1.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object scratch/simulation_1/CMakeFiles/scratch_simulation_1.dir/simulation_1.cc.o"
	cd /mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/scratch/simulation_1 && /usr/bin/ccache /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT scratch/simulation_1/CMakeFiles/scratch_simulation_1.dir/simulation_1.cc.o -MF CMakeFiles/scratch_simulation_1.dir/simulation_1.cc.o.d -o CMakeFiles/scratch_simulation_1.dir/simulation_1.cc.o -c /mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/scratch/simulation_1/simulation_1.cc

scratch/simulation_1/CMakeFiles/scratch_simulation_1.dir/simulation_1.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/scratch_simulation_1.dir/simulation_1.cc.i"
	cd /mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/scratch/simulation_1 && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/scratch/simulation_1/simulation_1.cc > CMakeFiles/scratch_simulation_1.dir/simulation_1.cc.i

scratch/simulation_1/CMakeFiles/scratch_simulation_1.dir/simulation_1.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/scratch_simulation_1.dir/simulation_1.cc.s"
	cd /mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/scratch/simulation_1 && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/scratch/simulation_1/simulation_1.cc -o CMakeFiles/scratch_simulation_1.dir/simulation_1.cc.s

# Object files for target scratch_simulation_1
scratch_simulation_1_OBJECTS = \
"CMakeFiles/scratch_simulation_1.dir/simulation_1.cc.o"

# External object files for target scratch_simulation_1
scratch_simulation_1_EXTERNAL_OBJECTS =

scratch/simulation_1/scratch_simulation_1: scratch/simulation_1/CMakeFiles/scratch_simulation_1.dir/simulation_1.cc.o
scratch/simulation_1/scratch_simulation_1: scratch/simulation_1/CMakeFiles/scratch_simulation_1.dir/build.make
scratch/simulation_1/scratch_simulation_1: /usr/lib/x86_64-linux-gnu/libxml2.so
scratch/simulation_1/scratch_simulation_1: /usr/lib/x86_64-linux-gnu/libfreetype.so
scratch/simulation_1/scratch_simulation_1: /usr/lib/x86_64-linux-gnu/libglib-2.0.so
scratch/simulation_1/scratch_simulation_1: /usr/lib/x86_64-linux-gnu/libgthread-2.0.so
scratch/simulation_1/scratch_simulation_1: /usr/lib/x86_64-linux-gnu/libgobject-2.0.so
scratch/simulation_1/scratch_simulation_1: /usr/lib/x86_64-linux-gnu/libgio-2.0.so
scratch/simulation_1/scratch_simulation_1: /usr/lib/x86_64-linux-gnu/libgdk_pixbuf-2.0.so
scratch/simulation_1/scratch_simulation_1: /usr/lib/x86_64-linux-gnu/libgdk-3.so
scratch/simulation_1/scratch_simulation_1: /usr/lib/x86_64-linux-gnu/libgtk-3.so
scratch/simulation_1/scratch_simulation_1: /usr/lib/x86_64-linux-gnu/libcairo.so
scratch/simulation_1/scratch_simulation_1: /usr/lib/x86_64-linux-gnu/libpango-1.0.so
scratch/simulation_1/scratch_simulation_1: /usr/lib/x86_64-linux-gnu/libatk-1.0.so
scratch/simulation_1/scratch_simulation_1: /usr/lib/x86_64-linux-gnu/libsqlite3.so
scratch/simulation_1/scratch_simulation_1: scratch/simulation_1/CMakeFiles/scratch_simulation_1.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable scratch_simulation_1"
	cd /mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/scratch/simulation_1 && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/scratch_simulation_1.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
scratch/simulation_1/CMakeFiles/scratch_simulation_1.dir/build: scratch/simulation_1/scratch_simulation_1
.PHONY : scratch/simulation_1/CMakeFiles/scratch_simulation_1.dir/build

scratch/simulation_1/CMakeFiles/scratch_simulation_1.dir/clean:
	cd /mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/scratch/simulation_1 && $(CMAKE_COMMAND) -P CMakeFiles/scratch_simulation_1.dir/cmake_clean.cmake
.PHONY : scratch/simulation_1/CMakeFiles/scratch_simulation_1.dir/clean

scratch/simulation_1/CMakeFiles/scratch_simulation_1.dir/depend:
	cd /mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev /mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/scratch/simulation_1 /mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev /mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/scratch/simulation_1 /mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/scratch/simulation_1/CMakeFiles/scratch_simulation_1.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : scratch/simulation_1/CMakeFiles/scratch_simulation_1.dir/depend

