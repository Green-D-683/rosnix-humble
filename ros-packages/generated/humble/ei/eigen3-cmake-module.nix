{
  ament-cmake,
  ament-cmake-copyright,
  ament-cmake-lint-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "eigen3_cmake_module";
  version = "0.1.1-4";
  src = finalAttrs.passthru.sources."eigen3_cmake_module";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "eigen3_cmake_module" = substituteSource {
      src = fetchgit {
        name = "eigen3_cmake_module-source";
        url = "https://github.com/ros2-gbp/eigen3_cmake_module-release.git";
        rev = "fb6325b445a199f927e85fa6eb1e2136f1b938b9";
        hash = "sha256-JYv6XaPTqspaLTKHbLNoNYx3ivXCTVAvRO3oNEhhxQ4=";
      };
    };
  });
  meta = {
    description = "Exports a custom CMake module to find Eigen3.";
  };
})
