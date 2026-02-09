{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  filters,
  grid-map-cmake-helpers,
  grid-map-core,
  grid-map-msgs,
  grid-map-ros,
  mkSourceSet,
  pluginlib,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "grid_map_filters";
  version = "2.0.1-1";
  src = finalAttrs.passthru.sources."grid_map_filters";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ filters grid-map-cmake-helpers grid-map-core grid-map-msgs grid-map-ros pluginlib ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "tbb" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ filters grid-map-cmake-helpers grid-map-core grid-map-msgs grid-map-ros pluginlib ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "tbb" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "grid_map_filters" = substituteSource {
      src = fetchgit {
        name = "grid_map_filters-source";
        url = "https://github.com/ros2-gbp/grid_map-release.git";
        rev = "c0a975d996ba945f90ef7974a743d5fe1d503fe5";
        hash = "sha256-dmYFqH8+T/O8Rz5soksAvrMEzuQPY1/pFGMSDA+C/28=";
      };
    };
  });
  meta = {
    description = "Processing grid maps as a sequence of ROS filters.";
  };
})
