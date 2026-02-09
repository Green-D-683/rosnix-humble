{
  ament-cmake,
  bcr-arm-description,
  buildAmentCmakePackage,
  controller-manager,
  fetchgit,
  fetchurl,
  fetchzip,
  joint-state-publisher,
  joint-state-publisher-gui,
  mkSourceSet,
  moveit-configs-utils,
  moveit-kinematics,
  moveit-planners,
  moveit-ros-move-group,
  moveit-ros-visualization,
  moveit-setup-assistant,
  moveit-simple-controller-manager,
  robot-state-publisher,
  rosSystemPackages,
  rviz-common,
  rviz-default-plugins,
  rviz2,
  substituteSource,
  tf2-ros,
  topic-based-ros2-control,
  wrapRosQtAppsHook,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "bcr_arm_moveit_config";
  version = "0.1.1-1";
  src = finalAttrs.passthru.sources."bcr_arm_moveit_config";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ bcr-arm-description controller-manager joint-state-publisher joint-state-publisher-gui moveit-configs-utils moveit-kinematics moveit-planners moveit-ros-move-group moveit-ros-visualization moveit-setup-assistant moveit-simple-controller-manager robot-state-publisher rviz2 rviz-common rviz-default-plugins tf2-ros topic-based-ros2-control xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ bcr-arm-description controller-manager joint-state-publisher joint-state-publisher-gui moveit-configs-utils moveit-kinematics moveit-planners moveit-ros-move-group moveit-ros-visualization moveit-setup-assistant moveit-simple-controller-manager robot-state-publisher rviz2 rviz-common rviz-default-plugins tf2-ros topic-based-ros2-control xacro ];
  passthru.sources = mkSourceSet (sources: {
    "bcr_arm_moveit_config" = substituteSource {
      src = fetchgit {
        name = "bcr_arm_moveit_config-source";
        url = "https://github.com/ros2-gbp/bcr_arm-release.git";
        rev = "d35ccc280758bb06dc9be5acf03b09be22d980bb";
        hash = "sha256-4GBK02Kt15L9G1jZjPyTmWUFpr6kwY5otiXsR2vcvB4=";
      };
    };
  });
  meta = {
    description = "moveit configuration and launch files for motion planning with the bcr arm";
  };
})
