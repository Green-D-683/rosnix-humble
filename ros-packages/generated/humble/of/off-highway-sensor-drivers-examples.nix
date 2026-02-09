{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav-msgs,
  off-highway-premium-radar,
  off-highway-radar,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "off_highway_sensor_drivers_examples";
  version = "0.11.0-1";
  src = finalAttrs.passthru.sources."off_highway_sensor_drivers_examples";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ geometry-msgs nav-msgs off-highway-premium-radar off-highway-radar rclcpp rclcpp-components ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs nav-msgs off-highway-premium-radar off-highway-radar rclcpp rclcpp-components ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "off_highway_sensor_drivers_examples" = substituteSource {
      src = fetchgit {
        name = "off_highway_sensor_drivers_examples-source";
        url = "https://github.com/ros2-gbp/off_highway_sensor_drivers-release.git";
        rev = "bce2f343909322fca362efdf6f38de8dd1542507";
        hash = "sha256-gAT4popsSa9XIua9agHMIXl5deGLZeJdYe+clkFfj00=";
      };
    };
  });
  meta = {
    description = "The off_highway_sensor_drivers_examples package";
  };
})
