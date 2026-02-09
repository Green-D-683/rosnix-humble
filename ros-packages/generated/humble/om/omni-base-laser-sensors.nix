{
  ament-cmake-auto,
  ament-index-python,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  diagnostic-aggregator,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "omni_base_laser_sensors";
  version = "2.19.1-1";
  src = finalAttrs.passthru.sources."omni_base_laser_sensors";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedNativeBuildInputs = [ ament-index-python diagnostic-aggregator ];
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ ament-index-python diagnostic-aggregator ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "omni_base_laser_sensors" = substituteSource {
      src = fetchgit {
        name = "omni_base_laser_sensors-source";
        url = "https://github.com/pal-gbp/omni_base_navigation-release.git";
        rev = "63a77010508e681c4fee4995e5f772b3ca66af19";
        hash = "sha256-scVtHUVECTxIks3c/JMDkuH32MbztqgfNymiO6cBzkg=";
      };
    };
  });
  meta = {
    description = "omni_base-specific laser sensors launch and config files.";
  };
})
