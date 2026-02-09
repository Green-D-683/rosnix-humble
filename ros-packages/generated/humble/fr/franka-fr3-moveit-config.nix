{
  ament-cmake,
  ament-cmake-pytest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  controller-manager,
  fetchgit,
  fetchurl,
  fetchzip,
  franka-description,
  franka-gripper,
  franka-hardware,
  joint-state-broadcaster,
  joint-state-publisher,
  joint-trajectory-controller,
  mkSourceSet,
  moveit-kinematics,
  moveit-planners-ompl,
  moveit-ros-move-group,
  moveit-ros-visualization,
  moveit-simple-controller-manager,
  robot-state-publisher,
  rosSystemPackages,
  rviz2,
  substituteSource,
  wrapRosQtAppsHook,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "franka_fr3_moveit_config";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."franka_fr3_moveit_config";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ controller-manager franka-description franka-gripper franka-hardware joint-state-broadcaster joint-state-publisher joint-trajectory-controller moveit-kinematics moveit-planners-ompl moveit-ros-move-group moveit-ros-visualization moveit-simple-controller-manager robot-state-publisher rviz2 xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ controller-manager franka-description franka-gripper franka-hardware joint-state-broadcaster joint-state-publisher joint-trajectory-controller moveit-kinematics moveit-planners-ompl moveit-ros-move-group moveit-ros-visualization moveit-simple-controller-manager robot-state-publisher rviz2 xacro ];
  checkInputs = [ ament-cmake-pytest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "franka_fr3_moveit_config" = substituteSource {
      src = fetchgit {
        name = "franka_fr3_moveit_config-source";
        url = "https://github.com/ros2-gbp/franka_ros2-release.git";
        rev = "7897e58a3eb17e44a0d0573380e00f60dc86993f";
        hash = "sha256-QdmRnJ/2JBk+CMwrYp9in0lamJF1Xc+kUCDCL8u6B38=";
      };
    };
  });
  meta = {
    description = "Contains Moveit2 configuration files for Franka Robotics research robots";
  };
})
