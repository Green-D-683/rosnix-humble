{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rmf-building-map-msgs,
  rmf-door-msgs,
  rmf-lift-msgs,
  rmf-visualization-msgs,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "rmf_visualization_building_systems";
  version = "2.0.2-1";
  src = finalAttrs.passthru.sources."rmf_visualization_building_systems";
  propagatedNativeBuildInputs = [ geometry-msgs rmf-building-map-msgs rmf-door-msgs rmf-lift-msgs rmf-visualization-msgs ];
  propagatedBuildInputs = [ geometry-msgs rmf-building-map-msgs rmf-door-msgs rmf-lift-msgs rmf-visualization-msgs ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rmf_visualization_building_systems" = substituteSource {
      src = fetchgit {
        name = "rmf_visualization_building_systems-source";
        url = "https://github.com/ros2-gbp/rmf_visualization-release.git";
        rev = "f110c20a968f9c7e77310f3c9679fe95300f285f";
        hash = "sha256-pe1h/Tt7w+xVU2cE9zYhqdEAuWWshVkQBPtKXgyjCmI=";
      };
    };
  });
  meta = {
    description = "A visualizer for doors and lifts";
  };
})
