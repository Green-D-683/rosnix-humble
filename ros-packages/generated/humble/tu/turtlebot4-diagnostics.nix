{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentPythonPackage,
  diagnostic-aggregator,
  diagnostic-msgs,
  diagnostic-updater,
  fetchgit,
  fetchurl,
  fetchzip,
  irobot-create-msgs,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "turtlebot4_diagnostics";
  version = "1.0.3-1";
  src = finalAttrs.passthru.sources."turtlebot4_diagnostics";
  propagatedNativeBuildInputs = [ diagnostic-aggregator diagnostic-msgs diagnostic-updater irobot-create-msgs rclpy sensor-msgs ];
  propagatedBuildInputs = [ diagnostic-aggregator diagnostic-msgs diagnostic-updater irobot-create-msgs rclpy sensor-msgs ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "turtlebot4_diagnostics" = substituteSource {
      src = fetchgit {
        name = "turtlebot4_diagnostics-source";
        url = "https://github.com/ros2-gbp/turtlebot4_robot-release.git";
        rev = "108c8ccd1e5f9c779b0d039cc47f1ebb16c54810";
        hash = "sha256-DitXMf+cJDEdUJ0LxngR3TM7j69oomjSW7UYvlvcGD0=";
      };
    };
  });
  meta = {
    description = "Turtlebot4 Diagnostics";
  };
})
