{
  ament-cmake,
  ament-cmake-gen-version-h,
  ament-cmake-gmock,
  ament-cmake-pytest,
  ament-cmake-python,
  ament-index-cpp,
  backward-ros,
  buildAmentCmakePackage,
  controller-interface,
  controller-manager-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  generate-parameter-library,
  hardware-interface,
  hardware-interface-testing,
  launch,
  launch-ros,
  launch-testing,
  launch-testing-ros,
  libstatistics-collector,
  lifecycle-msgs,
  mkSourceSet,
  pluginlib,
  rcl-interfaces,
  rclcpp,
  rclpy,
  realtime-tools,
  robot-state-publisher,
  ros2-control-test-assets,
  ros2param,
  ros2pkg,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "controller_manager";
  version = "2.53.1-1";
  src = finalAttrs.passthru.sources."controller_manager";
  nativeBuildInputs = [ ament-cmake ament-cmake-gen-version-h ament-cmake-python ];
  propagatedNativeBuildInputs = [ ament-index-cpp backward-ros controller-interface controller-manager-msgs generate-parameter-library hardware-interface launch launch-ros launch-testing-ros libstatistics-collector lifecycle-msgs pluginlib rcl-interfaces rclcpp rclpy realtime-tools ros2param sensor-msgs std-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-yaml" ]; };
  buildInputs = [ ament-cmake ament-cmake-gen-version-h ament-cmake-python ];
  propagatedBuildInputs = [ ament-index-cpp backward-ros controller-interface controller-manager-msgs generate-parameter-library hardware-interface launch launch-ros launch-testing-ros libstatistics-collector lifecycle-msgs pluginlib rcl-interfaces rclcpp rclpy realtime-tools ros2param sensor-msgs std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-yaml" ]; };
  checkInputs = [ ament-cmake-gmock ament-cmake-pytest hardware-interface-testing launch-testing robot-state-publisher ros2-control-test-assets ros2pkg ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-coverage" ]; };
  passthru.sources = mkSourceSet (sources: {
    "controller_manager" = substituteSource {
      src = fetchgit {
        name = "controller_manager-source";
        url = "https://github.com/ros2-gbp/ros2_control-release.git";
        rev = "0ef615cc678f9a8aa1a39ae32aad5e18ceaa5b5e";
        hash = "sha256-VEkhuwDvj30BxIzabU5TNT/G4BixP0SCKUDRFoz+8vI=";
      };
    };
  });
  meta = {
    description = "Description of controller_manager";
  };
})
