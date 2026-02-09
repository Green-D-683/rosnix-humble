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
  launch-pal,
  mkSourceSet,
  omni-base-controller-configuration,
  omni-base-description,
  robot-state-publisher,
  rosSystemPackages,
  substituteSource,
  twist-mux,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "omni_base_bringup";
  version = "2.14.1-1";
  src = finalAttrs.passthru.sources."omni_base_bringup";
  nativeBuildInputs = [ ament-cmake-auto wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament-index-python diagnostic-aggregator joy-linux joy-teleop launch-pal omni-base-controller-configuration omni-base-description robot-state-publisher twist-mux ];
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ ament-index-python diagnostic-aggregator joy-linux joy-teleop launch-pal omni-base-controller-configuration omni-base-description robot-state-publisher twist-mux ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "omni_base_bringup" = substituteSource {
      src = fetchgit {
        name = "omni_base_bringup-source";
        url = "https://github.com/pal-gbp/omni_base_robot-release.git";
        rev = "a7d591e8aaa4153d7b28a3d6c9fb211660b30028";
        hash = "sha256-3kWPH9qSyJ5bIveEo7NN833f2r881PStoRbR9rdRl+Y=";
      };
    };
  });
  meta = {
    description = "The omni_base_bringup package";
  };
})
