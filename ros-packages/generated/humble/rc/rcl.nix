{
  ament-cmake-gen-version-h,
  ament-cmake-gtest,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch-testing,
  launch-testing-ament-cmake,
  mimick-vendor,
  mkSourceSet,
  osrf-testing-tools-cpp,
  rcl-interfaces,
  rcl-logging-interface,
  rcl-logging-spdlog,
  rcl-yaml-param-parser,
  rcpputils,
  rcutils,
  rmw,
  rmw-implementation,
  rmw-implementation-cmake,
  rosSystemPackages,
  rosidl-runtime-c,
  substituteSource,
  test-msgs,
  tracetools,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rcl";
  version = "5.3.12-1";
  src = finalAttrs.passthru.sources."rcl";
  nativeBuildInputs = [ ament-cmake-gen-version-h ament-cmake-ros ];
  propagatedNativeBuildInputs = [ rcl-interfaces rcl-logging-interface rcl-logging-spdlog rcl-yaml-param-parser rcutils rmw rmw-implementation rosidl-runtime-c tracetools ];
  buildInputs = [ ament-cmake-gen-version-h ament-cmake-ros ];
  propagatedBuildInputs = [ rcl-interfaces rcl-logging-interface rcl-logging-spdlog rcl-yaml-param-parser rcutils rmw rmw-implementation rosidl-runtime-c tracetools ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common launch launch-testing launch-testing-ament-cmake mimick-vendor osrf-testing-tools-cpp rcpputils rmw rmw-implementation-cmake test-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "rcl" = substituteSource {
      src = fetchgit {
        name = "rcl-source";
        url = "https://github.com/ros2-gbp/rcl-release.git";
        rev = "3991b81384e99b1511f394a36a017be19d7996bb";
        hash = "sha256-eKUVvVrlz1gd6VFyxKrbbB+nUgMNlxhGztUWt+BwSlU=";
      };
    };
  });
  meta = {
    description = "The ROS client library common implementation.\n    This package contains an API which builds on the ROS middleware API and is optionally built upon by the other ROS client libraries.\n  ";
  };
})
