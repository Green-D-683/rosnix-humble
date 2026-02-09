{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "dataspeed_can_msgs";
  version = "2.0.6-1";
  src = finalAttrs.passthru.sources."dataspeed_can_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rosidl-default-generators rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "dataspeed_can_msgs" = substituteSource {
      src = fetchgit {
        name = "dataspeed_can_msgs-source";
        url = "https://github.com/DataspeedInc-release/dataspeed_can-release.git";
        rev = "f1b3689316bc90806e62db990b66f2b8a25bab86";
        hash = "sha256-ynnMWI2aSBJgwmv9dNkgLmHkpUfy1YTD8Q7+kUqrAnI=";
      };
    };
  });
  meta = {
    description = "\n    Controller Area Network (CAN) messages\n  ";
  };
})
