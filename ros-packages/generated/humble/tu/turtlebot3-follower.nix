{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav2-msgs,
  rclcpp,
  rosSystemPackages,
  std-msgs,
  substituteSource,
  tf2,
  tf2-geometry-msgs,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "turtlebot3_follower";
  version = "1.3.3-2";
  src = finalAttrs.passthru.sources."turtlebot3_follower";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ geometry-msgs nav2-msgs rclcpp std-msgs tf2 tf2-geometry-msgs tf2-ros ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs nav2-msgs rclcpp std-msgs tf2 tf2-geometry-msgs tf2-ros ];
  passthru.sources = mkSourceSet (sources: {
    "turtlebot3_follower" = substituteSource {
      src = fetchgit {
        name = "turtlebot3_follower-source";
        url = "https://github.com/ros2-gbp/turtlebot3_applications-release.git";
        rev = "23a13b056a973080816dea76f3967660458a5daf";
        hash = "sha256-UEBdqk4k7vepyg5+Q4irUNMgNxEhvPtEGjRQnWbP2O8=";
      };
    };
  });
  meta = {
    description = "\n    TurtleBot3 Follower Example for ROS2.\n  ";
  };
})
