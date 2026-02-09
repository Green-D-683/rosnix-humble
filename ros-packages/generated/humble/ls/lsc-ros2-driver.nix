{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  diagnostic-updater,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "lsc_ros2_driver";
  version = "1.0.2-1";
  src = finalAttrs.passthru.sources."lsc_ros2_driver";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ diagnostic-updater rclcpp sensor-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ diagnostic-updater rclcpp sensor-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "lsc_ros2_driver" = substituteSource {
      src = fetchgit {
        name = "lsc_ros2_driver-source";
        url = "https://github.com/AutonicsLiDAR-release/lsc_ros2_driver-release.git";
        rev = "d557f8bb12228ee8b670a6cc5c8aae2d0a754440";
        hash = "sha256-1sX8s0HfWxKVbvPW3VF+8m1oIGeRL7Q+NKOke4yQptU=";
      };
    };
  });
  meta = {
    description = "ROS2 driver package for Autonics LSC Series";
  };
})
