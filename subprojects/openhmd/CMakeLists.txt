cmake_minimum_required(VERSION 2.8)

project(openhmd C CXX)
set(CMAKE_C_FLAGS "-std=c++11")
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED True)
set(CMAKE_POSITION_INDEPENDENT_CODE ON)

set(LIB_VERSION_MAJOR 0)
set(LIB_VERSION_MINOR 1)
set(LIB_VERSION_PATCH 0)
set(LIB_VERSION_STRING ${LIB_VERSION_MAJOR}.${LIB_VERSION_MINOR}.${LIB_VERSION_PATCH})

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/cmake/")
include_directories(${CMAKE_CURRENT_LIST_DIR}/include)

if (MSVC)
  # Add the "lib" prefix for generated .lib outputs.
  set(LIB_PREFIX lib)
else (MSVC)
  # When building with "make", "lib" prefix will be added automatically by
  # the build tool.
  set(LIB_PREFIX)
endif (MSVC)

#source files set just for Android
set(openhmd_source_files
	${CMAKE_CURRENT_LIST_DIR}/src/openhmd.c
	${CMAKE_CURRENT_LIST_DIR}/src/platform-win32.c
	${CMAKE_CURRENT_LIST_DIR}/src/drv_dummy/dummy.c
	${CMAKE_CURRENT_LIST_DIR}/src/omath.c
	${CMAKE_CURRENT_LIST_DIR}/src/platform-posix.c
	${CMAKE_CURRENT_LIST_DIR}/src/fusion.c
	${CMAKE_CURRENT_LIST_DIR}/src/shaders.c
)

OPTION(OPENHMD_DRIVER_OCULUS_RIFT "Oculus Rift DK1 and DK2" OFF)
OPTION(OPENHMD_DRIVER_DEEPOON "Deepoon E2" OFF)
OPTION(OPENHMD_DRIVER_WMR "Windows Mixed Reality" OFF)
OPTION(OPENHMD_DRIVER_PSVR "Sony PSVR" ON)
OPTION(OPENHMD_DRIVER_HTC_VIVE "HTC Vive" OFF)
OPTION(OPENHMD_DRIVER_NOLO "NOLO VR CV1" OFF)
OPTION(OPENHMD_DRIVER_XGVR "3Glasses HMD" OFF)
OPTION(OPENHMD_DRIVER_EXTERNAL "External sensor driver" OFF)
OPTION(OPENHMD_DRIVER_ANDROID "General Android driver" OFF)

OPTION(OPENHMD_EXAMPLE_SIMPLE "Simple test binary" ON)
OPTION(OPENHMD_EXAMPLE_SDL "SDL OpenGL test (outdated)" OFF)

if(OPENHMD_DRIVER_OCULUS_RIFT)
	set(openhmd_source_files ${openhmd_source_files}
	${CMAKE_CURRENT_LIST_DIR}/src/drv_oculus_rift/rift.c
	${CMAKE_CURRENT_LIST_DIR}/src/drv_oculus_rift/packet.c
	)
	add_definitions(-DDRIVER_OCULUS_RIFT)

	find_package(HIDAPI REQUIRED)
	include_directories(${HIDAPI_INCLUDE_DIRS})
	set(LIBS ${LIBS} ${HIDAPI_LIBRARIES})
endif(OPENHMD_DRIVER_OCULUS_RIFT)

if(OPENHMD_DRIVER_DEEPOON)
	set(openhmd_source_files ${openhmd_source_files}
	${CMAKE_CURRENT_LIST_DIR}/src/drv_deepoon/deepoon.c
	${CMAKE_CURRENT_LIST_DIR}/src/drv_deepoon/packet.c
	)
	add_definitions(-DDRIVER_DEEPOON)

	find_package(HIDAPI REQUIRED)
	include_directories(${HIDAPI_INCLUDE_DIRS})
	set(LIBS ${LIBS} ${HIDAPI_LIBRARIES})
endif(OPENHMD_DRIVER_DEEPOON)

if(OPENHMD_DRIVER_WMR)
	set(openhmd_source_files ${openhmd_source_files}
	${CMAKE_CURRENT_LIST_DIR}/src/drv_wmr/wmr.c
	${CMAKE_CURRENT_LIST_DIR}/src/drv_wmr/packet.c
	)
	add_definitions(-DDRIVER_WMR)

	find_package(HIDAPI REQUIRED)
	include_directories(${HIDAPI_INCLUDE_DIRS})
	set(LIBS ${LIBS} ${HIDAPI_LIBRARIES})
endif(OPENHMD_DRIVER_WMR)

