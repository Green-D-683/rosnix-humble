{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gazebo-dev,
  gazebo-ros,
  gazebo-ros-pkgs,
  joint-state-publisher,
  launch-testing-ament-cmake,
  mkSourceSet,
  rclcpp,
  robot-state-publisher,
  ros2launch,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  substituteSource,
  urdf,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "gazebo_set_joint_positions_plugin";
  version = "1.0.3-1";
  src = finalAttrs.passthru.sources."gazebo_set_joint_positions_plugin";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ gazebo-dev gazebo-ros rclcpp sensor-msgs std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ gazebo-dev gazebo-ros rclcpp sensor-msgs std-msgs ];
  checkInputs = [ gazebo-ros-pkgs joint-state-publisher launch-testing-ament-cmake robot-state-publisher ros2launch urdf xacro ];
  passthru.sources = mkSourceSet (sources: {
    "gazebo_set_joint_positions_plugin" = substituteSource {
      src = fetchgit {
        name = "gazebo_set_joint_positions_plugin-source";
        url = "https://github.com/ros2-gbp/gazebo_set_joint_positions_plugin-release.git";
        rev = "057114a1346a5ff5fec6ece2694e955efcf152df";
        hash = "sha256-t//mNnCSd1MnhbIk0z3RcMs/6k8je8YLagBZADq7XJM=";
      };
    };
  });
  meta = {
    description = "Set gazebo robot joint positions";
  };
})
