{
  ament-cmake,
  buildAmentCmakePackage,
  controller-manager,
  fetchgit,
  fetchurl,
  fetchzip,
  forward-command-controller,
  joint-state-broadcaster,
  joint-state-publisher-gui,
  joint-trajectory-controller,
  mkSourceSet,
  robot-state-publisher,
  ros2-controllers-test-nodes,
  ros2controlcli,
  ros2launch,
  rosSystemPackages,
  rviz2,
  substituteSource,
  wrapRosQtAppsHook,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "qb_device_bringup";
  version = "4.1.3-1";
  src = finalAttrs.passthru.sources."qb_device_bringup";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ controller-manager forward-command-controller joint-state-broadcaster joint-state-publisher-gui joint-trajectory-controller robot-state-publisher ros2-controllers-test-nodes ros2controlcli ros2launch rviz2 xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ controller-manager forward-command-controller joint-state-broadcaster joint-state-publisher-gui joint-trajectory-controller robot-state-publisher ros2-controllers-test-nodes ros2controlcli ros2launch rviz2 xacro ];
  passthru.sources = mkSourceSet (sources: {
    "qb_device_bringup" = substituteSource {
      src = fetchgit {
        name = "qb_device_bringup-source";
        url = "https://bitbucket.org/qbrobotics/qbdevice-ros2-release.git";
        rev = "c9ffc53b1a2f53f8e1a6b0ba29d7f3b094f470bf";
        hash = "sha256-7YFLO0SusvFz1TnD8KbWnJfwk0UM8kYmCZ7DS7COdpA=";
      };
    };
  });
  meta = {
    description = "\n    This package contains a device-independent bringup utilities for qbrobotics® devices.\n  ";
  };
})
