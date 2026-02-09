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
  pname = "gurumdds_cmake_module";
  version = "3.4.2-1";
  src = finalAttrs.passthru.sources."gurumdds_cmake_module";
  propagatedNativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "gurumdds-3.0" ]; };
  propagatedBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "gurumdds-3.0" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "gurumdds_cmake_module" = substituteSource {
      src = fetchgit {
        name = "gurumdds_cmake_module-source";
        url = "https://github.com/ros2-gbp/rmw_gurumdds-release.git";
        rev = "256077c24c4aa72f0682f7b4c7139295d483d2e8";
        hash = "sha256-DRGxP9Z6o21OOUS+ec4eei4Km/B9jvXnR3e670/XB/Q=";
      };
    };
  });
  meta = {
    description = "Provide CMake module to find GurumNetworks GurumDDS.";
  };
})
