{
  ament-cmake,
  buildAmentCmakePackage,
  controller-manager-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  fri-configuration-controller,
  fri-state-broadcaster,
  hardware-interface,
  joint-group-impedance-controller,
  joint-state-broadcaster,
  joint-trajectory-controller,
  kuka-control-mode-handler,
  kuka-driver-interfaces,
  kuka-drivers-core,
  kuka-event-broadcaster,
  kuka-lbr-iiwa-support,
  launch-testing-ament-cmake,
  mkSourceSet,
  ros2-control,
  ros2lifecycle,
  rosSystemPackages,
  std-msgs,
  std-srvs,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "kuka_sunrise_fri_driver";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."kuka_sunrise_fri_driver";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ controller-manager-msgs fri-configuration-controller fri-state-broadcaster hardware-interface joint-group-impedance-controller joint-state-broadcaster joint-trajectory-controller kuka-control-mode-handler kuka-driver-interfaces kuka-drivers-core kuka-event-broadcaster kuka-lbr-iiwa-support ros2-control std-msgs std-srvs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libnanopb-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ controller-manager-msgs fri-configuration-controller fri-state-broadcaster hardware-interface joint-group-impedance-controller joint-state-broadcaster joint-trajectory-controller kuka-control-mode-handler kuka-driver-interfaces kuka-drivers-core kuka-event-broadcaster kuka-lbr-iiwa-support ros2-control std-msgs std-srvs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libnanopb-dev" ]; };
  checkInputs = [ launch-testing-ament-cmake ros2lifecycle ];
  passthru.sources = mkSourceSet (sources: {
    "kuka_sunrise_fri_driver" = substituteSource {
      src = fetchgit {
        name = "kuka_sunrise_fri_driver-source";
        url = "https://github.com/ros2-gbp/kuka_drivers-release.git";
        rev = "216d31fc943b8cc02dd1f3dafcb6324b2a35483d";
        hash = "sha256-TuysxBh/bbNV8AjxmWV9PxUYU5iRSbFifcZScAUs6PM=";
      };
    };
  });
  meta = {
    description = "ROS2 KUKA sunrise interface";
  };
})
