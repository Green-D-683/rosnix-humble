{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  pmb2-gazebo,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "pmb2_simulation";
  version = "4.9.1-1";
  src = finalAttrs.passthru.sources."pmb2_simulation";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ pmb2-gazebo ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ pmb2-gazebo ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "pmb2_simulation" = substituteSource {
      src = fetchgit {
        name = "pmb2_simulation-source";
        url = "https://github.com/pal-gbp/pmb2_simulation-release.git";
        rev = "93537b14c6e21916eff6aec1855205ea97ccf852";
        hash = "sha256-mwnmvG7aa+aEg7K2dLbldVvpy5EGqZ8H16F7eJETnvQ=";
      };
    };
  });
  meta = {
    description = "PMB2-specific simulation components. These include plugins\n               and launch scripts necessary for running PMB2 in simulation.";
  };
})
