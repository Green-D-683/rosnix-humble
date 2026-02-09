{
  ament-cmake-ros,
  buildAmentCmakePackage,
  controller-interface,
  controller-manager,
  fetchgit,
  fetchurl,
  fetchzip,
  kuka-driver-interfaces,
  kuka-drivers-core,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rclcpp-lifecycle,
  ros2-control-test-assets,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "kuka_kss_message_handler";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."kuka_kss_message_handler";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ controller-interface kuka-driver-interfaces kuka-drivers-core pluginlib rclcpp rclcpp-lifecycle std-msgs ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ controller-interface kuka-driver-interfaces kuka-drivers-core pluginlib rclcpp rclcpp-lifecycle std-msgs ];
  checkInputs = [ controller-manager ros2-control-test-assets ];
  passthru.sources = mkSourceSet (sources: {
    "kuka_kss_message_handler" = substituteSource {
      src = fetchgit {
        name = "kuka_kss_message_handler-source";
        url = "https://github.com/ros2-gbp/kuka_drivers-release.git";
        rev = "f544d8926c2588f8e9b5f5ed6f18c03613b049fd";
        hash = "sha256-9NKrq8lCiOUcw+DcWHrV3mcRT55S0aa5Gqg9BaXwN0c=";
      };
    };
  });
  meta = {
    description = "Non-real time message handler for KSS KUKA robots";
  };
})
