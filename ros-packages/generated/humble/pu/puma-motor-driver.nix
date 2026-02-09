{
  ament-cmake,
  buildAmentCmakePackage,
  clearpath-socketcan-interface,
  diagnostic-updater,
  fetchgit,
  fetchurl,
  fetchzip,
  joy,
  mkSourceSet,
  puma-motor-msgs,
  rclcpp,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "puma_motor_driver";
  version = "1.0.1-1";
  src = finalAttrs.passthru.sources."puma_motor_driver";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ clearpath-socketcan-interface diagnostic-updater joy puma-motor-msgs rclcpp sensor-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "can-utils" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ clearpath-socketcan-interface diagnostic-updater joy puma-motor-msgs rclcpp sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "can-utils" ]; };
  passthru.sources = mkSourceSet (sources: {
    "puma_motor_driver" = substituteSource {
      src = fetchgit {
        name = "puma_motor_driver-source";
        url = "https://github.com/clearpath-gbp/puma_motor_driver-release.git";
        rev = "dd40b72a1061a81a97e357f11627185b0b97aa42";
        hash = "sha256-CmM8w28AOLOWsyDWo1Xm96LriXGAGEyEc2CYsxmtMhE=";
      };
    };
  });
  meta = {
    description = "A ROS driver for Puma single-channel motor control board.";
  };
})
