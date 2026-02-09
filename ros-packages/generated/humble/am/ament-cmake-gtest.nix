{
  ament-cmake-core,
  ament-cmake-test,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gtest-vendor,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ament_cmake_gtest";
  version = "1.3.13-1";
  src = finalAttrs.passthru.sources."ament_cmake_gtest";
  nativeBuildInputs = [ ament-cmake-core ];
  propagatedNativeBuildInputs = [ ament-cmake-test gtest-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "gtest" ]; };
  buildInputs = [ ament-cmake-core ];
  propagatedBuildInputs = [ ament-cmake-test gtest-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "gtest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_gtest" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_gtest-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "4789c3133765240e26f4bd713bc15acb5ca37d17";
        hash = "sha256-yilVigbY3wu/roWsCkc2r6no9ClGSbJF9+Yrbpe0Q8Q=";
      };
    };
  });
  meta = {
    description = "The ability to add gtest-based tests in the ament buildsystem in CMake.";
  };
})
