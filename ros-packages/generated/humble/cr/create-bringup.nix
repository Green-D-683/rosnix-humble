{
  ament-cmake,
  buildAmentCmakePackage,
  create-description,
  create-driver,
  fetchgit,
  fetchurl,
  fetchzip,
  joy,
  joy-teleop,
  launch-xml,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "create_bringup";
  version = "3.1.0-1";
  src = finalAttrs.passthru.sources."create_bringup";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ create-description create-driver joy joy-teleop launch-xml ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ create-description create-driver joy joy-teleop launch-xml ];
  passthru.sources = mkSourceSet (sources: {
    "create_bringup" = substituteSource {
      src = fetchgit {
        name = "create_bringup-source";
        url = "https://github.com/AutonomyLab/create_autonomy-release.git";
        rev = "94f016770a93904f1bb6a84830d2a83f3a576390";
        hash = "sha256-Zt2int9ROUgsbQMn44KXkAPO0Uauux5/Sayr/6KQ6lU=";
      };
    };
  });
  meta = {
    description = "Launch and configuration files for common accessories when working with Create/Roomba platforms.";
  };
})
