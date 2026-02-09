{
  ament-cmake-gtest,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rcpputils,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  yaml-cpp-vendor,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "camera_calibration_parsers";
  version = "3.1.12-1";
  src = finalAttrs.passthru.sources."camera_calibration_parsers";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ rclcpp rcpputils sensor-msgs yaml-cpp-vendor ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ rclcpp rcpputils sensor-msgs yaml-cpp-vendor ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "camera_calibration_parsers" = substituteSource {
      src = fetchgit {
        name = "camera_calibration_parsers-source";
        url = "https://github.com/ros2-gbp/image_common-release.git";
        rev = "f8e370269f239990e1c796f76caab6467ae0a58d";
        hash = "sha256-2UiHuN4r5G/3N6Aec52UYK5/G85aJtuB6AIZihktL9A=";
      };
    };
  });
  meta = {
    description = "\n     camera_calibration_parsers contains routines for reading and writing camera calibration parameters.\n  ";
  };
})
