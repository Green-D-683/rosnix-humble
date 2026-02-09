{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  clearpath-config,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  nav2-bringup,
  rosSystemPackages,
  slam-toolbox,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "clearpath_nav2_demos";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."clearpath_nav2_demos";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ clearpath-config nav2-bringup slam-toolbox ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ clearpath-config nav2-bringup slam-toolbox ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "clearpath_nav2_demos" = substituteSource {
      src = fetchgit {
        name = "clearpath_nav2_demos-source";
        url = "https://github.com/clearpath-gbp/clearpath_nav2_demos-release.git";
        rev = "6bc9c1f8b0e3d42129a99393ac7f8b143b45c04b";
        hash = "sha256-FiF69ck10N6VaaRxetMHAA1W39ByR5xjZEmguj6dLxU=";
      };
    };
  });
  meta = {
    description = "Nav2 demos for Clearpath robots";
  };
})
