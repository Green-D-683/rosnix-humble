{
  ackermann-steering-controller,
  ament-cmake,
  ament-index-python,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  control-msgs,
  diff-drive-controller,
  effort-controllers,
  fetchgit,
  fetchurl,
  fetchzip,
  force-torque-sensor-broadcaster,
  geometry-msgs,
  gz-ros2-control,
  hardware-interface,
  imu-sensor-broadcaster,
  joint-state-broadcaster,
  joint-trajectory-controller,
  launch,
  launch-ros,
  mecanum-drive-controller,
  mkSourceSet,
  rclcpp,
  rclcpp-action,
  robot-state-publisher,
  ros-gz-bridge,
  ros-gz-sim,
  ros2controlcli,
  ros2launch,
  rosSystemPackages,
  std-msgs,
  substituteSource,
  tricycle-controller,
  velocity-controllers,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "gz_ros2_control_demos";
  version = "0.7.18-1";
  src = finalAttrs.passthru.sources."gz_ros2_control_demos";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ackermann-steering-controller ament-index-python control-msgs diff-drive-controller effort-controllers force-torque-sensor-broadcaster geometry-msgs gz-ros2-control hardware-interface imu-sensor-broadcaster joint-state-broadcaster joint-trajectory-controller launch launch-ros mecanum-drive-controller rclcpp rclcpp-action robot-state-publisher ros2controlcli ros2launch ros-gz-bridge ros-gz-sim std-msgs tricycle-controller velocity-controllers xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ackermann-steering-controller ament-index-python control-msgs diff-drive-controller effort-controllers force-torque-sensor-broadcaster geometry-msgs gz-ros2-control hardware-interface imu-sensor-broadcaster joint-state-broadcaster joint-trajectory-controller launch launch-ros mecanum-drive-controller rclcpp rclcpp-action robot-state-publisher ros2controlcli ros2launch ros-gz-bridge ros-gz-sim std-msgs tricycle-controller velocity-controllers xacro ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "gz_ros2_control_demos" = substituteSource {
      src = fetchgit {
        name = "gz_ros2_control_demos-source";
        url = "https://github.com/ros2-gbp/ign_ros2_control-release.git";
        rev = "b5bef41807e1567082bdfd1554376e44464adac4";
        hash = "sha256-ozMbsxUaPY+8jIu+cDDYVtU4pHUO8Y6eFU4Ub8QD5yo=";
      };
    };
  });
  meta = {
    description = "gz_ros2_control_demos";
  };
})
