{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rmw,
  rosSystemPackages,
  rosbag2-compression,
  rosbag2-cpp,
  rosbag2-storage,
  std-msgs,
  substituteSource,
  yaml-cpp-vendor,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosbag2_performance_benchmarking";
  version = "0.15.16-1";
  src = finalAttrs.passthru.sources."rosbag2_performance_benchmarking";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rclcpp rmw rosbag2-compression rosbag2-cpp rosbag2-storage std-msgs yaml-cpp-vendor ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp rmw rosbag2-compression rosbag2-cpp rosbag2-storage std-msgs yaml-cpp-vendor ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rosbag2_performance_benchmarking" = substituteSource {
      src = fetchgit {
        name = "rosbag2_performance_benchmarking-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "67e1412e2dd91f78162285befe7f8c474f3c5d84";
        hash = "sha256-REdkN0tvLDdr7tjAMKSGFs4abv35QE1tkRAGQTLUp24=";
      };
    };
  });
  meta = {
    description = "Code to benchmark rosbag2";
  };
})
