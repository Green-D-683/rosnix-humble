{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  fri-configuration-controller,
  fri-state-broadcaster,
  joint-group-impedance-controller,
  kuka-control-mode-handler,
  kuka-event-broadcaster,
  kuka-kss-message-handler,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "kuka_controllers";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."kuka_controllers";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ fri-configuration-controller fri-state-broadcaster joint-group-impedance-controller kuka-control-mode-handler kuka-event-broadcaster kuka-kss-message-handler ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ fri-configuration-controller fri-state-broadcaster joint-group-impedance-controller kuka-control-mode-handler kuka-event-broadcaster kuka-kss-message-handler ];
  passthru.sources = mkSourceSet (sources: {
    "kuka_controllers" = substituteSource {
      src = fetchgit {
        name = "kuka_controllers-source";
        url = "https://github.com/ros2-gbp/kuka_drivers-release.git";
        rev = "689d23728ab0e60ce16d4d66c2178501bca06b50";
        hash = "sha256-EySc2TZxKZVyS4JfNMTF1ydRPZtB7WVx1S69X1rZhAI=";
      };
    };
  });
  meta = {
    description = "ROS2 controllers for KUKA robots";
  };
})
