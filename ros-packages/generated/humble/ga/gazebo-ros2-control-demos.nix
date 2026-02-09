{
  ament-cmake,
  ament-cmake-gtest,
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
  gazebo-ros,
  gazebo-ros2-control,
  geometry-msgs,
  hardware-interface,
  imu-sensor-broadcaster,
  joint-state-broadcaster,
  joint-trajectory-controller,
  launch,
  launch-ros,
  mkSourceSet,
  rclcpp,
  rclcpp-action,
  robot-state-publisher,
  ros2-control,
  rosSystemPackages,
  std-msgs,
  substituteSource,
  tricycle-controller,
  velocity-controllers,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "gazebo_ros2_control_demos";
  version = "0.4.10-1";
  src = finalAttrs.passthru.sources."gazebo_ros2_control_demos";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-index-python control-msgs diff-drive-controller effort-controllers gazebo-ros gazebo-ros2-control geometry-msgs hardware-interface imu-sensor-broadcaster joint-state-broadcaster joint-trajectory-controller launch launch-ros rclcpp rclcpp-action robot-state-publisher ros2-control std-msgs tricycle-controller velocity-controllers xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-index-python control-msgs diff-drive-controller effort-controllers gazebo-ros gazebo-ros2-control geometry-msgs hardware-interface imu-sensor-broadcaster joint-state-broadcaster joint-trajectory-controller launch launch-ros rclcpp rclcpp-action robot-state-publisher ros2-control std-msgs tricycle-controller velocity-controllers xacro ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "gazebo_ros2_control_demos" = substituteSource {
      src = fetchgit {
        name = "gazebo_ros2_control_demos-source";
        url = "https://github.com/ros2-gbp/gazebo_ros2_control-release.git";
        rev = "7fad7c80558a587d596f8db6e3cf99d0bf84b4c6";
        hash = "sha256-PhUm4nLRjir79P/lgvuWRxe3FUBXTbvBkQCVZhcC0Kg=";
      };
    };
  });
  meta = {
    description = "gazebo_ros2_control_demos";
  };
})
