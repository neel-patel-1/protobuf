# CMake definitions for libprotobuf (the "full" C++ protobuf runtime).

include(${protobuf_SOURCE_DIR}/src/file_lists.cmake)
include(${protobuf_SOURCE_DIR}/cmake/protobuf-configure-target.cmake)

set(BC_EMIT_FLAGS "-emit-llvm -g -S -O3")
set(${BC_EMIT_DIR} "${CMAKE_CURRENT_BINARY_DIR}/src_bc_files")
add_custom_target(build-time-bc-directory ALL
  COMMAND ${CMAKE_COMMAND} -E make_directory ${BC_EMIT_DIR}
)

foreach(_src IN ITEMS ${libprotobuf_srcs})
  message(STATUS "libprotobuf_pass: ${_src}")
  set(BC_FILE "${CMAKE_CURRENT_BINARY_DIR}/${_src}.bc")
  add_custom_command(
    OUTPUT ${BC_FILE}
    COMMAND ${CMAKE_CXX_COMPILER} ${CMAKE_CXX_FLAGS} ${BC_EMIT_FLAGS} -c ${_src} -o ${BC_FILE}
  )
endforeach()
