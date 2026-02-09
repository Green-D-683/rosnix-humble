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
  pname = "dataspeed_ulc_msgs";
  version = "2.1.16-1";
  src = finalAttrs.passthru.sources."dataspeed_ulc_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rosidl-default-generators rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "dataspeed_ulc_msgs" = substituteSource {
      src = fetchgit {
        name = "dataspeed_ulc_msgs-source";
        url = "https://github.com/DataspeedInc-release/dbw_ros-release.git";
        rev = "051a4f66ba9eb3ebd6d24199a4a1f9e9455357af";
        hash = "sha256-Djrh3JKKj1JGhhfmPrVHKiIMMmDJZkHsEcO79fS8t7w=";
      };
    };
  });
  meta = {
    description = "\n    ROS messages for interacting with the Universal Lat/Lon Controller (ULC)\n  ";
  };
})
