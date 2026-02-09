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
  geometry-msgs,
  joy-linux,
  joy-teleop,
  launch-pal,
  mkSourceSet,
  play-motion2,
  play-motion2-cli,
  rosSystemPackages,
  substituteSource,
  teleop-tools-msgs,
  tiago-controller-configuration,
  tiago-description,
  twist-mux,
  twist-mux-msgs,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "tiago_bringup";
  version = "4.22.0-1";
  src = finalAttrs.passthru.sources."tiago_bringup";
  nativeBuildInputs = [ ament-cmake-auto wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament-index-python diagnostic-aggregator geometry-msgs joy-linux joy-teleop launch-pal play-motion2 play-motion2-cli teleop-tools-msgs tiago-controller-configuration tiago-description twist-mux twist-mux-msgs ];
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ ament-index-python diagnostic-aggregator geometry-msgs joy-linux joy-teleop launch-pal play-motion2 play-motion2-cli teleop-tools-msgs tiago-controller-configuration tiago-description twist-mux twist-mux-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "tiago_bringup" = substituteSource {
      src = fetchgit {
        name = "tiago_bringup-source";
        url = "https://github.com/pal-gbp/tiago_robot-release.git";
        rev = "207273daceaba34611b09743464077f7978b0b3e";
        hash = "sha256-3vK1fglGs09cnudTlGOQJPVkCV+Y2PmLk2+nBmYGSrM=";
      };
    };
  });
  meta = {
    description = "Launch files to upload the robot description and start the controllers";
  };
})
