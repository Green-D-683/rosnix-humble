{
  ament-cmake,
  ament-cmake-python,
  buildAmentCmakePackage,
  controller-manager,
  fetchgit,
  fetchurl,
  fetchzip,
  force-torque-sensor-broadcaster,
  joint-state-broadcaster,
  joint-state-publisher,
  joint-trajectory-controller,
  launch,
  launch-ros,
  mkSourceSet,
  position-controllers,
  rclpy,
  robot-state-publisher,
  ros2-controllers-test-nodes,
  rosSystemPackages,
  rviz2,
  substituteSource,
  ur-controllers,
  ur-description,
  urdf,
  velocity-controllers,
  wrapRosQtAppsHook,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ur_bringup";
  version = "2.12.0-1";
  src = finalAttrs.passthru.sources."ur_bringup";
  nativeBuildInputs = [ ament-cmake ament-cmake-python wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ controller-manager force-torque-sensor-broadcaster joint-state-broadcaster joint-state-publisher joint-trajectory-controller launch launch-ros position-controllers rclpy robot-state-publisher ros2-controllers-test-nodes rviz2 ur-controllers ur-description urdf velocity-controllers xacro ];
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ controller-manager force-torque-sensor-broadcaster joint-state-broadcaster joint-state-publisher joint-trajectory-controller launch launch-ros position-controllers rclpy robot-state-publisher ros2-controllers-test-nodes rviz2 ur-controllers ur-description urdf velocity-controllers xacro ];
  passthru.sources = mkSourceSet (sources: {
    "ur_bringup" = substituteSource {
      src = fetchgit {
        name = "ur_bringup-source";
        url = "https://github.com/ros2-gbp/Universal_Robots_ROS2_Driver-release.git";
        rev = "1e7f55264f74fa51271d216b4b889df0c453608a";
        hash = "sha256-OMQWByQ/Km2H0z7aaFx+I7rvXXp8u7yIBHzMKZNEayg=";
      };
    };
  });
  meta = {
    description = "Launch file and run-time configurations, e.g. controllers.";
  };
})
