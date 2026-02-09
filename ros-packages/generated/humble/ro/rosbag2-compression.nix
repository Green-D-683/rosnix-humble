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
  rclcpp,
  rcpputils,
  rcutils,
  rosSystemPackages,
  rosbag2-cpp,
  rosbag2-storage,
  rosbag2-test-common,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosbag2_compression";
  version = "0.15.16-1";
  src = finalAttrs.passthru.sources."rosbag2_compression";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rcpputils rcutils rosbag2-cpp rosbag2-storage ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rcpputils rcutils rosbag2-cpp rosbag2-storage ];
  checkInputs = [ ament-cmake-gmock ament-lint-auto ament-lint-common rclcpp rosbag2-test-common ];
  passthru.sources = mkSourceSet (sources: {
    "rosbag2_compression" = substituteSource {
      src = fetchgit {
        name = "rosbag2_compression-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "61f8328aab0904ef2548ab8b3d66819c22f4535d";
        hash = "sha256-5xP52o40Dmm0Bina25MyVM/FGYkaFTDhjI2gCqX8EM8=";
      };
    };
  });
  meta = {
    description = "Compression implementations for rosbag2 bags and messages.";
  };
})
