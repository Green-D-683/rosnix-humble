{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "dbw_polaris_msgs";
  version = "2.1.16-1";
  src = finalAttrs.passthru.sources."dbw_polaris_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ geometry-msgs rosidl-default-generators rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs rosidl-default-generators rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "dbw_polaris_msgs" = substituteSource {
      src = fetchgit {
        name = "dbw_polaris_msgs-source";
        url = "https://github.com/DataspeedInc-release/dbw_ros-release.git";
        rev = "1fb08f022f0bec0d13c15339b5da42af73b0d0cf";
        hash = "sha256-lTODoLy+1juSkR9jj8oJRIka2v+zLO/jEQ+Y4Jz5klY=";
      };
    };
  });
  meta = {
    description = "\n    Drive-by-wire messages for Polaris platforms\n  ";
  };
})
