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
  launch-pal,
  mkSourceSet,
  pal-maps,
  ros2launch,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "pmb2_2dnav";
  version = "4.18.2-1";
  src = finalAttrs.passthru.sources."pmb2_2dnav";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedNativeBuildInputs = [ ament-index-python diagnostic-aggregator launch-pal pal-maps ros2launch ];
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ ament-index-python diagnostic-aggregator launch-pal pal-maps ros2launch ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "pmb2_2dnav" = substituteSource {
      src = fetchgit {
        name = "pmb2_2dnav-source";
        url = "https://github.com/pal-gbp/pmb2_navigation-gbp.git";
        rev = "de52158149799674a07b0006c5d669be8e60491b";
        hash = "sha256-ZDKvHz9MCq2xOlDMavmPFFf28pnCf7eeR/TUGYTLtOA=";
      };
    };
  });
  meta = {
    description = "PMB2-specific launch files needed to run\n    navigation on the PMB2 robot.";
  };
})
