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
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "imu_calib";
  version = "0.1.0-2";
  src = finalAttrs.passthru.sources."imu_calib";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rclcpp sensor-msgs std-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "yaml-cpp" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp sensor-msgs std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "yaml-cpp" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "imu_calib" = substituteSource {
      src = fetchgit {
        name = "imu_calib-source";
        url = "https://github.com/Nathan85001/imu_calib-release.git";
        rev = "b7d7a83e28bad6545dbde2f87859884efd9f198c";
        hash = "sha256-pyDCDwb9C80mfjeJpBE27QYfO9ittYABKNVrhzrh/Sk=";
      };
    };
  });
  meta = {
    description = "ROS2 package for computing and applying IMU calibration parameters";
  };
})
