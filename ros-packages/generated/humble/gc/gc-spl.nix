{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gc-spl-interfaces,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "gc_spl";
  version = "2.2.0-2";
  src = finalAttrs.passthru.sources."gc_spl";
  propagatedNativeBuildInputs = [ gc-spl-interfaces rclpy ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-construct" ]; };
  propagatedBuildInputs = [ gc-spl-interfaces rclpy ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-construct" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "gc_spl" = substituteSource {
      src = fetchgit {
        name = "gc_spl-source";
        url = "https://github.com/ros2-gbp/game_controller_spl-release.git";
        rev = "c0e133fd7984cdb6e2e3939c0f90abccc7423d88";
        hash = "sha256-EFLoSTI3Qnzaxw7DxLWDWZX3XgL/P8RMHfqbwmSEMp8=";
      };
    };
  });
  meta = {
    description = "GameController-Robot communication in RoboCup SPL";
  };
})
