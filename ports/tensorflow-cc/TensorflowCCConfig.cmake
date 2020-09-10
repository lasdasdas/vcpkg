set(tensorflow_cc_INCLUDE_DIR "${CMAKE_CURRENT_LIST_DIR}/../../include")

message(WARNING "Tensorflow has vendored dependencies. You may need to manually include files from tensorflow-external")
set(tensorflow_cc_INCLUDE_DIRS
	${tensorflow_cc_INCLUDE_DIR}
	${tensorflow_cc_INCLUDE_DIR}/tensorflow-external/
	${tensorflow_cc_INCLUDE_DIR}/tensorflow-external/tensorflow/
	${tensorflow_cc_INCLUDE_DIR}/tensorflow-external/external/com_google_absl
	${tensorflow_cc_INCLUDE_DIR}/tensorflow-external/bazel-out/k8-opt/bin/
	${tensorflow_cc_INCLUDE_DIR}/tensorflow-external/external/protobuf_archive/src/
	${tensorflow_cc_INCLUDE_DIR}/tensorflow-external/bazel-out/${TARGET_TRIPLET}-opt/bin/
)

add_library(tensorflow_cc::tensorflow_framework SHARED IMPORTED)
set_target_properties(tensorflow_cc::tensorflow_framework
	PROPERTIES
	IMPORTED_LOCATION ${CMAKE_CURRENT_LIST_DIR}/../../lib/libtensorflow_framework.so.1.14.0
	INTERFACE_INCLUDE_DIRECTORIES "${tensorflow_cc_INCLUDE_DIRS}"
)

add_library(tensorflow_cc::tensorflow_cc SHARED IMPORTED)
set_target_properties(tensorflow_cc::tensorflow_cc
	PROPERTIES
	IMPORTED_LOCATION ${CMAKE_CURRENT_LIST_DIR}/../../lib/libtensorflow_cc.so.1.14.0
	INTERFACE_INCLUDE_DIRECTORIES "${tensorflow_cc_INCLUDE_DIRS}"
)

FIND_LIBRARY(tfccimport NAMES libtensorflow_cc.so.1.14.0.if PATHS "E:/vcpkg/vcpkg/buildtrees/tensorflow-cc/x64-windows-rel/bazel-out/x64_windows-opt/bin/tensorflow/")
FIND_LIBRARY(tfframeworkimport NAMES libtensorflow_framework.so.1.14.0.if PATHS "E:/vcpkg/vcpkg/buildtrees/tensorflow-cc/x64-windows-rel/bazel-out/x64_windows-opt/bin/tensorflow/")

set(tensorflow_cc_FOUND TRUE)
set(tensorflow_framework_FOUND TRUE)
