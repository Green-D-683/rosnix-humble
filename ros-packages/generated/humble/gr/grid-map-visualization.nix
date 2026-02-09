{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  grid-map-cmake-helpers,
  grid-map-core,
  grid-map-msgs,
  grid-map-ros,
  mkSourceSet,
  nav-msgs,
  rclcpp,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  visualization-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "grid_map_visualization";
  version = "2.0.1-1";
  src = finalAttrs.passthru.sources."grid_map_visualization";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ grid-map-cmake-helpers grid-map-core grid-map-msgs grid-map-ros nav-msgs rclcpp sensor-msgs visualization-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ grid-map-cmake-helpers grid-map-core grid-map-msgs grid-map-ros nav-msgs rclcpp sensor-msgs visualization-msgs ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "grid_map_visualization" = substituteSource {
      src = fetchgit {
        name = "grid_map_visualization-source";
        url = "https://github.com/ros2-gbp/grid_map-release.git";
        rev = "e29e7b262d6948f003fee712fd6a488ad09cc60b";
        hash = "sha256-APyw9MyoULvuhkaXuCxd5TYOsbfRA3Fv+VWHAFo5aI0=";
      };
    };
  });
  meta = {
    description = "Configurable tool to visualize grid maps in RViz.";
  };
})
