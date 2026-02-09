{
  ament-cmake,
  ament-cmake-clang-format,
  ament-cmake-copyright,
  ament-cmake-cppcheck,
  ament-cmake-flake8,
  ament-cmake-lint-cmake,
  ament-cmake-pep257,
  ament-cmake-python,
  ament-cmake-xmllint,
  buildAmentCmakePackage,
  control-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  franka-msgs,
  libfranka,
  mkSourceSet,
  rclcpp,
  rclcpp-action,
  rclcpp-components,
  rclpy,
  rosSystemPackages,
  sensor-msgs,
  std-srvs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "franka_gripper";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."franka_gripper";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedNativeBuildInputs = [ control-msgs franka-msgs libfranka rclcpp rclcpp-action rclcpp-components rclpy sensor-msgs std-srvs ];
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ control-msgs franka-msgs libfranka rclcpp rclcpp-action rclcpp-components rclpy sensor-msgs std-srvs ];
  checkInputs = [ ament-cmake-clang-format ament-cmake-copyright ament-cmake-cppcheck ament-cmake-flake8 ament-cmake-lint-cmake ament-cmake-pep257 ament-cmake-xmllint ];
  passthru.sources = mkSourceSet (sources: {
    "franka_gripper" = substituteSource {
      src = fetchgit {
        name = "franka_gripper-source";
        url = "https://github.com/ros2-gbp/franka_ros2-release.git";
        rev = "98e20cc91ea253c5e2b975e5e3aa91a2afd9ec57";
        hash = "sha256-v5ZheggBvoiXo/U9B9ZvLckpJurFRn0cG0zX4DqUM6U=";
      };
    };
  });
  meta = {
    description = "This package implements the franka gripper of type Franka Hand for the use in ROS2";
  };
})
