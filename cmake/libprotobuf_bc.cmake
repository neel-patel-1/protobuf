# CMake definitions for libprotobuf (the "full" C++ protobuf runtime).

include(${protobuf_SOURCE_DIR}/src/file_lists.cmake)
include(${protobuf_SOURCE_DIR}/cmake/protobuf-configure-target.cmake)

add_library(libprotobuf_pass ${protobuf_SHARED_OR_STATIC}
  ${libprotobuf_srcs}
  ${libprotobuf_hdrs}
  ${protobuf_version_rc_file})

foreach(_src IN ITEMS ${libprotobuf_srcs})
  message(STATUS "libprotobuf_pass: ${_src}")
endforeach()

set_target_properties(libprotobuf_pass PROPERTIES LINKER_LANGUAGE CXX)

llvmir_attach_bc_target( TARGET libprotobuf_pass_bc DEPENDS libprotobuf_pass )
llvmir_attach_opt_pass_target( TARGET libprotobuf_pass_bc_opt DEPENDS libprotobuf_pass_bc -mem2reg )