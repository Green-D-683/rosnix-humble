{
  ament-cmake-core,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "grid_map_cmake_helpers";
  version = "2.0.1-1";
  src = finalAttrs.passthru.sources."grid_map_cmake_helpers";
  propagatedNativeBuildInputs = [ ament-cmake-core ];
  propagatedBuildInputs = [ ament-cmake-core ];
  passthru.sources = mkSourceSet (sources: {
    "grid_map_cmake_helpers" = substituteSource {
      src = fetchgit {
        name = "grid_map_cmake_helpers-source";
        url = "https://github.com/ros2-gbp/grid_map-release.git";
        rev = "a1008e6cb821ff1c651eb3795c6ef582b768b3a1";
        hash = "sha256-mMjyvWowGE1KnJWLB1RkMIi8av2Byzjy/2VkOWkjzNc=";
      };
    };
  });
  meta = {
    description = "CMake support functionality used throughout grid_map";
  };
})
