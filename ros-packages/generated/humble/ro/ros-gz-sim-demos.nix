{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  image-transport-plugins,
  mkSourceSet,
  robot-state-publisher,
  ros-gz-bridge,
  ros-gz-image,
  ros-gz-sim,
  rosSystemPackages,
  rqt-image-view,
  rqt-plot,
  rqt-topic,
  rviz2,
  sdformat-urdf,
  substituteSource,
  wrapRosQtAppsHook,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ros_gz_sim_demos";
  version = "0.244.21-1";
  src = finalAttrs.passthru.sources."ros_gz_sim_demos";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ image-transport-plugins robot-state-publisher ros-gz-bridge ros-gz-image ros-gz-sim rqt-image-view rqt-plot rqt-topic rviz2 sdformat-urdf xacro ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "ignition-gazebo6" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ image-transport-plugins robot-state-publisher ros-gz-bridge ros-gz-image ros-gz-sim rqt-image-view rqt-plot rqt-topic rviz2 sdformat-urdf xacro ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "ignition-gazebo6" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ros_gz_sim_demos" = substituteSource {
      src = fetchgit {
        name = "ros_gz_sim_demos-source";
        url = "https://github.com/ros2-gbp/ros_ign-release.git";
        rev = "2565d03a1e1d8f1661104c24846d2e524ff6445f";
        hash = "sha256-1MQK1nzeaml0tn/IypcUyHkDoBbjX3NsjOHWviN7izM=";
      };
    };
  });
  meta = {
    description = "Demos using Gazebo Sim simulation with ROS.";
  };
})
