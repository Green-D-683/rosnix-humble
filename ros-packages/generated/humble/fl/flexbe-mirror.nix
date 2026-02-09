{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  flexbe-core,
  flexbe-msgs,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "flexbe_mirror";
  version = "2.3.5-1";
  src = finalAttrs.passthru.sources."flexbe_mirror";
  propagatedNativeBuildInputs = [ flexbe-core flexbe-msgs rclpy ];
  propagatedBuildInputs = [ flexbe-core flexbe-msgs rclpy ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "flexbe_mirror" = substituteSource {
      src = fetchgit {
        name = "flexbe_mirror-source";
        url = "https://github.com/ros2-gbp/flexbe_behavior_engine-release.git";
        rev = "5bb05f361ae1d8bf34069dd12344036a73f8fa6a";
        hash = "sha256-1eccL9zmzsU8IdT2df4ku0ye7yVGIi1S4Tgd+s28MjI=";
      };
    };
  });
  meta = {
    description = "\n        flexbe_mirror implements functionality to remotely mirror an executed behavior.\n    ";
  };
})
