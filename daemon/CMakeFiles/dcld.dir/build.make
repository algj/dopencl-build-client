# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

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
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/usergpu/dopencl

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/usergpu/dopencl/build

# Include any dependencies generated for this target.
include daemon/CMakeFiles/dcld.dir/depend.make

# Include the progress variables for this target.
include daemon/CMakeFiles/dcld.dir/progress.make

# Include the compile flags for this target's objects.
include daemon/CMakeFiles/dcld.dir/flags.make

daemon/CMakeFiles/dcld.dir/src/CommandQueue.cpp.o: daemon/CMakeFiles/dcld.dir/flags.make
daemon/CMakeFiles/dcld.dir/src/CommandQueue.cpp.o: ../daemon/src/CommandQueue.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/usergpu/dopencl/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object daemon/CMakeFiles/dcld.dir/src/CommandQueue.cpp.o"
	cd /home/usergpu/dopencl/build/daemon && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/dcld.dir/src/CommandQueue.cpp.o -c /home/usergpu/dopencl/daemon/src/CommandQueue.cpp

daemon/CMakeFiles/dcld.dir/src/CommandQueue.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/dcld.dir/src/CommandQueue.cpp.i"
	cd /home/usergpu/dopencl/build/daemon && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/usergpu/dopencl/daemon/src/CommandQueue.cpp > CMakeFiles/dcld.dir/src/CommandQueue.cpp.i

daemon/CMakeFiles/dcld.dir/src/CommandQueue.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/dcld.dir/src/CommandQueue.cpp.s"
	cd /home/usergpu/dopencl/build/daemon && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/usergpu/dopencl/daemon/src/CommandQueue.cpp -o CMakeFiles/dcld.dir/src/CommandQueue.cpp.s

daemon/CMakeFiles/dcld.dir/src/Context.cpp.o: daemon/CMakeFiles/dcld.dir/flags.make
daemon/CMakeFiles/dcld.dir/src/Context.cpp.o: ../daemon/src/Context.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/usergpu/dopencl/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object daemon/CMakeFiles/dcld.dir/src/Context.cpp.o"
	cd /home/usergpu/dopencl/build/daemon && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/dcld.dir/src/Context.cpp.o -c /home/usergpu/dopencl/daemon/src/Context.cpp

daemon/CMakeFiles/dcld.dir/src/Context.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/dcld.dir/src/Context.cpp.i"
	cd /home/usergpu/dopencl/build/daemon && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/usergpu/dopencl/daemon/src/Context.cpp > CMakeFiles/dcld.dir/src/Context.cpp.i

daemon/CMakeFiles/dcld.dir/src/Context.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/dcld.dir/src/Context.cpp.s"
	cd /home/usergpu/dopencl/build/daemon && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/usergpu/dopencl/daemon/src/Context.cpp -o CMakeFiles/dcld.dir/src/Context.cpp.s

daemon/CMakeFiles/dcld.dir/src/Device.cpp.o: daemon/CMakeFiles/dcld.dir/flags.make
daemon/CMakeFiles/dcld.dir/src/Device.cpp.o: ../daemon/src/Device.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/usergpu/dopencl/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object daemon/CMakeFiles/dcld.dir/src/Device.cpp.o"
	cd /home/usergpu/dopencl/build/daemon && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/dcld.dir/src/Device.cpp.o -c /home/usergpu/dopencl/daemon/src/Device.cpp

daemon/CMakeFiles/dcld.dir/src/Device.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/dcld.dir/src/Device.cpp.i"
	cd /home/usergpu/dopencl/build/daemon && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/usergpu/dopencl/daemon/src/Device.cpp > CMakeFiles/dcld.dir/src/Device.cpp.i

daemon/CMakeFiles/dcld.dir/src/Device.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/dcld.dir/src/Device.cpp.s"
	cd /home/usergpu/dopencl/build/daemon && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/usergpu/dopencl/daemon/src/Device.cpp -o CMakeFiles/dcld.dir/src/Device.cpp.s

daemon/CMakeFiles/dcld.dir/src/Event.cpp.o: daemon/CMakeFiles/dcld.dir/flags.make
daemon/CMakeFiles/dcld.dir/src/Event.cpp.o: ../daemon/src/Event.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/usergpu/dopencl/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object daemon/CMakeFiles/dcld.dir/src/Event.cpp.o"
	cd /home/usergpu/dopencl/build/daemon && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/dcld.dir/src/Event.cpp.o -c /home/usergpu/dopencl/daemon/src/Event.cpp

