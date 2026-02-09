{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rcgcd-spl-14,
  rcgcd-spl-14-conversion,
  rcgcrd-spl-4,
  rcgcrd-spl-4-conversion,
  rclpy,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "gc_spl_2022";
  version = "2.2.0-2";
  src = finalAttrs.passthru.sources."gc_spl_2022";
  propagatedNativeBuildInputs = [ rcgcd-spl-14 rcgcd-spl-14-conversion rcgcrd-spl-4 rcgcrd-spl-4-conversion rclpy ];
  propagatedBuildInputs = [ rcgcd-spl-14 rcgcd-spl-14-conversion rcgcrd-spl-4 rcgcrd-spl-4-conversion rclpy ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "gc_spl_2022" = substituteSource {
      src = fetchgit {
        name = "gc_spl_2022-source";
        url = "https://github.com/ros2-gbp/game_controller_spl-release.git";
        rev = "4047f8ef002de3648da73b744cd71107f646bcd2";
        hash = "sha256-7wAPw6EymMmpF8YK2aWnz+AIPe24wSVHXT2JLbFsAwI=";
      };
    };
  });
  meta = {
    description = "GameController-Robot communication in RoboCup SPL at RoboCup2022";
  };
})
