{
  ament-cmake,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  can-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  off-highway-can,
  off-highway-radar-msgs,
  pcl-conversions,
  pcl-ros,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "off_highway_radar";
  version = "0.11.0-1";
  src = finalAttrs.passthru.sources."off_highway_radar";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ can-msgs off-highway-can off-highway-radar-msgs pcl-conversions rclcpp rclcpp-components sensor-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libpcl-all-dev" "libpcl-common" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ can-msgs off-highway-can off-highway-radar-msgs pcl-conversions rclcpp rclcpp-components sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libpcl-all-dev" "libpcl-common" ]; };
  checkInputs = [ ament-cmake-ros ament-lint-auto ament-lint-common pcl-ros ];
  passthru.sources = mkSourceSet (sources: {
    "off_highway_radar" = substituteSource {
      src = fetchgit {
        name = "off_highway_radar-source";
        url = "https://github.com/ros2-gbp/off_highway_sensor_drivers-release.git";
        rev = "621627d6851310487ff3d4e6daec7219344b8aa9";
        hash = "sha256-2OPWCqHWHyj8XcI+FUJFTPMCQIMYpnVFCiGt8K5P9ok=";
      };
    };
  });
  meta = {
    description = "The off_highway_radar package";
  };
})
