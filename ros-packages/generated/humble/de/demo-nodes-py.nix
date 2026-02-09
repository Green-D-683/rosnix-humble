{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentPythonPackage,
  example-interfaces,
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
  pname = "demo_nodes_py";
  version = "0.20.8-1";
  src = finalAttrs.passthru.sources."demo_nodes_py";
  propagatedNativeBuildInputs = [ example-interfaces rclpy std-msgs ];
  propagatedBuildInputs = [ example-interfaces rclpy std-msgs ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "demo_nodes_py" = substituteSource {
      src = fetchgit {
        name = "demo_nodes_py-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "5a12e9f0c2b6906a6320bbed785190887c8eebce";
        hash = "sha256-18iWXXUVPfVxqbc03z2aFF9hPW56xtO4/gcO9ZAkUhc=";
      };
    };
  });
  meta = {
    description = "\n    Python nodes which were previously in the ros2/examples repository but are now just used for demo purposes.\n  ";
  };
})
