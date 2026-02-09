{
  ament-cmake,
  ament-cmake-lint-cmake,
  ament-lint-auto,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  urdf,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "irobot_create_description";
  version = "2.1.0-1";
  src = finalAttrs.passthru.sources."irobot_create_description";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ urdf ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ urdf ];
  checkInputs = [ ament-cmake-lint-cmake ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "irobot_create_description" = substituteSource {
      src = fetchgit {
        name = "irobot_create_description-source";
        url = "https://github.com/ros2-gbp/create3_sim-release.git";
        rev = "64db3547c71f928563ffefd1d697eeaa3ef92024";
        hash = "sha256-GzpENHZJ/Re1cp3OGpYapAwbpPt3H33wloBw4Sag0EM=";
      };
    };
  });
  meta = {
    description = "Provides the model description for the iRobot(R) Create(R) 3 Educational Robot.";
  };
})
