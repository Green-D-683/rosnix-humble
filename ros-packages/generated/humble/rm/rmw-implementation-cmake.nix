{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rmw_implementation_cmake";
  version = "6.1.2-1";
  src = finalAttrs.passthru.sources."rmw_implementation_cmake";
  propagatedNativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-cmake ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rmw_implementation_cmake" = substituteSource {
      src = fetchgit {
        name = "rmw_implementation_cmake-source";
        url = "https://github.com/ros2-gbp/rmw-release.git";
        rev = "a21bf13e4ad7aa305c98a55f3600ed303dbc7ade";
        hash = "sha256-4Y5JBwkTGV53A+JV1WIzLRMyWIEOAcXLHOpL2Os3fdc=";
      };
    };
  });
  meta = {
    description = "\n    CMake functions which can discover and enumerate available implementations.\n  ";
  };
})
