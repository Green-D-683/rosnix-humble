{
  ament-cmake,
  ament-cmake-gtest,
  ament-index-cpp,
  ament-lint-auto,
  buildAmentCmakePackage,
  diagnostic-msgs,
  diagnostic-updater,
  fetchgit,
  fetchurl,
  fetchzip,
  gps-msgs,
  mkSourceSet,
  nav-msgs,
  novatel-gps-msgs,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  substituteSource,
  swri-math-util,
  swri-roscpp,
  swri-serial-util,
  tf2,
  tf2-geometry-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "novatel_gps_driver";
  version = "4.2.1-1";
  src = finalAttrs.passthru.sources."novatel_gps_driver";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ diagnostic-msgs diagnostic-updater gps-msgs nav-msgs novatel-gps-msgs rclcpp rclcpp-components sensor-msgs std-msgs swri-math-util swri-roscpp swri-serial-util tf2 tf2-geometry-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "boost" "libpcap" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ diagnostic-msgs diagnostic-updater gps-msgs nav-msgs novatel-gps-msgs rclcpp rclcpp-components sensor-msgs std-msgs swri-math-util swri-roscpp swri-serial-util tf2 tf2-geometry-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" "libpcap" ]; };
  checkInputs = [ ament-cmake-gtest ament-index-cpp ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "novatel_gps_driver" = substituteSource {
      src = fetchgit {
        name = "novatel_gps_driver-source";
        url = "https://github.com/ros2-gbp/novatel_gps_driver-release.git";
        rev = "4a0fbf31ef338c82f00de82fadc0a2c4f99aae54";
        hash = "sha256-h44byNYX83RTF4O+tyK+wG6aUtCm1YQc2+as5Wr5eyk=";
      };
    };
  });
  meta = {
    description = "\n  Driver for NovAtel receivers\n  ";
  };
})