daemon/CMakeFiles/dcld.dir/src/Event.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/dcld.dir/src/Event.cpp.i"
	cd /home/usergpu/dopencl/build/daemon && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/usergpu/dopencl/daemon/src/Event.cpp > CMakeFiles/dcld.dir/src/Event.cpp.i

daemon/CMakeFiles/dcld.dir/src/Event.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/dcld.dir/src/Event.cpp.s"
	cd /home/usergpu/dopencl/build/daemon && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/usergpu/dopencl/daemon/src/Event.cpp -o CMakeFiles/dcld.dir/src/Event.cpp.s

daemon/CMakeFiles/dcld.dir/src/Kernel.cpp.o: daemon/CMakeFiles/dcld.dir/flags.make
daemon/CMakeFiles/dcld.dir/src/Kernel.cpp.o: ../daemon/src/Kernel.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/usergpu/dopencl/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object daemon/CMakeFiles/dcld.dir/src/Kernel.cpp.o"
	cd /home/usergpu/dopencl/build/daemon && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/dcld.dir/src/Kernel.cpp.o -c /home/usergpu/dopencl/daemon/src/Kernel.cpp

daemon/CMakeFiles/dcld.dir/src/Kernel.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/dcld.dir/src/Kernel.cpp.i"
	cd /home/usergpu/dopencl/build/daemon && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/usergpu/dopencl/daemon/src/Kernel.cpp > CMakeFiles/dcld.dir/src/Kernel.cpp.i

daemon/CMakeFiles/dcld.dir/src/Kernel.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/dcld.dir/src/Kernel.cpp.s"
	cd /home/usergpu/dopencl/build/daemon && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/usergpu/dopencl/daemon/src/Kernel.cpp -o CMakeFiles/dcld.dir/src/Kernel.cpp.s

daemon/CMakeFiles/dcld.dir/src/Memory.cpp.o: daemon/CMakeFiles/dcld.dir/flags.make
daemon/CMakeFiles/dcld.dir/src/Memory.cpp.o: ../daemon/src/Memory.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/usergpu/dopencl/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object daemon/CMakeFiles/dcld.dir/src/Memory.cpp.o"
	cd /home/usergpu/dopencl/build/daemon && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/dcld.dir/src/Memory.cpp.o -c /home/usergpu/dopencl/daemon/src/Memory.cpp

daemon/CMakeFiles/dcld.dir/src/Memory.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/dcld.dir/src/Memory.cpp.i"
	cd /home/usergpu/dopencl/build/daemon && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/usergpu/dopencl/daemon/src/Memory.cpp > CMakeFiles/dcld.dir/src/Memory.cpp.i

daemon/CMakeFiles/dcld.dir/src/Memory.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/dcld.dir/src/Memory.cpp.s"
	cd /home/usergpu/dopencl/build/daemon && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/usergpu/dopencl/daemon/src/Memory.cpp -o CMakeFiles/dcld.dir/src/Memory.cpp.s

daemon/CMakeFiles/dcld.dir/src/Program.cpp.o: daemon/CMakeFiles/dcld.dir/flags.make
daemon/CMakeFiles/dcld.dir/src/Program.cpp.o: ../daemon/src/Program.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/usergpu/dopencl/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object daemon/CMakeFiles/dcld.dir/src/Program.cpp.o"
	cd /home/usergpu/dopencl/build/daemon && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/dcld.dir/src/Program.cpp.o -c /home/usergpu/dopencl/daemon/src/Program.cpp

daemon/CMakeFiles/dcld.dir/src/Program.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/dcld.dir/src/Program.cpp.i"
	cd /home/usergpu/dopencl/build/daemon && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/usergpu/dopencl/daemon/src/Program.cpp > CMakeFiles/dcld.dir/src/Program.cpp.i

daemon/CMakeFiles/dcld.dir/src/Program.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/dcld.dir/src/Program.cpp.s"
	cd /home/usergpu/dopencl/build/daemon && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/usergpu/dopencl/daemon/src/Program.cpp -o CMakeFiles/dcld.dir/src/Program.cpp.s

