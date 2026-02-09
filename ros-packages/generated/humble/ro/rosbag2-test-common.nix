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
  rcutils,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosbag2_test_common";
  version = "0.15.16-1";
  src = finalAttrs.passthru.sources."rosbag2_test_common";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rclcpp rcutils ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp rcutils ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rosbag2_test_common" = substituteSource {
      src = fetchgit {
        name = "rosbag2_test_common-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "ada933948deabb95a815c8ec17ba5a957dbe5305";
        hash = "sha256-HFBMIQF+tLCWAZZJ3FOuftKt8oKQ90WeVS26Y+PD94Y=";
      };
    };
  });
  meta = {
    description = "Commonly used test helper classes and fixtures for rosbag2";
  };
})
