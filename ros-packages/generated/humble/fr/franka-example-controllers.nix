{
  ament-cmake,
  ament-cmake-clang-format,
  ament-cmake-clang-tidy,
  ament-cmake-copyright,
  ament-cmake-cppcheck,
  ament-cmake-flake8,
  ament-cmake-gmock,
  ament-cmake-lint-cmake,
  ament-cmake-pep257,
  ament-cmake-xmllint,
  buildAmentCmakePackage,
  controller-interface,
  controller-manager,
  fetchgit,
  fetchurl,
  fetchzip,
  franka-msgs,
  franka-semantic-components,
  hardware-interface-testing,
  mkSourceSet,
  pinocchio,
  pluginlib,
  rclcpp,
  rclcpp-lifecycle,
  ros2-control-test-assets,
  rosSystemPackages,
  sensor-msgs,
  std-srvs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "franka_example_controllers";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."franka_example_controllers";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ controller-interface franka-msgs franka-semantic-components pinocchio pluginlib rclcpp rclcpp-lifecycle sensor-msgs std-srvs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ controller-interface franka-msgs franka-semantic-components pinocchio pluginlib rclcpp rclcpp-lifecycle sensor-msgs std-srvs ];
  checkInputs = [ ament-cmake ament-cmake-clang-format ament-cmake-clang-tidy ament-cmake-copyright ament-cmake-cppcheck ament-cmake-flake8 ament-cmake-gmock ament-cmake-lint-cmake ament-cmake-pep257 ament-cmake-xmllint controller-manager hardware-interface-testing ros2-control-test-assets ];
  passthru.sources = mkSourceSet (sources: {
    "franka_example_controllers" = substituteSource {
      src = fetchgit {
        name = "franka_example_controllers-source";
        url = "https://github.com/ros2-gbp/franka_ros2-release.git";
        rev = "b74520680b264e8a16b42519ade8bcd62c5e9fac";
        hash = "sha256-ZnV2tNXtC7qsAu3nPqLZ2jiOfVC35G+YNWS3X8X+e1w=";
      };
    };
  });
  meta = {
    description = "franka_example_controllers provides example code for controllingFranka Robotics research robots with ros2_control";
  };
})