daemon/CMakeFiles/dcld.dir/src/Session.cpp.o: daemon/CMakeFiles/dcld.dir/flags.make
daemon/CMakeFiles/dcld.dir/src/Session.cpp.o: ../daemon/src/Session.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/usergpu/dopencl/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building CXX object daemon/CMakeFiles/dcld.dir/src/Session.cpp.o"
	cd /home/usergpu/dopencl/build/daemon && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/dcld.dir/src/Session.cpp.o -c /home/usergpu/dopencl/daemon/src/Session.cpp

daemon/CMakeFiles/dcld.dir/src/Session.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/dcld.dir/src/Session.cpp.i"
	cd /home/usergpu/dopencl/build/daemon && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/usergpu/dopencl/daemon/src/Session.cpp > CMakeFiles/dcld.dir/src/Session.cpp.i

daemon/CMakeFiles/dcld.dir/src/Session.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/dcld.dir/src/Session.cpp.s"
	cd /home/usergpu/dopencl/build/daemon && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/usergpu/dopencl/daemon/src/Session.cpp -o CMakeFiles/dcld.dir/src/Session.cpp.s

daemon/CMakeFiles/dcld.dir/src/command/SetCompleteCommand.cpp.o: daemon/CMakeFiles/dcld.dir/flags.make
daemon/CMakeFiles/dcld.dir/src/command/SetCompleteCommand.cpp.o: ../daemon/src/command/SetCompleteCommand.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/usergpu/dopencl/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building CXX object daemon/CMakeFiles/dcld.dir/src/command/SetCompleteCommand.cpp.o"
	cd /home/usergpu/dopencl/build/daemon && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/dcld.dir/src/command/SetCompleteCommand.cpp.o -c /home/usergpu/dopencl/daemon/src/command/SetCompleteCommand.cpp

daemon/CMakeFiles/dcld.dir/src/command/SetCompleteCommand.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/dcld.dir/src/command/SetCompleteCommand.cpp.i"
	cd /home/usergpu/dopencl/build/daemon && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/usergpu/dopencl/daemon/src/command/SetCompleteCommand.cpp > CMakeFiles/dcld.dir/src/command/SetCompleteCommand.cpp.i

daemon/CMakeFiles/dcld.dir/src/command/SetCompleteCommand.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/dcld.dir/src/command/SetCompleteCommand.cpp.s"
	cd /home/usergpu/dopencl/build/daemon && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/usergpu/dopencl/daemon/src/command/SetCompleteCommand.cpp -o CMakeFiles/dcld.dir/src/command/SetCompleteCommand.cpp.s

daemon/CMakeFiles/dcld.dir/src/dOpenCLd.cpp.o: daemon/CMakeFiles/dcld.dir/flags.make
daemon/CMakeFiles/dcld.dir/src/dOpenCLd.cpp.o: ../daemon/src/dOpenCLd.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/usergpu/dopencl/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Building CXX object daemon/CMakeFiles/dcld.dir/src/dOpenCLd.cpp.o"
	cd /home/usergpu/dopencl/build/daemon && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/dcld.dir/src/dOpenCLd.cpp.o -c /home/usergpu/dopencl/daemon/src/dOpenCLd.cpp

daemon/CMakeFiles/dcld.dir/src/dOpenCLd.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/dcld.dir/src/dOpenCLd.cpp.i"
	cd /home/usergpu/dopencl/build/daemon && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/usergpu/dopencl/daemon/src/dOpenCLd.cpp > CMakeFiles/dcld.dir/src/dOpenCLd.cpp.i

daemon/CMakeFiles/dcld.dir/src/dOpenCLd.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/dcld.dir/src/dOpenCLd.cpp.s"
	cd /home/usergpu/dopencl/build/daemon && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/usergpu/dopencl/daemon/src/dOpenCLd.cpp -o CMakeFiles/dcld.dir/src/dOpenCLd.cpp.s

daemon/CMakeFiles/dcld.dir/src/main.cpp.o: daemon/CMakeFiles/dcld.dir/flags.make
daemon/CMakeFiles/dcld.dir/src/main.cpp.o: ../daemon/src/main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/usergpu/dopencl/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_11) "Building CXX object daemon/CMakeFiles/dcld.dir/src/main.cpp.o"
	cd /home/usergpu/dopencl/build/daemon && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/dcld.dir/src/main.cpp.o -c /home/usergpu/dopencl/daemon/src/main.cpp

