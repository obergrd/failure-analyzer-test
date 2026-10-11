include_guard(GLOBAL)

if(NOT TARGET ManualTitle::ManualTitle)
  add_library(ManualTitle::ManualTitle INTERFACE IMPORTED)
  set_property(
    TARGET ManualTitle::ManualTitle
    PROPERTY INTERFACE_COMPILE_DEFINITIONS MANUAL_TITLE_PACKAGE_AVAILABLE=1
  )
endif()
