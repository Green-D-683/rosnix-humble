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
  fetchgit,
  fetchurl,
  fetchzip,
  franka-msgs,
  hardware-interface,
  libfranka,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "franka_hardware";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."franka_hardware";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ franka-msgs hardware-interface libfranka pluginlib rclcpp ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ franka-msgs hardware-interface libfranka pluginlib rclcpp ];
  checkInputs = [ ament-cmake-clang-format ament-cmake-clang-tidy ament-cmake-copyright ament-cmake-cppcheck ament-cmake-flake8 ament-cmake-gmock ament-cmake-lint-cmake ament-cmake-pep257 ament-cmake-xmllint ];
  passthru.sources = mkSourceSet (sources: {
    "franka_hardware" = substituteSource {
      src = fetchgit {
        name = "franka_hardware-source";
        url = "https://github.com/ros2-gbp/franka_ros2-release.git";
        rev = "67c5fe809a9f24a171f0249fa5e086384843dc0e";
        hash = "sha256-C0z4EXK3qxvHWsnuDdU1QgfK8EQS+iIYb435mGAq63Y=";
      };
    };
  });
  meta = {
    description = "franka_hardware provides hardware interfaces for using Franka Robotics research robots with ros2_control";
  };
})
