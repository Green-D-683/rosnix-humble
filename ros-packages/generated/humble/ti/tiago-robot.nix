{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  tiago-bringup,
  tiago-controller-configuration,
  tiago-description,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "tiago_robot";
  version = "4.22.0-1";
  src = finalAttrs.passthru.sources."tiago_robot";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ tiago-bringup tiago-controller-configuration tiago-description ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ tiago-bringup tiago-controller-configuration tiago-description ];
  passthru.sources = mkSourceSet (sources: {
    "tiago_robot" = substituteSource {
      src = fetchgit {
        name = "tiago_robot-source";
        url = "https://github.com/pal-gbp/tiago_robot-release.git";
        rev = "044737a5cfdc0b7777f5841c5d23974ea7e09c32";
        hash = "sha256-d2tdIW/RtWebR5GKmNUZw+3K6hlgHMUlkK0G0T1XOpM=";
      };
    };
  });
  meta = {
    description = "Description and controller configuration of TIAGo";
  };
})
