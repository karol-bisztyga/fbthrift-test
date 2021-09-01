PROJECT(KarolExample CXX)

set (CMAKE_CXX_STANDARD 17)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY bin)

find_package(folly REQUIRED)
find_package(gflags REQUIRED)
find_package(glog REQUIRED)

find_library(LIBASYNC async ../fbthrift/lib/libasync.a)
find_library(LIBCOMPILER async ../fbthrift/lib/libcompiler_generators.a)
find_library(LIBMUSTACHE async ../fbthrift/lib/libmustache_lib.a)
find_library(LIBTHRIFTCPP2 async ../fbthrift/lib/libthriftcpp2.a)
find_library(LIBTHRIFTPROTOCOL async ../fbthrift/lib/libthriftprotocol.a)
find_library(LIBCOMPILERAST async ../fbthrift/lib/libcompiler_ast.a)
find_library(LIBCOMPILERLIB async ../fbthrift/lib/libcompiler_lib.a)
find_library(LIBRPCMETADATA async ../fbthrift/lib/librpcmetadata.a)
find_library(LIBTHRIFTFROZEN2 async ../fbthrift/lib/libthriftfrozen2.a)
find_library(LIBTRANSPORT async ../fbthrift/lib/libtransport.a)
find_library(LIBCOMPILERBASE async ../fbthrift/lib/libcompiler_base.a)
find_library(LIBCOCNCURRENCY async ../fbthrift/lib/libconcurrency.a)
find_library(LIBTHRIFTCORE async ../fbthrift/lib/libthrift-core.a)
find_library(LIBTHRIFTMETADATA async ../fbthrift/lib/libthriftmetadata.a)

include_directories(
  ../fbthrift
  ./gen-cpp2
)

add_library(thriftcpp2 SHARED IMPORTED)
set_property(TARGET thriftcpp2 PROPERTY IMPORTED_LOCATION "/Users/karolbisztyga/Desktop/workspace/tmp/fbthrift/lib/libthriftcpp2.a")

file(GLOB SERVER_CODE "./server/*.cpp")
file(GLOB GENERATED_CODE "./gen-cpp2/*.cpp")

#[[
add_executable(
  karol_server

  ${GENERATED_CODE}
  ${SERVER_CODE}
)
target_link_libraries(
  karol_server
  thriftcpp2
  gflags
  glog::glog
  Folly::folly
)
install(
  TARGETS karol_server
  RUNTIME DESTINATION bin/
)
]]

add_executable(
  karol_client
  ${GENERATED_CODE}
  client/client.cpp
)
target_link_libraries(
  karol_client

  ${LIBASYNC}
  ${LIBCOMPILER}
  ${LIBMUSTACHE}
  ${LIBTHRIFTCPP2}
  ${LIBTHRIFTPROTOCOL}
  ${LIBCOMPILERAST}
  ${LIBCOMPILERLIB}
  ${LIBRPCMETADATA}
  ${LIBTHRIFTFROZEN2}
  ${LIBTRANSPORT}
  ${LIBCOMPILERBASE}
  ${LIBCOCNCURRENCY}
  ${LIBTHRIFTCORE}
  ${LIBTHRIFTCORE}
  ${thriftcpp2}
  gflags
  glog::glog
  Folly::folly
)
install(
  TARGETS karol_client
  RUNTIME DESTINATION bin/
)
