{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gazebo-ros,
  gripper-controllers,
  mkSourceSet,
  robot-state-publisher,
  ros2-control,
  ros2-controllers,
  rosSystemPackages,
  rviz2,
  substituteSource,
  wrapRosQtAppsHook,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "turtlebot3_manipulation_gazebo";
  version = "2.3.8-1";
  src = finalAttrs.passthru.sources."turtlebot3_manipulation_gazebo";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ gazebo-ros gripper-controllers robot-state-publisher ros2-control ros2-controllers rviz2 xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ gazebo-ros gripper-controllers robot-state-publisher ros2-control ros2-controllers rviz2 xacro ];
  passthru.sources = mkSourceSet (sources: {
    "turtlebot3_manipulation_gazebo" = substituteSource {
      src = fetchgit {
        name = "turtlebot3_manipulation_gazebo-source";
        url = "https://github.com/ros2-gbp/turtlebot3_simulations-release.git";
        rev = "4f7690204d3be351b46eecc448e5ae810a1bcfb9";
        hash = "sha256-IzGtpfRayaj5H4+PCBzOlcFCVyhXvtARUbwLlba/c0I=";
      };
    };
  });
  meta = {
    description = "\n    Gazebo simulation package for the TurtleBot3 manipulation\n  ";
  };
})
