{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  talos-bringup,
  talos-controller-configuration,
  talos-description,
  talos-description-calibration,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "talos_robot";
  version = "2.9.1-1";
  src = finalAttrs.passthru.sources."talos_robot";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ talos-bringup talos-controller-configuration talos-description talos-description-calibration ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ talos-bringup talos-controller-configuration talos-description talos-description-calibration ];
  passthru.sources = mkSourceSet (sources: {
    "talos_robot" = substituteSource {
      src = fetchgit {
        name = "talos_robot-source";
        url = "https://github.com/pal-gbp/talos_robot-release.git";
        rev = "72fa7c592a20ecff4da13a09616d1600113f93f2";
        hash = "sha256-aWEmKWPEiSqVQF2LE+IO/MLWtQzR41PJlW2sIW7pw8s=";
      };
    };
  });
  meta = {
    description = "Description and launch files for the TOR robot";
  };
})
