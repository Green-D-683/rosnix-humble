{
  ament-cmake,
  ament-cmake-gmock,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rcpputils,
  rcutils,
  rosSystemPackages,
  rosbag2-compression,
  rosbag2-test-common,
  substituteSource,
  zstd-vendor,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosbag2_compression_zstd";
  version = "0.15.16-1";
  src = finalAttrs.passthru.sources."rosbag2_compression_zstd";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ pluginlib rcpputils rcutils rosbag2-compression zstd-vendor ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ pluginlib rcpputils rcutils rosbag2-compression zstd-vendor ];
  checkInputs = [ ament-cmake-gmock ament-lint-auto ament-lint-common rclcpp rosbag2-test-common ];
  passthru.sources = mkSourceSet (sources: {
    "rosbag2_compression_zstd" = substituteSource {
      src = fetchgit {
        name = "rosbag2_compression_zstd-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "2beae994e14e0cdce0890a976def7b1ad8562e0d";
        hash = "sha256-vfQ+a/PivTEbNpTk2l2W1ZU4CaQBYDdYiveibY1KSfw=";
      };
    };
  });
  meta = {
    description = "Zstandard compression library implementation of rosbag2_compression";
  };
})