daemon/CMakeFiles/dcld.dir/src/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/dcld.dir/src/main.cpp.i"
	cd /home/usergpu/dopencl/build/daemon && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/usergpu/dopencl/daemon/src/main.cpp > CMakeFiles/dcld.dir/src/main.cpp.i

daemon/CMakeFiles/dcld.dir/src/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/dcld.dir/src/main.cpp.s"
	cd /home/usergpu/dopencl/build/daemon && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/usergpu/dopencl/daemon/src/main.cpp -o CMakeFiles/dcld.dir/src/main.cpp.s

# Object files for target dcld
dcld_OBJECTS = \
"CMakeFiles/dcld.dir/src/CommandQueue.cpp.o" \
"CMakeFiles/dcld.dir/src/Context.cpp.o" \
"CMakeFiles/dcld.dir/src/Device.cpp.o" \
"CMakeFiles/dcld.dir/src/Event.cpp.o" \
"CMakeFiles/dcld.dir/src/Kernel.cpp.o" \
"CMakeFiles/dcld.dir/src/Memory.cpp.o" \
"CMakeFiles/dcld.dir/src/Program.cpp.o" \
"CMakeFiles/dcld.dir/src/Session.cpp.o" \
"CMakeFiles/dcld.dir/src/command/SetCompleteCommand.cpp.o" \
"CMakeFiles/dcld.dir/src/dOpenCLd.cpp.o" \
"CMakeFiles/dcld.dir/src/main.cpp.o"

# External object files for target dcld
dcld_EXTERNAL_OBJECTS =

daemon/dcld: daemon/CMakeFiles/dcld.dir/src/CommandQueue.cpp.o
daemon/dcld: daemon/CMakeFiles/dcld.dir/src/Context.cpp.o
daemon/dcld: daemon/CMakeFiles/dcld.dir/src/Device.cpp.o
daemon/dcld: daemon/CMakeFiles/dcld.dir/src/Event.cpp.o
daemon/dcld: daemon/CMakeFiles/dcld.dir/src/Kernel.cpp.o
daemon/dcld: daemon/CMakeFiles/dcld.dir/src/Memory.cpp.o
daemon/dcld: daemon/CMakeFiles/dcld.dir/src/Program.cpp.o
daemon/dcld: daemon/CMakeFiles/dcld.dir/src/Session.cpp.o
daemon/dcld: daemon/CMakeFiles/dcld.dir/src/command/SetCompleteCommand.cpp.o
daemon/dcld: daemon/CMakeFiles/dcld.dir/src/dOpenCLd.cpp.o
daemon/dcld: daemon/CMakeFiles/dcld.dir/src/main.cpp.o
daemon/dcld: daemon/CMakeFiles/dcld.dir/build.make
daemon/dcld: dclasio/libdcl.so.0.4.0
daemon/dcld: /usr/lib/x86_64-linux-gnu/libboost_program_options.so.1.71.0
daemon/dcld: /usr/lib/x86_64-linux-gnu/libboost_system.so.1.71.0
daemon/dcld: lib842/lib842.a
daemon/dcld: /usr/local/cuda/lib64/libcudart_static.a
daemon/dcld: /usr/lib/x86_64-linux-gnu/librt.so
daemon/dcld: /usr/lib/x86_64-linux-gnu/libOpenCL.so
daemon/dcld: /usr/lib/x86_64-linux-gnu/libnuma.so
daemon/dcld: daemon/CMakeFiles/dcld.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/usergpu/dopencl/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_12) "Linking CXX executable dcld"
	cd /home/usergpu/dopencl/build/daemon && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/dcld.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
daemon/CMakeFiles/dcld.dir/build: daemon/dcld

.PHONY : daemon/CMakeFiles/dcld.dir/build

daemon/CMakeFiles/dcld.dir/clean:
	cd /home/usergpu/dopencl/build/daemon && $(CMAKE_COMMAND) -P CMakeFiles/dcld.dir/cmake_clean.cmake
.PHONY : daemon/CMakeFiles/dcld.dir/clean

daemon/CMakeFiles/dcld.dir/depend:
	cd /home/usergpu/dopencl/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/usergpu/dopencl /home/usergpu/dopencl/daemon /home/usergpu/dopencl/build /home/usergpu/dopencl/build/daemon /home/usergpu/dopencl/build/daemon/CMakeFiles/dcld.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : daemon/CMakeFiles/dcld.dir/depend

