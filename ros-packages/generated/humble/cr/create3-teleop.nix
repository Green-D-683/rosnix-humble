{
  ament-cmake-flake8,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  joy,
  launch-ros,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  teleop-twist-joy,
  teleop-twist-keyboard,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "create3_teleop";
  version = "0.0.5-1";
  src = finalAttrs.passthru.sources."create3_teleop";
  propagatedNativeBuildInputs = [ joy launch-ros teleop-twist-joy teleop-twist-keyboard ];
  propagatedBuildInputs = [ joy launch-ros teleop-twist-joy teleop-twist-keyboard ];
  checkInputs = [ ament-cmake-flake8 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "create3_teleop" = substituteSource {
      src = fetchgit {
        name = "create3_teleop-source";
        url = "https://github.com/ros2-gbp/create3_examples-release.git";
        rev = "5973ccabce0d22732926b8ca66902927aa32c984";
        hash = "sha256-sWt5GKeHC6/GIrP2iq8i4nd7O5DIwjF7tIVtFg3ChE8=";
      };
    };
  });
  meta = {
    description = "Example launch files for teleoperating the iRobot(R) Create(R) 3 Educational Robot.";
  };
})
