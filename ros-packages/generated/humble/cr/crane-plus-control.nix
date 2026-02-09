{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  controller-manager,
  crane-plus-description,
  dynamixel-sdk,
  fetchgit,
  fetchurl,
  fetchzip,
  hardware-interface,
  mkSourceSet,
  pluginlib,
  rclcpp,
  ros2-controllers,
  ros2controlcli,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "crane_plus_control";
  version = "2.0.1-1";
  src = finalAttrs.passthru.sources."crane_plus_control";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ controller-manager crane-plus-description dynamixel-sdk hardware-interface pluginlib rclcpp ros2-controllers ros2controlcli xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ controller-manager crane-plus-description dynamixel-sdk hardware-interface pluginlib rclcpp ros2-controllers ros2controlcli xacro ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "crane_plus_control" = substituteSource {
      src = fetchgit {
        name = "crane_plus_control-source";
        url = "https://github.com/ros2-gbp/crane_plus-release.git";
        rev = "222de197c24a2e13e6870bd98c49bff12cbe5bea";
        hash = "sha256-/RrA61xwkzMQyFJ/1nu2kjKwCb8dqwKaK5dvnt0k9xQ=";
      };
    };
  });
  meta = {
    description = "CRANE+ V2 control package";
  };
})
