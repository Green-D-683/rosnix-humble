{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  game-controller-spl-interfaces,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "game_controller_spl";
  version = "2.2.0-2";
  src = finalAttrs.passthru.sources."game_controller_spl";
  propagatedNativeBuildInputs = [ game-controller-spl-interfaces rclpy ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-construct" ]; };
  propagatedBuildInputs = [ game-controller-spl-interfaces rclpy ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-construct" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "game_controller_spl" = substituteSource {
      src = fetchgit {
        name = "game_controller_spl-source";
        url = "https://github.com/ros2-gbp/game_controller_spl-release.git";
        rev = "e407267e4624a360b22cb12237fe2620f4e3ee2b";
        hash = "sha256-uGm1+ev/k4GEWiMoQy1oap3MO0Mz240QW+e846oLIF0=";
      };
    };
  });
  meta = {
    description = "GameController-Robot communication in RoboCup SPL";
  };
})
