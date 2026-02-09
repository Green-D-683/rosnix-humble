{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  controller-manager,
  fetchgit,
  fetchurl,
  fetchzip,
  gripper-controllers,
  gz-ros2-control,
  mkSourceSet,
  rclcpp,
  ros-gz,
  ros-gz-bridge,
  ros-gz-image,
  ros-gz-sim,
  ros2-control,
  ros2-controllers,
  rosSystemPackages,
  substituteSource,
  trajectory-msgs,
  wrapRosQtAppsHook,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "bcr_arm_gazebo";
  version = "0.1.1-1";
  src = finalAttrs.passthru.sources."bcr_arm_gazebo";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ controller-manager gripper-controllers gz-ros2-control rclcpp ros2-control ros2-controllers ros-gz ros-gz-bridge ros-gz-image ros-gz-sim trajectory-msgs xacro ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "ignition-plugin" "python3-numpy" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ controller-manager gripper-controllers gz-ros2-control rclcpp ros2-control ros2-controllers ros-gz ros-gz-bridge ros-gz-image ros-gz-sim trajectory-msgs xacro ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "ignition-plugin" "python3-numpy" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "bcr_arm_gazebo" = substituteSource {
      src = fetchgit {
        name = "bcr_arm_gazebo-source";
        url = "https://github.com/ros2-gbp/bcr_arm-release.git";
        rev = "020ce40a6750248fe1a107eedf8e7605167c22fd";
        hash = "sha256-vhm6TeqCWzcFnEnhc2f3Qk4a2L7kD9dvIil5ibtQQ9o=";
      };
    };
  });
  meta = {
    description = "gazebo simulation and control scripts for bcr 7-dof robotic arm";
  };
})
