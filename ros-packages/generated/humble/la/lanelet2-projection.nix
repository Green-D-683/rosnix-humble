{
  ament-cmake-core,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  lanelet2-io,
  mkSourceSet,
  mrt-cmake-modules,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "lanelet2_projection";
  version = "1.2.2-1";
  src = finalAttrs.passthru.sources."lanelet2_projection";
  nativeBuildInputs = [ ament-cmake-core ];
  propagatedNativeBuildInputs = [ lanelet2-io mrt-cmake-modules ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "geographiclib" ]; };
  buildInputs = [ ament-cmake-core ];
  propagatedBuildInputs = [ lanelet2-io mrt-cmake-modules ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "geographiclib" ]; };
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "gtest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "lanelet2_projection" = substituteSource {
      src = fetchgit {
        name = "lanelet2_projection-source";
        url = "https://github.com/ros2-gbp/lanelet2-release.git";
        rev = "386b8eaba02fac1c4d5ae657312d1c0be687632c";
        hash = "sha256-FNrRgKyrMS9S9rtsu2me22Uuhe8FEa6pulLpMaw9Ews=";
      };
    };
  });
  meta = {
    description = "Lanelet2 projection library for lat/lon to local x/y conversion";
  };
})
