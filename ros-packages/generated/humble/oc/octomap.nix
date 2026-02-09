{
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "octomap";
  version = "1.9.8-1";
  src = finalAttrs.passthru.sources."octomap";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  passthru.sources = mkSourceSet (sources: {
    "octomap" = substituteSource {
      src = fetchgit {
        name = "octomap-source";
        url = "https://github.com/ros2-gbp/octomap-release.git";
        rev = "71d3428f9ce3c55acbe624261166f6eb2f513798";
        hash = "sha256-1C49qDf+5BFNi34JzrSFN0B0kNfv1MBTmcdT/hEjkKI=";
      };
    };
  });
  meta = {
    description = "The OctoMap library implements a 3D occupancy grid mapping approach, providing data structures and mapping algorithms in C++. The map implementation is based on an octree. See\n  http://octomap.github.io for details.";
  };
})
