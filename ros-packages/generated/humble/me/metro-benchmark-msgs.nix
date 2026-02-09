{
  ament-cmake,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "metro_benchmark_msgs";
  version = "0.1.1-1";
  src = finalAttrs.passthru.sources."metro_benchmark_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ builtin-interfaces rosidl-default-generators rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-generators rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "metro_benchmark_msgs" = substituteSource {
      src = fetchgit {
        name = "metro_benchmark_msgs-source";
        url = "https://github.com/ros2-gbp/metrics_msgs-release.git";
        rev = "ab126a1fbe5a0b1144a3d9c4876efdf79c2da310";
        hash = "sha256-IibKYo4coLXb0qHUZfogDC9ljP8aSzyuXb9ul9nmVNE=";
      };
    };
  });
  meta = {
    description = "ROS interfaces for recording compute time and other related benchmarking concepts";
  };
})
