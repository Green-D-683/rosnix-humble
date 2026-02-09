{
  ament-cmake,
  buildAmentCmakePackage,
  controller-manager-msgs,
  effort-controllers,
  fetchgit,
  fetchurl,
  fetchzip,
  hardware-interface,
  joint-group-impedance-controller,
  joint-state-broadcaster,
  joint-trajectory-controller,
  kuka-control-mode-handler,
  kuka-drivers-core,
  kuka-event-broadcaster,
  kuka-external-control-sdk,
  kuka-lbr-iisy-support,
  launch-testing-ament-cmake,
  mkSourceSet,
  pluginlib,
  ros2-control,
  ros2lifecycle,
  rosSystemPackages,
  std-msgs,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "kuka_iiqka_eac_driver";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."kuka_iiqka_eac_driver";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ controller-manager-msgs effort-controllers hardware-interface joint-group-impedance-controller joint-state-broadcaster joint-trajectory-controller kuka-control-mode-handler kuka-drivers-core kuka-event-broadcaster kuka-external-control-sdk kuka-lbr-iisy-support pluginlib ros2-control std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ controller-manager-msgs effort-controllers hardware-interface joint-group-impedance-controller joint-state-broadcaster joint-trajectory-controller kuka-control-mode-handler kuka-drivers-core kuka-event-broadcaster kuka-external-control-sdk kuka-lbr-iisy-support pluginlib ros2-control std-msgs ];
  checkInputs = [ launch-testing-ament-cmake ros2lifecycle ];
  passthru.sources = mkSourceSet (sources: {
    "kuka_iiqka_eac_driver" = substituteSource {
      src = fetchgit {
        name = "kuka_iiqka_eac_driver-source";
        url = "https://github.com/ros2-gbp/kuka_drivers-release.git";
        rev = "8ee76a9ca4338b71371402010cf786321c7ce866";
        hash = "sha256-yre0oQJhBXtUWxduSTslQyAgmtrN4iV2cCjgNij+XI8=";
      };
    };
  });
  meta = {
    description = "A ROS2 hardware interface for use with KUKA iiQKA OS";
  };
})
