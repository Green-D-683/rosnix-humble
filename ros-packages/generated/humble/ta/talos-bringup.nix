{
  ament-cmake-auto,
  ament-index-python,
  buildAmentCmakePackage,
  diagnostic-aggregator,
  fetchgit,
  fetchurl,
  fetchzip,
  joy-linux,
  joy-teleop,
  mkSourceSet,
  play-motion2,
  play-motion2-cli,
  rosSystemPackages,
  substituteSource,
  talos-controller-configuration,
  talos-description,
  twist-mux,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "talos_bringup";
  version = "2.9.1-1";
  src = finalAttrs.passthru.sources."talos_bringup";
  nativeBuildInputs = [ ament-cmake-auto wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament-index-python diagnostic-aggregator joy-linux joy-teleop play-motion2 play-motion2-cli talos-controller-configuration talos-description twist-mux ];
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ ament-index-python diagnostic-aggregator joy-linux joy-teleop play-motion2 play-motion2-cli talos-controller-configuration talos-description twist-mux ];
  passthru.sources = mkSourceSet (sources: {
    "talos_bringup" = substituteSource {
      src = fetchgit {
        name = "talos_bringup-source";
        url = "https://github.com/pal-gbp/talos_robot-release.git";
        rev = "18586d99611d8c50a108b461b500fb102efea760";
        hash = "sha256-pU+umaRzGU/DicfsgDOKCVWHSZG/KKM9VLPUEOa9cvA=";
      };
    };
  });
  meta = {
    description = "The talos_bringup package";
  };
})
