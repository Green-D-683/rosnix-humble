{
  ament-cmake,
  ament-cmake-lint-cmake,
  ament-cmake-xmllint,
  ament-lint-auto,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rviz_assimp_vendor";
  version = "11.2.25-1";
  src = finalAttrs.passthru.sources."rviz_assimp_vendor";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "assimp" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "assimp" ]; };
  checkInputs = [ ament-cmake-lint-cmake ament-cmake-xmllint ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "rviz_assimp_vendor" = substituteSource {
      src = fetchgit {
        name = "rviz_assimp_vendor-source";
        url = "https://github.com/ros2-gbp/rviz-release.git";
        rev = "1018c95d1ad833502f0ab4d86666847f67b11928";
        hash = "sha256-yHTjaxCqUFa3PA2YgAdWk5Z8CrxFuQwyU/Z9X+LLC/U=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "URL https://github.com/assimp/assimp/archive/v4.1.0.tar.gz";
          to = "URL ${sources."rviz_assimp_vendor/v4"}";
        }
      ];
    };
    "rviz_assimp_vendor/v4" = substituteSource {
      src = fetchzip {
        name = "v4-source";
        url = "https://github.com/assimp/assimp/archive/v4.1.0.tar.gz";
        hash = "sha256-mTCK3Rud8Fwl8wtWSqTakYr7Tkd1X2bl/9rVHscL5gE=";
      };
    };
  });
  meta = {
    description = "\n    Wrapper around assimp, providing nothing but a dependency on assimp, on some systems.\n    On others, it provides a fixed CMake module or even an ExternalProject build of assimp.\n  ";
  };
})
