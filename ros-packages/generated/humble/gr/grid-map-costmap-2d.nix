{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  grid-map-cmake-helpers,
  grid-map-core,
  mkSourceSet,
  nav2-costmap-2d,
  rosSystemPackages,
  substituteSource,
  tf2-geometry-msgs,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "grid_map_costmap_2d";
  version = "2.0.1-1";
  src = finalAttrs.passthru.sources."grid_map_costmap_2d";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ geometry-msgs grid-map-cmake-helpers grid-map-core nav2-costmap-2d tf2-geometry-msgs tf2-ros ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs grid-map-cmake-helpers grid-map-core nav2-costmap-2d tf2-geometry-msgs tf2-ros ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "grid_map_costmap_2d" = substituteSource {
      src = fetchgit {
        name = "grid_map_costmap_2d-source";
        url = "https://github.com/ros2-gbp/grid_map-release.git";
        rev = "752a4b61a850df2f674449a25fe9406fc75143a4";
        hash = "sha256-F01KXv8J789Q9dQ1MvjFyrQ3gOaglb2BlQ+Z/5R9tzI=";
      };
    };
  });
  meta = {
    description = "Interface for grid maps to the costmap_2d format.";
  };
})
