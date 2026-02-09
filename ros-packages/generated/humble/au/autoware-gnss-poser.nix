{
  ament-cmake-auto,
  ament-cmake-ros,
  ament-lint-auto,
  autoware-cmake,
  autoware-geography-utils,
  autoware-internal-debug-msgs,
  autoware-lint-common,
  autoware-map-msgs,
  autoware-sensing-msgs,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geographic-msgs,
  geometry-msgs,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  tf2,
  tf2-geometry-msgs,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_gnss_poser";
  version = "1.4.0-1";
  src = finalAttrs.passthru.sources."autoware_gnss_poser";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ autoware-geography-utils autoware-internal-debug-msgs autoware-map-msgs autoware-sensing-msgs geographic-msgs geometry-msgs rclcpp rclcpp-components sensor-msgs tf2 tf2-geometry-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "geographiclib" "libboost-dev" ]; };
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ autoware-geography-utils autoware-internal-debug-msgs autoware-map-msgs autoware-sensing-msgs geographic-msgs geometry-msgs rclcpp rclcpp-components sensor-msgs tf2 tf2-geometry-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "geographiclib" "libboost-dev" ]; };
  checkInputs = [ ament-cmake-ros ament-lint-auto autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_gnss_poser" = substituteSource {
      src = fetchgit {
        name = "autoware_gnss_poser-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "00775a48dd3268a6078957747b99ede48fdf22d3";
        hash = "sha256-qrJjmXmoap/T2mCxbM2FE3eZz4xjD55YN0WaiQePAWY=";
      };
    };
  });
  meta = {
    description = "The ROS 2 autoware_gnss_poser package";
  };
})