if(OPENHMD_DRIVER_PSVR)
	set(openhmd_source_files ${openhmd_source_files}
	${CMAKE_CURRENT_LIST_DIR}/src/drv_psvr/psvr.c
	${CMAKE_CURRENT_LIST_DIR}/src/drv_psvr/packet.c
	${CMAKE_CURRENT_LIST_DIR}/src/drv_psvr/Simulation.cpp 
	${CMAKE_CURRENT_LIST_DIR}/src/drv_psvr/scppnt/scppnt_error.cpp 
	)
	
	add_definitions(-DDRIVER_PSVR)

	find_package(HIDAPI REQUIRED)
	
	include_directories(${HIDAPI_INCLUDE_DIRS})
	set(LIBS ${LIBS} ${HIDAPI_LIBRARIES})
endif(OPENHMD_DRIVER_PSVR)

if(OPENHMD_DRIVER_HTC_VIVE)
	set(openhmd_source_files ${openhmd_source_files}
	${CMAKE_CURRENT_LIST_DIR}/src/drv_htc_vive/vive.c
	${CMAKE_CURRENT_LIST_DIR}/src/drv_htc_vive/packet.c
	#${CMAKE_CURRENT_LIST_DIR}/src/ext_deps/miniz.c
	${CMAKE_CURRENT_LIST_DIR}/src/ext_deps/nxjson.c
	)
	add_definitions(-DDRIVER_HTC_VIVE)

	find_package(HIDAPI REQUIRED)
	include_directories(${HIDAPI_INCLUDE_DIRS})
	set(LIBS ${LIBS} ${HIDAPI_LIBRARIES})
endif(OPENHMD_DRIVER_HTC_VIVE)

if(OPENHMD_DRIVER_NOLO)
	set(openhmd_source_files ${openhmd_source_files}
	${CMAKE_CURRENT_LIST_DIR}/src/drv_nolo/nolo.c
	${CMAKE_CURRENT_LIST_DIR}/src/drv_nolo/packet.c
	)
	add_definitions(-DDRIVER_NOLO)

	find_package(HIDAPI REQUIRED)
	include_directories(${HIDAPI_INCLUDE_DIRS})
	set(LIBS ${LIBS} ${HIDAPI_LIBRARIES})
endif(OPENHMD_DRIVER_NOLO)

if(OPENHMD_DRIVER_XGVR)
	set(openhmd_source_files ${openhmd_source_files}
	${CMAKE_CURRENT_LIST_DIR}/src/drv_3glasses/xgvr.c
	${CMAKE_CURRENT_LIST_DIR}/src/drv_3glasses/packet.c
	)
	add_definitions(-DDRIVER_XGVR)

	find_package(HIDAPI REQUIRED)
	include_directories(${HIDAPI_INCLUDE_DIRS})
	set(LIBS ${LIBS} ${HIDAPI_LIBRARIES})
endif(OPENHMD_DRIVER_XGVR)

if (OPENHMD_DRIVER_EXTERNAL)
	set(openhmd_source_files ${openhmd_source_files}
	${CMAKE_CURRENT_LIST_DIR}/src/drv_external/external.c
	)
	add_definitions(-DDRIVER_EXTERNAL)
endif(OPENHMD_DRIVER_EXTERNAL)

if (OPENHMD_DRIVER_ANDROID)
	set(openhmd_source_files ${openhmd_source_files}
	${CMAKE_CURRENT_LIST_DIR}/src/drv_android/android.c
	)
	add_definitions(-DDRIVER_ANDROID)
endif(OPENHMD_DRIVER_ANDROID)

if (OPENHMD_EXAMPLE_SIMPLE)
	#add_subdirectory(./examples/simple)
endif(OPENHMD_EXAMPLE_SIMPLE)

if (OPENHMD_EXAMPLE_SDL)
	find_package(SDL2 REQUIRED)
	find_package(GLEW REQUIRED)
	find_package(OpenGL REQUIRED)
	add_subdirectory(./examples/opengl)
endif (OPENHMD_EXAMPLE_SDL)

if (UNIX)
	set(LIBS ${LIBS} rt pthread)
endif (UNIX)

link_libraries(${LIBS})
add_library(openhmd-shared SHARED ${openhmd_source_files})
SET_TARGET_PROPERTIES(openhmd-shared PROPERTIES OUTPUT_NAME openhmd CLEAN_DIRECT_OUTPUT 1 VERSION ${LIB_VERSION_STRING} SOVERSION ${LIB_VERSION_MAJOR})
add_library(openhmd-static STATIC ${openhmd_source_files})
SET_TARGET_PROPERTIES(openhmd-static PROPERTIES OUTPUT_NAME openhmd CLEAN_DIRECT_OUTPUT 1)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_CURRENT_DIR}/)

#install properties
install (TARGETS openhmd-shared openhmd-static DESTINATION lib)
install (FILES include/openhmd.h DESTINATION include)
