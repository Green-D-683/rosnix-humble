{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gazebo-ros,
  gripper-controllers,
  mkSourceSet,
  open-manipulator-x-description,
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
  pname = "open_manipulator_x_bringup";
  version = "3.0.4-1";
  src = finalAttrs.passthru.sources."open_manipulator_x_bringup";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ gazebo-ros gripper-controllers open-manipulator-x-description robot-state-publisher ros2-control ros2-controllers rviz2 xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ gazebo-ros gripper-controllers open-manipulator-x-description robot-state-publisher ros2-control ros2-controllers rviz2 xacro ];
  passthru.sources = mkSourceSet (sources: {
    "open_manipulator_x_bringup" = substituteSource {
      src = fetchgit {
        name = "open_manipulator_x_bringup-source";
        url = "https://github.com/ros2-gbp/open_manipulator-release.git";
        rev = "21e6d9ffee5c96b7992b0ad82f3b505cf78cf46f";
        hash = "sha256-DvTm9U6XOdg9CFVzQOizFSbX4T0LbuSzFFoacgKngww=";
      };
    };
  });
  meta = {
    description = "\n    OpenMANIPULATOR-X bringup ROS 2 package.\n  ";
  };
})
