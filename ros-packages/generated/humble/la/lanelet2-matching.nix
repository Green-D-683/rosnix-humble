{
  ament-cmake-core,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  lanelet2-core,
  lanelet2-io,
  lanelet2-maps,
  lanelet2-projection,
  lanelet2-traffic-rules,
  mkSourceSet,
  mrt-cmake-modules,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "lanelet2_matching";
  version = "1.2.2-1";
  src = finalAttrs.passthru.sources."lanelet2_matching";
  nativeBuildInputs = [ ament-cmake-core ];
  propagatedNativeBuildInputs = [ lanelet2-core lanelet2-traffic-rules mrt-cmake-modules ];
  buildInputs = [ ament-cmake-core ];
  propagatedBuildInputs = [ lanelet2-core lanelet2-traffic-rules mrt-cmake-modules ];
  checkInputs = [ lanelet2-io lanelet2-maps lanelet2-projection ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "gtest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "lanelet2_matching" = substituteSource {
      src = fetchgit {
        name = "lanelet2_matching-source";
        url = "https://github.com/ros2-gbp/lanelet2-release.git";
        rev = "cac11c84d97ef6f24993046a8605c789e90a4017";
        hash = "sha256-5W1kOwe/QuNwlTxmBv846SKltS8Cl04mfBxO2/PBNOc=";
      };
    };
  });
  meta = {
    description = "Library to match objects to lanelets";
  };
})
