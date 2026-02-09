{
  ament-cmake-auto,
  ament-cmake-python,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  pal-urdf-utils,
  rosSystemPackages,
  substituteSource,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "talos_description_calibration";
  version = "2.9.1-1";
  src = finalAttrs.passthru.sources."talos_description_calibration";
  nativeBuildInputs = [ ament-cmake-auto ament-cmake-python ];
  propagatedNativeBuildInputs = [ pal-urdf-utils xacro ];
  buildInputs = [ ament-cmake-auto ament-cmake-python ];
  propagatedBuildInputs = [ pal-urdf-utils xacro ];
  passthru.sources = mkSourceSet (sources: {
    "talos_description_calibration" = substituteSource {
      src = fetchgit {
        name = "talos_description_calibration-source";
        url = "https://github.com/pal-gbp/talos_robot-release.git";
        rev = "b6d7a2520cff142c0028c6375d25d439fc736101";
        hash = "sha256-n4f0O9jH8T+XJuPyLrMftzLNGTkoZDRrkoqoHVimF8Q=";
      };
    };
  });
  meta = {
    description = "This package contains the description of the hand-eye calibration of the TALOS robot.  The files in this package are used also from the talos_description package.";
  };
})
