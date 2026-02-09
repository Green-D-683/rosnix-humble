{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "examples_rclpy_executors";
  version = "0.15.5-1";
  src = finalAttrs.passthru.sources."examples_rclpy_executors";
  propagatedNativeBuildInputs = [ rclpy std-msgs ];
  propagatedBuildInputs = [ rclpy std-msgs ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "examples_rclpy_executors" = substituteSource {
      src = fetchgit {
        name = "examples_rclpy_executors-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "c30cfa56fb9e01061bb758e0ce12c94c3ea68817";
        hash = "sha256-K/Pwv8pLIErY9Gj9aOWx69SzCiINoKxKq3/VQgdO/nk=";
      };
    };
  });
  meta = {
    description = "Examples of creating and using exectors to run multiple nodes in the same process";
  };
})
