{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  launch-xml,
  marvelmind-ros2-msgs,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "marvelmind_ros2";
  version = "1.0.3-5";
  src = finalAttrs.passthru.sources."marvelmind_ros2";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ geometry-msgs launch-xml marvelmind-ros2-msgs rclcpp std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs launch-xml marvelmind-ros2-msgs rclcpp std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "marvelmind_ros2" = substituteSource {
      src = fetchgit {
        name = "marvelmind_ros2-source";
        url = "https://github.com/MarvelmindRobotics/marvelmind_ros2_release_repo.git";
        rev = "f5243153674e8b6436ce782132324c20f7749a9a";
        hash = "sha256-y3ZRvRsPpSKa+ONhSFIzX4WMfAGM/ovH9duWiEKTk0I=";
      };
    };
  });
  meta = {
    description = "Marvelmind ROS2 package";
  };
})
