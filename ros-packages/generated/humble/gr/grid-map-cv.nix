{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  filters,
  grid-map-cmake-helpers,
  grid-map-core,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "grid_map_cv";
  version = "2.0.1-1";
  src = finalAttrs.passthru.sources."grid_map_cv";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ cv-bridge filters grid-map-cmake-helpers grid-map-core pluginlib rclcpp sensor-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ cv-bridge filters grid-map-cmake-helpers grid-map-core pluginlib rclcpp sensor-msgs ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "grid_map_cv" = substituteSource {
      src = fetchgit {
        name = "grid_map_cv-source";
        url = "https://github.com/ros2-gbp/grid_map-release.git";
        rev = "b5bc4afaf9e8efcfbd9a589be38697f50c34c1e0";
        hash = "sha256-ZzSJBbwg9NLDaf6r/VRcVEuQte0NWX6GUbiccsxIlFk=";
      };
    };
  });
  meta = {
    description = "Conversions between grid maps and OpenCV images.";
  };
})
