{
  ament-cmake,
  ament-cmake-gmock,
  buildAmentCmakePackage,
  canopen-402-driver,
  canopen-core,
  canopen-proxy-driver,
  fetchgit,
  fetchurl,
  fetchzip,
  hardware-interface,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rclcpp-components,
  rclcpp-lifecycle,
  ros2-control-test-assets,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "canopen_ros2_control";
  version = "0.2.13-1";
  src = finalAttrs.passthru.sources."canopen_ros2_control";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ canopen-402-driver canopen-core canopen-proxy-driver hardware-interface pluginlib rclcpp rclcpp-components rclcpp-lifecycle ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ canopen-402-driver canopen-core canopen-proxy-driver hardware-interface pluginlib rclcpp rclcpp-components rclcpp-lifecycle ];
  checkInputs = [ ament-cmake-gmock ros2-control-test-assets ];
  passthru.sources = mkSourceSet (sources: {
    "canopen_ros2_control" = substituteSource {
      src = fetchgit {
        name = "canopen_ros2_control-source";
        url = "https://github.com/ros2-gbp/ros2_canopen-release.git";
        rev = "ff853a1e1a57d29dc0620506ae735ebba8c21ed1";
        hash = "sha256-B++RZKQpWOA5i6QAbLRQJNaGvtdN9OZWchrIsWAjrHA=";
      };
    };
  });
  meta = {
    description = "ros2_control wrapper for ros2_canopen functionalities";
  };
})
