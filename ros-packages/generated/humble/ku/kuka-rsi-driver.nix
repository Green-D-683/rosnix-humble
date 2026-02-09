{
  ament-cmake,
  ament-cmake-python,
  buildAmentCmakePackage,
  controller-manager-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  gpio-controllers,
  hardware-interface,
  joint-state-broadcaster,
  joint-trajectory-controller,
  kuka-control-mode-handler,
  kuka-drivers-core,
  kuka-event-broadcaster,
  kuka-external-control-sdk,
  kuka-kss-message-handler,
  kuka-robot-descriptions,
  kuka-rsi-simulator,
  launch-testing-ament-cmake,
  mkSourceSet,
  pluginlib,
  ros2-control,
  ros2lifecycle,
  rosSystemPackages,
  std-msgs,
  substituteSource,
  tinyxml-vendor,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "kuka_rsi_driver";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."kuka_rsi_driver";
  nativeBuildInputs = [ ament-cmake ament-cmake-python wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ controller-manager-msgs gpio-controllers hardware-interface joint-state-broadcaster joint-trajectory-controller kuka-control-mode-handler kuka-drivers-core kuka-event-broadcaster kuka-external-control-sdk kuka-kss-message-handler kuka-robot-descriptions pluginlib ros2-control std-msgs tinyxml-vendor ];
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ controller-manager-msgs gpio-controllers hardware-interface joint-state-broadcaster joint-trajectory-controller kuka-control-mode-handler kuka-drivers-core kuka-event-broadcaster kuka-external-control-sdk kuka-kss-message-handler kuka-robot-descriptions pluginlib ros2-control std-msgs tinyxml-vendor ];
  checkInputs = [ kuka-rsi-simulator launch-testing-ament-cmake ros2lifecycle ];
  passthru.sources = mkSourceSet (sources: {
    "kuka_rsi_driver" = substituteSource {
      src = fetchgit {
        name = "kuka_rsi_driver-source";
        url = "https://github.com/ros2-gbp/kuka_drivers-release.git";
        rev = "e196c5c605c7e8cf940a62c358b89947def11af8";
        hash = "sha256-arMEKKU5XsgVEboXd7n/AnWtJmwt1OA3S0A0J9bo06w=";
      };
    };
  });
  meta = {
    description = "A ROS2 hardware interface for use with KUKA RSI";
  };
})
