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
  pname = "dbw_ford_msgs";
  version = "2.1.16-1";
  src = finalAttrs.passthru.sources."dbw_ford_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ geometry-msgs rosidl-default-generators rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs rosidl-default-generators rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "dbw_ford_msgs" = substituteSource {
      src = fetchgit {
        name = "dbw_ford_msgs-source";
        url = "https://github.com/DataspeedInc-release/dbw_ros-release.git";
        rev = "7f456f9bf267525ad15dce2d8f653b7242c2feac";
        hash = "sha256-RZXyKwphgVKU/FvQceyVlzXcHm21JEpArMAaiSDp9PQ=";
      };
    };
  });
  meta = {
    description = "\n    Drive-by-wire messages for the Lincoln MKZ\n  ";
  };
})
