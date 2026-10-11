cmake_minimum_required(VERSION 3.20)

project(RepairableCmakeFixture LANGUAGES NONE)

# ManualTitle is supplied by the local package configuration in cmake/packages.
# This prefix has a deliberate typo: "package" instead of "packages".
list(PREPEND CMAKE_PREFIX_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake/package")

find_package(ManualTitle CONFIG REQUIRED)
