{
  ament-cmake,
  ament-lint-auto,
  autoware-cmake,
  autoware-internal-localization-msgs,
  autoware-lanelet2-extension,
  autoware-lint-common,
  autoware-map-msgs,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  pcl-conversions,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  tf2-geometry-msgs,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_map_height_fitter";
  version = "1.4.0-1";
  src = finalAttrs.passthru.sources."autoware_map_height_fitter";
  nativeBuildInputs = [ ament-cmake autoware-cmake ];
  propagatedNativeBuildInputs = [ autoware-internal-localization-msgs autoware-lanelet2-extension autoware-map-msgs geometry-msgs pcl-conversions rclcpp rclcpp-components sensor-msgs tf2-geometry-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libpcl-common" ]; };
  buildInputs = [ ament-cmake autoware-cmake ];
  propagatedBuildInputs = [ autoware-internal-localization-msgs autoware-lanelet2-extension autoware-map-msgs geometry-msgs pcl-conversions rclcpp rclcpp-components sensor-msgs tf2-geometry-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libpcl-common" ]; };
  checkInputs = [ ament-lint-auto autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_map_height_fitter" = substituteSource {
      src = fetchgit {
        name = "autoware_map_height_fitter-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "2fd08ce2ab65703c92c59f9ea21ed6a181a6ea27";
        hash = "sha256-aK1boCJoH+n9kkjMXCge1joEFWWKAhp2+74w/cV2WDs=";
      };
    };
  });
  meta = {
    description = "The autoware_map_height_fitter package";
  };
})
