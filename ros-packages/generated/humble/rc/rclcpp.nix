{
  ament-cmake-gen-version-h,
  ament-cmake-gmock,
  ament-cmake-google-benchmark,
  ament-cmake-gtest,
  ament-cmake-ros,
  ament-index-cpp,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  libstatistics-collector,
  mimick-vendor,
  mkSourceSet,
  performance-test-fixture,
  rcl,
  rcl-interfaces,
  rcl-yaml-param-parser,
  rcpputils,
  rcutils,
  rmw,
  rmw-implementation-cmake,
  rosSystemPackages,
  rosgraph-msgs,
  rosidl-default-generators,
  rosidl-runtime-cpp,
  rosidl-typesupport-c,
  rosidl-typesupport-cpp,
  statistics-msgs,
  substituteSource,
  test-msgs,
  tracetools,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rclcpp";
  version = "16.0.17-1";
  src = finalAttrs.passthru.sources."rclcpp";
  nativeBuildInputs = [ ament-cmake-gen-version-h ament-cmake-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3" ]; };
  propagatedNativeBuildInputs = [ ament-index-cpp builtin-interfaces libstatistics-collector rcl rcl-interfaces rcl-yaml-param-parser rcpputils rcutils rmw rosgraph-msgs rosidl-runtime-cpp rosidl-typesupport-c rosidl-typesupport-cpp statistics-msgs tracetools ];
  buildInputs = [ ament-cmake-gen-version-h ament-cmake-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3" ]; };
  propagatedBuildInputs = [ ament-index-cpp builtin-interfaces libstatistics-collector rcl rcl-interfaces rcl-yaml-param-parser rcpputils rcutils rmw rosgraph-msgs rosidl-runtime-cpp rosidl-typesupport-c rosidl-typesupport-cpp statistics-msgs tracetools ];
  checkInputs = [ ament-cmake-gmock ament-cmake-google-benchmark ament-cmake-gtest ament-lint-auto ament-lint-common mimick-vendor performance-test-fixture rmw rmw-implementation-cmake rosidl-default-generators test-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "rclcpp" = substituteSource {
      src = fetchgit {
        name = "rclcpp-source";
        url = "https://github.com/ros2-gbp/rclcpp-release.git";
        rev = "dc42bc359b6f6630bf9ef6b5b8fc483018a03b94";
        hash = "sha256-nnhUN67C+8pLE0j8IPNq1wxPSW0GxgFPprxaVfQNH0M=";
      };
    };
  });
  meta = {
    description = "The ROS client library in C++.";
  };
})
