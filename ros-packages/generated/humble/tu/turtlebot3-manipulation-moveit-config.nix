{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  joint-state-publisher,
  joint-state-publisher-gui,
  mkSourceSet,
  moveit-kinematics,
  moveit-planners,
  moveit-ros-move-group,
  moveit-ros-visualization,
  moveit-ros-warehouse,
  moveit-simple-controller-manager,
  robot-state-publisher,
  rosSystemPackages,
  rviz-common,
  rviz-default-plugins,
  rviz2,
  srdfdom,
  substituteSource,
  tf2-ros,
  turtlebot3-manipulation-description,
  wrapRosQtAppsHook,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "turtlebot3_manipulation_moveit_config";
  version = "2.2.1-1";
  src = finalAttrs.passthru.sources."turtlebot3_manipulation_moveit_config";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ joint-state-publisher joint-state-publisher-gui moveit-kinematics moveit-planners moveit-ros-move-group moveit-ros-visualization moveit-ros-warehouse moveit-simple-controller-manager robot-state-publisher rviz2 rviz-common rviz-default-plugins srdfdom tf2-ros turtlebot3-manipulation-description xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ joint-state-publisher joint-state-publisher-gui moveit-kinematics moveit-planners moveit-ros-move-group moveit-ros-visualization moveit-ros-warehouse moveit-simple-controller-manager robot-state-publisher rviz2 rviz-common rviz-default-plugins srdfdom tf2-ros turtlebot3-manipulation-description xacro ];
  passthru.sources = mkSourceSet (sources: {
    "turtlebot3_manipulation_moveit_config" = substituteSource {
      src = fetchgit {
        name = "turtlebot3_manipulation_moveit_config-source";
        url = "https://github.com/ros2-gbp/turtlebot3_manipulation-release.git";
        rev = "b9da527783cf6d4dcf42607e8b070f12f4e69418";
        hash = "sha256-peTPVgP6hIKvDmhRYBLiJY9q/C34NrQ+ZPn8Dn89/U0=";
      };
    };
  });
  meta = {
    description = "\n     An automatically generated package with all the configuration and launch files for using the turtlebot3_manipulation with the MoveIt Motion Planning Framework\n  ";
  };
})
