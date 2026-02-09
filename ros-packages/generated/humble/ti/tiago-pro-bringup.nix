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
  joy-linux,
  joy-teleop,
  mkSourceSet,
  pal-pro-gripper-wrapper,
  play-motion2,
  play-motion2-cli,
  rosSystemPackages,
  substituteSource,
  tiago-pro-controller-configuration,
  tiago-pro-head-bringup,
  twist-mux,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "tiago_pro_bringup";
  version = "1.32.1-1";
  src = finalAttrs.passthru.sources."tiago_pro_bringup";
  nativeBuildInputs = [ ament-cmake-auto wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament-index-python diagnostic-aggregator joy-linux joy-teleop pal-pro-gripper-wrapper play-motion2 play-motion2-cli tiago-pro-controller-configuration tiago-pro-head-bringup twist-mux ];
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ ament-index-python diagnostic-aggregator joy-linux joy-teleop pal-pro-gripper-wrapper play-motion2 play-motion2-cli tiago-pro-controller-configuration tiago-pro-head-bringup twist-mux ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "tiago_pro_bringup" = substituteSource {
      src = fetchgit {
        name = "tiago_pro_bringup-source";
        url = "https://github.com/ros2-gbp/tiago_pro_robot-release.git";
        rev = "98a38ed88847af0cfe742405ac753e20a130a876";
        hash = "sha256-X+5YgM5U3oJLSigeuHYpw8Zbs2apY4UBbTZ9B34DSvA=";
      };
    };
  });
  meta = {
    description = "Launch files to upload the TIAGo pro robot description and start the controllers";
  };
})
