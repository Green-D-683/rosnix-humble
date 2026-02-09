{
  ament-cmake,
  ament-index-cpp,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  ros-gz-bridge,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ros_ign_bridge";
  version = "0.244.21-1";
  src = finalAttrs.passthru.sources."ros_ign_bridge";
  nativeBuildInputs = [ ament-cmake ament-index-cpp ];
  propagatedNativeBuildInputs = [ ros-gz-bridge ];
  buildInputs = [ ament-cmake ament-index-cpp ];
  propagatedBuildInputs = [ ros-gz-bridge ];
  passthru.sources = mkSourceSet (sources: {
    "ros_ign_bridge" = substituteSource {
      src = fetchgit {
        name = "ros_ign_bridge-source";
        url = "https://github.com/ros2-gbp/ros_ign-release.git";
        rev = "b896b15df2a34883d344bc63664c2a03e5c00027";
        hash = "sha256-aEal3lRZTjNtM1DbDOE6wnCuXcuJ5IlwXYjdY1esFkM=";
      };
    };
  });
  meta = {
    description = "Shim package to redirect to ros_gz_bridge.";
  };
})
