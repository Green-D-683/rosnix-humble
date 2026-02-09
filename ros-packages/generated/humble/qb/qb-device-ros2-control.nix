{
  ament-cmake,
  ament-cmake-gtest,
  buildAmentCmakePackage,
  controller-manager,
  fetchgit,
  fetchurl,
  fetchzip,
  hardware-interface,
  mkSourceSet,
  pluginlib,
  qb-device-msgs,
  rclcpp,
  rclcpp-lifecycle,
  rosSystemPackages,
  substituteSource,
  transmission-interface,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "qb_device_ros2_control";
  version = "4.1.3-1";
  src = finalAttrs.passthru.sources."qb_device_ros2_control";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ controller-manager hardware-interface pluginlib qb-device-msgs rclcpp rclcpp-lifecycle transmission-interface ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ controller-manager hardware-interface pluginlib qb-device-msgs rclcpp rclcpp-lifecycle transmission-interface ];
  checkInputs = [ ament-cmake-gtest ];
  passthru.sources = mkSourceSet (sources: {
    "qb_device_ros2_control" = substituteSource {
      src = fetchgit {
        name = "qb_device_ros2_control-source";
        url = "https://bitbucket.org/qbrobotics/qbdevice-ros2-release.git";
        rev = "c2d59e97a7d37a1d8feb1a707158da5a42b6e264";
        hash = "sha256-f8MBOr6MpJ/o25Xo75t3zp81nO+Cx5q3n1xL5ZZWsPk=";
      };
    };
  });
  meta = {
    description = "Package of `ros2_control` hardware for qb robotics Devices with transmission interface.";
  };
})
