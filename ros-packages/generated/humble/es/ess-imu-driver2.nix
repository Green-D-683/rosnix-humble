{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ess_imu_driver2";
  version = "2.0.1-1";
  src = finalAttrs.passthru.sources."ess_imu_driver2";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rclcpp sensor-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp sensor-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ess_imu_driver2" = substituteSource {
      src = fetchgit {
        name = "ess_imu_driver2-source";
        url = "https://github.com/ros2-gbp/ess_imu_driver2-release.git";
        rev = "73f26e54a7a260cc2ef2c36d7c1b1bc27007d97a";
        hash = "sha256-EQxMjSpOov65ADicRmhlUD6QtRAsOtNXfjaUJWx7vCk=";
      };
    };
  });
  meta = {
    description = "ROS2 package for Epson IMU using C++ wrapper around Linux C driver";
  };
})
