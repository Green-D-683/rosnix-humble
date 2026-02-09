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
  pname = "dbw_fca_msgs";
  version = "2.1.16-1";
  src = finalAttrs.passthru.sources."dbw_fca_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ geometry-msgs rosidl-default-generators rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs rosidl-default-generators rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "dbw_fca_msgs" = substituteSource {
      src = fetchgit {
        name = "dbw_fca_msgs-source";
        url = "https://github.com/DataspeedInc-release/dbw_ros-release.git";
        rev = "7ce8f1dc417de518bf5ea70cdb1f8a5f324c7661";
        hash = "sha256-q9NCnYj7Y5bYxFvGqpXfgMwql5KVBWqgRK/I8PJSz/0=";
      };
    };
  });
  meta = {
    description = "\n    Drive-by-wire messages for the Chrysler Pacifica\n  ";
  };
})
