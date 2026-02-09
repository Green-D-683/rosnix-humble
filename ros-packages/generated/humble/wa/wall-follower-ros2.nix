{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "wall_follower_ros2";
  version = "0.0.1-1";
  src = finalAttrs.passthru.sources."wall_follower_ros2";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ geometry-msgs rclcpp sensor-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs rclcpp sensor-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "wall_follower_ros2" = substituteSource {
      src = fetchgit {
        name = "wall_follower_ros2-source";
        url = "https://github.com/ros2-gbp/wall_follower_ros2-release.git";
        rev = "9b37054f732ca90d4bab9b9a95daff86b8efc7b5";
        hash = "sha256-k6QeoS1adVKhLqSMvsChqqF4DYOb5O2Aa2tguZVwrio=";
      };
    };
  });
  meta = {
    description = "wall_follower_ros2 package";
  };
})
