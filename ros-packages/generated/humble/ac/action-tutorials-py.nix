{
  action-tutorials-interfaces,
  ament-lint-auto,
  ament-lint-common,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "action_tutorials_py";
  version = "0.20.8-1";
  src = finalAttrs.passthru.sources."action_tutorials_py";
  propagatedNativeBuildInputs = [ action-tutorials-interfaces rclpy ];
  propagatedBuildInputs = [ action-tutorials-interfaces rclpy ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "action_tutorials_py" = substituteSource {
      src = fetchgit {
        name = "action_tutorials_py-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "01c87927e85c14b0461e5512e2a8d8dcdd3e7e2b";
        hash = "sha256-d0TFW1hIOqJvH0O9txEpXyaTC/oHfWL6AM2y8R4WeYE=";
      };
    };
  });
  meta = {
    description = "Python action tutorial code";
  };
})
