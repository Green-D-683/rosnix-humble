{
  ament-cmake,
  ament-cmake-gmock,
  ament-cmake-gtest,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ament_cmake_auto";
  version = "1.3.13-1";
  src = finalAttrs.passthru.sources."ament_cmake_auto";
  propagatedNativeBuildInputs = [ ament-cmake ament-cmake-gmock ament-cmake-gtest ];
  propagatedBuildInputs = [ ament-cmake ament-cmake-gmock ament-cmake-gtest ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_auto" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_auto-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "1f77a9faa816eb01bbfb6a6c25eae085eba5114e";
        hash = "sha256-9m9y9CwWsFYeOwSyAWRHGfDQ5rAt4YE+B2YDnY92OXY=";
      };
    };
  });
  meta = {
    description = "The auto-magic functions for ease to use of the ament buildsystem in CMake.";
  };
})
