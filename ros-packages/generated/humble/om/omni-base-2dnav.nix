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
  pname = "omni_base_2dnav";
  version = "2.19.1-1";
  src = finalAttrs.passthru.sources."omni_base_2dnav";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedNativeBuildInputs = [ ament-index-python diagnostic-aggregator launch-pal pal-maps ros2launch ];
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ ament-index-python diagnostic-aggregator launch-pal pal-maps ros2launch ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "omni_base_2dnav" = substituteSource {
      src = fetchgit {
        name = "omni_base_2dnav-source";
        url = "https://github.com/pal-gbp/omni_base_navigation-release.git";
        rev = "7cff45e6ce79d64ea8c9e472b1d4327fcd3a1822";
        hash = "sha256-PeX6sFWI/2aj4tz8Sj6posvW2xtXp13GwDuFOApuo1s=";
      };
    };
  });
  meta = {
    description = "omni_base-specific launch files needed to run\n    navigation on the omni_base robot.";
  };
})
