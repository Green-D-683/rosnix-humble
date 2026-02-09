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
  mocap4r2-marker-viz-srvs,
  mocap4r2-msgs,
  rosSystemPackages,
  substituteSource,
  visualization-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "mocap4r2_marker_viz";
  version = "0.0.7-1";
  src = finalAttrs.passthru.sources."mocap4r2_marker_viz";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ geometry-msgs mocap4r2-marker-viz-srvs mocap4r2-msgs visualization-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs mocap4r2-marker-viz-srvs mocap4r2-msgs visualization-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "mocap4r2_marker_viz" = substituteSource {
      src = fetchgit {
        name = "mocap4r2_marker_viz-source";
        url = "https://github.com/MOCAP4ROS2-Project/mocap4r2-release.git";
        rev = "4009b1f15ce6e03e2e4c8135493424667ec8c2d1";
        hash = "sha256-3BCd4Qhmx74G56gC6jtZ29KIVYYXmeeR6zoAWIivbKI=";
      };
    };
  });
  meta = {
    description = "Node for visualizing markers";
  };
})
