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
  pmb2-controller-configuration,
  pmb2-description,
  robot-state-publisher,
  rosSystemPackages,
  substituteSource,
  twist-mux,
  twist-mux-msgs,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "pmb2_bringup";
  version = "5.10.2-1";
  src = finalAttrs.passthru.sources."pmb2_bringup";
  nativeBuildInputs = [ ament-cmake-auto wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament-index-python diagnostic-aggregator geometry-msgs joy-linux joy-teleop launch-pal pmb2-controller-configuration pmb2-description robot-state-publisher twist-mux twist-mux-msgs ];
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ ament-index-python diagnostic-aggregator geometry-msgs joy-linux joy-teleop launch-pal pmb2-controller-configuration pmb2-description robot-state-publisher twist-mux twist-mux-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "pmb2_bringup" = substituteSource {
      src = fetchgit {
        name = "pmb2_bringup-source";
        url = "https://github.com/pal-gbp/pmb2_robot-gbp.git";
        rev = "03dcee464dfb85ce818853296b7e889a315438cd";
        hash = "sha256-9gPGK8MUkNEqX7jJ1r5x7AQW/0gX4cBeyDQB3XDMC9g=";
      };
    };
  });
  meta = {
    description = "Launch files and scripts needed to bring up the ROS nodes of a PMB2 robot.";
  };
})
