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
  pname = "lanelet2_maps";
  version = "1.2.2-1";
  src = finalAttrs.passthru.sources."lanelet2_maps";
  nativeBuildInputs = [ ament-cmake-core ];
  propagatedNativeBuildInputs = [ lanelet2-core mrt-cmake-modules ];
  buildInputs = [ ament-cmake-core ];
  propagatedBuildInputs = [ lanelet2-core mrt-cmake-modules ];
  passthru.sources = mkSourceSet (sources: {
    "lanelet2_maps" = substituteSource {
      src = fetchgit {
        name = "lanelet2_maps-source";
        url = "https://github.com/ros2-gbp/lanelet2-release.git";
        rev = "74c912f66f0eb86aedc04fa9f1e16028a85d29a4";
        hash = "sha256-E/IPIRM9PS6Pj908cmm8JM3pF8UwAFkOPuOG/LYremk=";
      };
    };
  });
  meta = {
    description = "Example maps in the lanelet2-format";
  };
})
