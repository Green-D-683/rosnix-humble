{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  as2-core,
  as2-msgs,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mavros,
  mavros-extras,
  mavros-msgs,
  mkSourceSet,
  nav-msgs,
  rclcpp,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  substituteSource,
  tf2-geometry-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "as2_platform_mavlink";
  version = "1.1.0-1";
  src = finalAttrs.passthru.sources."as2_platform_mavlink";
  propagatedNativeBuildInputs = [ ament-cmake as2-core as2-msgs geometry-msgs mavros mavros-extras mavros-msgs nav-msgs rclcpp sensor-msgs std-msgs tf2-geometry-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "std_srvs " ]; };
  propagatedBuildInputs = [ ament-cmake as2-core as2-msgs geometry-msgs mavros mavros-extras mavros-msgs nav-msgs rclcpp sensor-msgs std-msgs tf2-geometry-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "std_srvs " ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "as2_platform_mavlink" = substituteSource {
      src = fetchgit {
        name = "as2_platform_mavlink-source";
        url = "https://github.com/ros2-gbp/as2_platform_mavlink-release.git";
        rev = "571708fe8f65c8ca8b0b6ea89de9cbf2f426a6d3";
        hash = "sha256-4UoxYg2lAqlGUghnlvo4ScvsKdHnK0qvA9OkBdZPRXQ=";
      };
    };
  });
  meta = {
    description = "Package to communicate Mavlink based drones with Aerostack2 framework";
  };
})
