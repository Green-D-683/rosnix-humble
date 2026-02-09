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
  pname = "lanelet2_io";
  version = "1.2.2-1";
  src = finalAttrs.passthru.sources."lanelet2_io";
  nativeBuildInputs = [ ament-cmake-core ];
  propagatedNativeBuildInputs = [ lanelet2-core mrt-cmake-modules ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "boost" "pugixml-dev" ]; };
  buildInputs = [ ament-cmake-core ];
  propagatedBuildInputs = [ lanelet2-core mrt-cmake-modules ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" "pugixml-dev" ]; };
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "gtest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "lanelet2_io" = substituteSource {
      src = fetchgit {
        name = "lanelet2_io-source";
        url = "https://github.com/ros2-gbp/lanelet2-release.git";
        rev = "56ff68557d04244332d991c9740462b6d0d6ead1";
        hash = "sha256-q0BAB2IWbS7JVRpJ4RxPl01KyW04hYsUcO2Kmtwjs3Q=";
      };
    };
  });
  meta = {
    description = "Parser/Writer module for lanelet2";
  };
})
