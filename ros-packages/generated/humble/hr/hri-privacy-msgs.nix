{
  ament-cmake,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "hri_privacy_msgs";
  version = "1.2.0-1";
  src = finalAttrs.passthru.sources."hri_privacy_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  passthru.sources = mkSourceSet (sources: {
    "hri_privacy_msgs" = substituteSource {
      src = fetchgit {
        name = "hri_privacy_msgs-source";
        url = "https://github.com/ros4hri/hri_privacy_msgs-release.git";
        rev = "94d720b6e90cff46a345272ac9a6354dfd9806f9";
        hash = "sha256-a49ESvW5PDms0SYdh3lZ604uTxVHYbmPTKN1CggMMOY=";
      };
    };
  });
  meta = {
    description = "ROS message definitions for declaring privacy-sensitive data flows";
  };
})
