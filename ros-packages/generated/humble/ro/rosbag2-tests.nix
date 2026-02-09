{
  ament-cmake,
  ament-cmake-gmock,
  ament-index-cpp,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rcpputils,
  ros2bag,
  rosSystemPackages,
  rosbag2-compression,
  rosbag2-compression-zstd,
  rosbag2-cpp,
  rosbag2-storage,
  rosbag2-storage-default-plugins,
  rosbag2-test-common,
  std-msgs,
  substituteSource,
  test-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosbag2_tests";
  version = "0.15.16-1";
  src = finalAttrs.passthru.sources."rosbag2_tests";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-index-cpp ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-index-cpp ];
  checkInputs = [ ament-cmake-gmock ament-lint-auto ament-lint-common rclcpp rcpputils ros2bag rosbag2-compression rosbag2-compression-zstd rosbag2-cpp rosbag2-storage rosbag2-storage-default-plugins rosbag2-test-common std-msgs test-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "rosbag2_tests" = substituteSource {
      src = fetchgit {
        name = "rosbag2_tests-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "3b84dcb1af14466938cd4c6bcc7114f5dbfdc55b";
        hash = "sha256-37Qj/ICfip3QeMt4YGGZItayn5T3/UYu0k2vr7n8Kmc=";
      };
    };
  });
  meta = {
    description = "Tests package for rosbag2";
  };
})
