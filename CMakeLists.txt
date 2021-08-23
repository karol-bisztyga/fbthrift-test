PROJECT(KarolExample CXX)

set (CMAKE_CXX_STANDARD 17)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY bin)

find_package(folly REQUIRED)
find_package(gflags REQUIRED)
find_package(glog REQUIRED)

# find_package(thriftcpp2 REQUIRED PATHS /Users/karolbisztyga/Desktop/workspace/tmp/fbthrift-test/fbthrift)

file(GLOB SERVER_CODE "./server/*.cpp")
file(GLOB GENERATED_CODE "./gen-cpp2/*.cpp")

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

add_executable(
  karol_client
  client/client.cpp
)
install(
  TARGETS karol_client
  RUNTIME DESTINATION bin/
)
