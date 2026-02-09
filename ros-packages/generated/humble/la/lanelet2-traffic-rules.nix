{
  ament-cmake-core,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  lanelet2-core,
  mkSourceSet,
  mrt-cmake-modules,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "lanelet2_traffic_rules";
  version = "1.2.2-1";
  src = finalAttrs.passthru.sources."lanelet2_traffic_rules";
  nativeBuildInputs = [ ament-cmake-core ];
  propagatedNativeBuildInputs = [ lanelet2-core mrt-cmake-modules ];
  buildInputs = [ ament-cmake-core ];
  propagatedBuildInputs = [ lanelet2-core mrt-cmake-modules ];
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "gtest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "lanelet2_traffic_rules" = substituteSource {
      src = fetchgit {
        name = "lanelet2_traffic_rules-source";
        url = "https://github.com/ros2-gbp/lanelet2-release.git";
        rev = "964aa91011128fe8ead09a1f351b623d6a439868";
        hash = "sha256-WRAwIa2GAGb8tJ3DmRXLjUzAEcPkfCb0840xOfROpng=";
      };
    };
  });
  meta = {
    description = "Package for interpreting traffic rules in a lanelet map";
  };
})
