{
  ament-cmake-auto,
  ament-cmake-cppcheck,
  ament-lint-auto,
  autoware-cmake,
  autoware-internal-debug-msgs,
  autoware-internal-localization-msgs,
  autoware-localization-util,
  autoware-map-msgs,
  autoware-utils-diagnostics,
  autoware-utils-logging,
  autoware-utils-pcl,
  autoware-utils-visualization,
  buildAmentCmakePackage,
  diagnostic-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav-msgs,
  pcl-conversions,
  rclcpp,
  rclcpp-components,
  ros-testing,
  rosSystemPackages,
  sensor-msgs,
  std-srvs,
  substituteSource,
  tf2,
  tf2-eigen,
  tf2-geometry-msgs,
  tf2-ros,
  tf2-sensor-msgs,
  visualization-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_ndt_scan_matcher";
  version = "1.4.0-1";
  src = finalAttrs.passthru.sources."autoware_ndt_scan_matcher";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ autoware-internal-debug-msgs autoware-internal-localization-msgs autoware-localization-util autoware-map-msgs autoware-utils-diagnostics autoware-utils-logging autoware-utils-pcl autoware-utils-visualization diagnostic-msgs geometry-msgs nav-msgs pcl-conversions rclcpp rclcpp-components sensor-msgs std-srvs tf2 tf2-eigen tf2-geometry-msgs tf2-ros tf2-sensor-msgs visualization-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "fmt" "libpcl-all" "libpcl-all-dev" ]; };
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ autoware-internal-debug-msgs autoware-internal-localization-msgs autoware-localization-util autoware-map-msgs autoware-utils-diagnostics autoware-utils-logging autoware-utils-pcl autoware-utils-visualization diagnostic-msgs geometry-msgs nav-msgs pcl-conversions rclcpp rclcpp-components sensor-msgs std-srvs tf2 tf2-eigen tf2-geometry-msgs tf2-ros tf2-sensor-msgs visualization-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "fmt" "libpcl-all" "libpcl-all-dev" ]; };
  checkInputs = [ ament-cmake-cppcheck ament-lint-auto ros-testing ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_ndt_scan_matcher" = substituteSource {
      src = fetchgit {
        name = "autoware_ndt_scan_matcher-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "236489c43cd2f219763b1ce660f84cee86d0ae13";
        hash = "sha256-Rxr9kZoqy/GJH4jQX6RGyTPTIc04PWMzrqyIUaUKvDs=";
      };
    };
  });
  meta = {
    description = "The autoware_ndt_scan_matcher package";
  };
})
