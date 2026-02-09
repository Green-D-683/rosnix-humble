{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  clearpath-generator-gz,
  clearpath-gz,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "clearpath_simulator";
  version = "1.3.2-1";
  src = finalAttrs.passthru.sources."clearpath_simulator";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ clearpath-generator-gz clearpath-gz ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ clearpath-generator-gz clearpath-gz ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "clearpath_simulator" = substituteSource {
      src = fetchgit {
        name = "clearpath_simulator-source";
        url = "https://github.com/clearpath-gbp/clearpath_simulator-release.git";
        rev = "161e1bdaceca19d13e04a4748ce2797344d3c41e";
        hash = "sha256-x1QDFquw+KkNvBu8P9A1ii3kHuCb1UJ/4G4t7i9oxH8=";
      };
    };
  });
  meta = {
    description = "Clearpath Simulator Metapackage";
  };
})
