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
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "examples_rclpy_minimal_action_client";
  version = "0.15.5-1";
  src = finalAttrs.passthru.sources."examples_rclpy_minimal_action_client";
  propagatedNativeBuildInputs = [ example-interfaces rclpy ];
  propagatedBuildInputs = [ example-interfaces rclpy ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "examples_rclpy_minimal_action_client" = substituteSource {
      src = fetchgit {
        name = "examples_rclpy_minimal_action_client-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "fa7efdeb5f2f482587477a9aceed7b1f26653a22";
        hash = "sha256-cB3TcTx/imd4PPQqm5KLUHUXRhM5vaPEcibQq1ktpxY=";
      };
    };
  });
  meta = {
    description = "Examples of minimal action clients using rclpy.";
  };
})
