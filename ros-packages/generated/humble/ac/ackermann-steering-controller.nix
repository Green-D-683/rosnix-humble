{
  ament-cmake,
  ament-cmake-gmock,
  backward-ros,
  buildAmentCmakePackage,
  control-msgs,
  controller-interface,
  controller-manager,
  fetchgit,
  fetchurl,
  fetchzip,
  generate-parameter-library,
  hardware-interface,
  hardware-interface-testing,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rclcpp-lifecycle,
  ros2-control-test-assets,
  rosSystemPackages,
  std-srvs,
  steering-controllers-library,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ackermann_steering_controller";
  version = "2.52.0-1";
  src = finalAttrs.passthru.sources."ackermann_steering_controller";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ backward-ros control-msgs controller-interface generate-parameter-library hardware-interface pluginlib rclcpp rclcpp-lifecycle std-srvs steering-controllers-library ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ backward-ros control-msgs controller-interface generate-parameter-library hardware-interface pluginlib rclcpp rclcpp-lifecycle std-srvs steering-controllers-library ];
  checkInputs = [ ament-cmake-gmock controller-manager hardware-interface hardware-interface-testing ros2-control-test-assets ];
  passthru.sources = mkSourceSet (sources: {
    "ackermann_steering_controller" = substituteSource {
      src = fetchgit {
        name = "ackermann_steering_controller-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "6c10b457c23bf2ac2d760fafe093029484b593ee";
        hash = "sha256-1bhmEpgVUxbRbHjohcc2NVMFgaO8pCbc5T2mc0e+sXg=";
      };
    };
  });
  meta = {
    description = "Steering controller for Ackermann kinematics. Rear fixed wheels are powering the vehicle and front wheels are steering it.";
  };
})
