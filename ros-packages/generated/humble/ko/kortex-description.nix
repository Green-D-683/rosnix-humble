{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  joint-state-publisher,
  joint-state-publisher-gui,
  joint-trajectory-controller,
  mkSourceSet,
  picknik-reset-fault-controller,
  picknik-twist-controller,
  robot-state-publisher,
  robotiq-description,
  rosSystemPackages,
  rviz2,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "kortex_description";
  version = "0.2.3-1";
  src = finalAttrs.passthru.sources."kortex_description";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ joint-state-publisher joint-state-publisher-gui joint-trajectory-controller picknik-reset-fault-controller picknik-twist-controller robot-state-publisher robotiq-description rviz2 ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ joint-state-publisher joint-state-publisher-gui joint-trajectory-controller picknik-reset-fault-controller picknik-twist-controller robot-state-publisher robotiq-description rviz2 ];
  passthru.sources = mkSourceSet (sources: {
    "kortex_description" = substituteSource {
      src = fetchgit {
        name = "kortex_description-source";
        url = "https://github.com/ros2-gbp/ros2_kortex-release.git";
        rev = "70fbbad1639a45bdccad5a3dcc7443247d4ebea9";
        hash = "sha256-g329RpVg/KW2TKEhfBaVEaPWewhRlkJ01IGqfNmo6Zo=";
      };
    };
  });
  meta = {
    description = "\n    ";
  };
})
