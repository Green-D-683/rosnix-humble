{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  as2-motion-reference-handlers,
  as2-python-api,
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
  pname = "as2_keyboard_teleoperation";
  version = "1.1.3-1";
  src = finalAttrs.passthru.sources."as2_keyboard_teleoperation";
  propagatedNativeBuildInputs = [ as2-motion-reference-handlers as2-python-api rclpy ];
  propagatedBuildInputs = [ as2-motion-reference-handlers as2-python-api rclpy ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "as2_keyboard_teleoperation" = substituteSource {
      src = fetchgit {
        name = "as2_keyboard_teleoperation-source";
        url = "https://github.com/ros2-gbp/aerostack2-release.git";
        rev = "db1006b725a1b8362996920d14e2a51407015c51";
        hash = "sha256-92xYUQYq/TclxO/Qhq3o76RugZLzu7o2xa+jtu6A5Bk=";
      };
    };
  });
  meta = {
    description = "Keyboard Teleoperation";
  };
})
