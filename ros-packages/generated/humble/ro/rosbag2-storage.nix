{
  ament-cmake,
  ament-cmake-gmock,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  pluginlib,
  rcpputils,
  rcutils,
  rosSystemPackages,
  rosbag2-test-common,
  substituteSource,
  yaml-cpp-vendor,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosbag2_storage";
  version = "0.15.16-1";
  src = finalAttrs.passthru.sources."rosbag2_storage";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ pluginlib rcpputils rcutils yaml-cpp-vendor ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ pluginlib rcpputils rcutils yaml-cpp-vendor ];
  checkInputs = [ ament-cmake-gmock ament-cmake-gtest ament-lint-auto ament-lint-common rosbag2-test-common ];
  passthru.sources = mkSourceSet (sources: {
    "rosbag2_storage" = substituteSource {
      src = fetchgit {
        name = "rosbag2_storage-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "ac953f1b53c136812f9a0e0d897f18852a569d71";
        hash = "sha256-2584D5zuSS+mGERMHqdBQgzO2Xx9tUY1rLNeE1AlTnQ=";
      };
    };
  });
  meta = {
    description = "ROS2 independent storage format to store serialized ROS2 messages";
  };
})
