{
  ament-cmake-auto,
  ament-index-python,
  buildAmentCmakePackage,
  diagnostic-aggregator,
  fetchgit,
  fetchurl,
  fetchzip,
  force-torque-sensor-broadcaster,
  imu-sensor-broadcaster,
  joint-state-broadcaster,
  joint-trajectory-controller,
  launch,
  launch-pal,
  mkSourceSet,
  ros2controlcli,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "talos_controller_configuration";
  version = "2.9.1-1";
  src = finalAttrs.passthru.sources."talos_controller_configuration";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedNativeBuildInputs = [ ament-index-python diagnostic-aggregator force-torque-sensor-broadcaster imu-sensor-broadcaster joint-state-broadcaster joint-trajectory-controller launch launch-pal ros2controlcli ];
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ ament-index-python diagnostic-aggregator force-torque-sensor-broadcaster imu-sensor-broadcaster joint-state-broadcaster joint-trajectory-controller launch launch-pal ros2controlcli ];
  passthru.sources = mkSourceSet (sources: {
    "talos_controller_configuration" = substituteSource {
      src = fetchgit {
        name = "talos_controller_configuration-source";
        url = "https://github.com/pal-gbp/talos_robot-release.git";
        rev = "31ef999dec946355b8cfd1690aebbbeddf9e30be";
        hash = "sha256-QNw9Mhiu2hkGCjT3nAOuK8clWSwKwqz6Igc2iBRZ1Ik=";
      };
    };
  });
  meta = {
    description = "The talos_controller_configuration package";
  };
})
