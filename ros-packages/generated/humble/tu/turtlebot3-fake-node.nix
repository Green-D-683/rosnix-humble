{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav-msgs,
  rclcpp,
  robot-state-publisher,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  tf2,
  tf2-msgs,
  turtlebot3-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "turtlebot3_fake_node";
  version = "2.3.8-1";
  src = finalAttrs.passthru.sources."turtlebot3_fake_node";
  propagatedNativeBuildInputs = [ ament-cmake geometry-msgs nav-msgs rclcpp robot-state-publisher sensor-msgs tf2 tf2-msgs turtlebot3-msgs ];
  propagatedBuildInputs = [ ament-cmake geometry-msgs nav-msgs rclcpp robot-state-publisher sensor-msgs tf2 tf2-msgs turtlebot3-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "turtlebot3_fake_node" = substituteSource {
      src = fetchgit {
        name = "turtlebot3_fake_node-source";
        url = "https://github.com/ros2-gbp/turtlebot3_simulations-release.git";
        rev = "78ad49cf2fc1430cc5c512dca02dbd2ae72d80ab";
        hash = "sha256-h5/UWxeFU3bx+eapICpIcS90VI4bWUbgpkcaljGrUDE=";
      };
    };
  });
  meta = {
    description = "\n    Package for TurtleBot3 fake node. With this package, simple tests can be done without a robot.\n    You can do simple tests using this package on rviz without real robots.\n  ";
  };
})
