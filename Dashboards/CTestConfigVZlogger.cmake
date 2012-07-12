## This file should be placed in the root directory of your project.
## Then modify the CMakeLists.txt file in the root directory of your
## project to incorporate the testing dashboard.
## # The following are required to uses Dart and the Cdash dashboard
##   ENABLE_TESTING()
##   INCLUDE(CTest)
set(CTEST_PROJECT_NAME "vzlogger")
set(CTEST_NIGHTLY_START_TIME "04:00:00 GMT")

set(CTEST_DROP_METHOD "http")
set(CTEST_DROP_SITE "pubdoc.itwm.fhg.de")
set(CTEST_DROP_LOCATION "/p/hpc/pspro/cdash/submit.php?project=${CTEST_PROJECT_NAME}")
set(CTEST_DROP_SITE_CDASH TRUE)

#SET (CTEST_TRIGGER_SITE "http:///cgi-bin/Submit-CMake-TestingResults.pl")
#SET (VALGRIND_COMMAND_OPTIONS "-q --tool=memcheck --leak-check=full --show-reachable=yes --workaround-gcc296-bugs=yes --num-callers=50")
#SET (CTEST_EXPERIMENTAL_COVERAGE_EXCLUDE ".*test_.*")
site_name(CTEST_SITE)

#set(_git_branch "development")
#set(_git_branch "origin/c++-port")
set(_git_branch "c++-port")
set(GIT_UPDATE_OPTIONS "pull")

if(NOT TARGET_ARCH)
  message("=1======> Setup Arch: ${TARGET_ARCH}")
  set(CTEST_BUILD_ARCH "linux")
else(NOT TARGET_ARCH)
  message("=2======> Setup Arch: ${TARGET_ARCH}")
  set(CTEST_BUILD_ARCH ${TARGET_ARCH})
  if(${TARGET_ARCH} MATCHES "ar71xx")
    message("=3======> Setup Arch: ${TARGET_ARCH}")
    set(CMAKE_TOOLCHAIN_FILE /usr/local/OpenWrt-SDK-ar71xx-for-Linux-x86_64-gcc-4.3.3+cs_uClibc-0.9.30.1/staging_dir/host/Modules/Toolchain-OpenWRT.cmake)
  else(${TARGET_ARCH} MATCHES "ar71xx")
    set(CMAKE_TOOLCHAIN_FILE "CMAKE_TOOLCHAIN_FILE-NO_FOUND")
  endif(${TARGET_ARCH} MATCHES "ar71xx")
endif(NOT TARGET_ARCH)

set(CTEST_BUILD_NAME "${CTEST_BUILD_ARCH}-gcc-default")
set(_projectNameDir "${CTEST_PROJECT_NAME}")
set(_srcDir "srcdir")
set(_buildDir "builddir")
