{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  angles,
  buildAmentCmakePackage,
  control-toolbox,
  controller-manager,
  fetchgit,
  fetchurl,
  fetchzip,
  gazebo-dev,
  gazebo-ros,
  hardware-interface,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  std-msgs,
  substituteSource,
  yaml-cpp-vendor,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "gazebo_ros2_control";
  version = "0.4.10-1";
  src = finalAttrs.passthru.sources."gazebo_ros2_control";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ angles control-toolbox controller-manager gazebo-dev gazebo-ros hardware-interface pluginlib rclcpp std-msgs yaml-cpp-vendor ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ angles control-toolbox controller-manager gazebo-dev gazebo-ros hardware-interface pluginlib rclcpp std-msgs yaml-cpp-vendor ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "gazebo_ros2_control" = substituteSource {
      src = fetchgit {
        name = "gazebo_ros2_control-source";
        url = "https://github.com/ros2-gbp/gazebo_ros2_control-release.git";
        rev = "0ba177d7da7485bd92c2351afac19300c6257533";
        hash = "sha256-KjNnA9Vezn+OdNSphvC0U+Nh7fFjSm/O+/Qe2NffUGc=";
      };
    };
  });
  meta = {
    description = "gazebo_ros2_control";
  };
})
