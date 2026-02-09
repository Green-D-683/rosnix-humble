{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rmw,
  rmw-implementation-cmake,
  rosSystemPackages,
  std-msgs,
  substituteSource,
  tlsf,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "tlsf_cpp";
  version = "0.13.0-2";
  src = finalAttrs.passthru.sources."tlsf_cpp";
  propagatedNativeBuildInputs = [ ament-cmake rclcpp rmw std-msgs tlsf ];
  propagatedBuildInputs = [ ament-cmake rclcpp rmw std-msgs tlsf ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common rmw-implementation-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "tlsf_cpp" = substituteSource {
      src = fetchgit {
        name = "tlsf_cpp-source";
        url = "https://github.com/ros2-gbp/realtime_support-release.git";
        rev = "2cc70b113e45e90cfafd2f8d0513cadaf8c378bb";
        hash = "sha256-hFBDZgnV3zbkfn2UU+rDhfvVOEVwnA+uEZzeSaxBjY4=";
      };
    };
  });
  meta = {
    description = "C++ stdlib-compatible wrapper around tlsf allocator and ROS2 examples";
  };
})
