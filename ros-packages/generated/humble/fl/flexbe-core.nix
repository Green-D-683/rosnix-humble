{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  flexbe-msgs,
  launch-ros,
  launch-testing,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  std-msgs,
  std-srvs,
  substituteSource,
  tf2-ros-py,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "flexbe_core";
  version = "2.3.5-1";
  src = finalAttrs.passthru.sources."flexbe_core";
  propagatedNativeBuildInputs = [ flexbe-msgs rclpy std-msgs std-srvs tf2-ros-py ];
  propagatedBuildInputs = [ flexbe-msgs rclpy std-msgs std-srvs tf2-ros-py ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 launch-ros launch-testing ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "flexbe_core" = substituteSource {
      src = fetchgit {
        name = "flexbe_core-source";
        url = "https://github.com/ros2-gbp/flexbe_behavior_engine-release.git";
        rev = "c48851e9148661b8345787a60d3943e9fe81ca05";
        hash = "sha256-5j7ZVKLmKgyIPUiwHQUYBuoJgricZqE+6TcyVXuWosg=";
      };
    };
  });
  meta = {
    description = "\n        flexbe_core provides the core components for the FlexBE behavior engine.\n    ";
  };
})
