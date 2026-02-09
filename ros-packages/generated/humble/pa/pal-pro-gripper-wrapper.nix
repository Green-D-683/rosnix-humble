{
  ament-cmake-python,
  ament-copyright,
  ament-flake8,
  ament-lint-auto,
  ament-lint-common,
  ament-pep257,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  trajectory-msgs,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "pal_pro_gripper_wrapper";
  version = "1.8.0-1";
  src = finalAttrs.passthru.sources."pal_pro_gripper_wrapper";
  nativeBuildInputs = [ ament-cmake-python ];
  propagatedNativeBuildInputs = [ rclpy sensor-msgs trajectory-msgs ];
  buildInputs = [ ament-cmake-python ];
  propagatedBuildInputs = [ rclpy sensor-msgs trajectory-msgs ];
  checkInputs = [ ament-copyright ament-flake8 ament-lint-auto ament-lint-common ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "pal_pro_gripper_wrapper" = substituteSource {
      src = fetchgit {
        name = "pal_pro_gripper_wrapper-source";
        url = "https://github.com/ros2-gbp/pal_pro_gripper-release.git";
        rev = "5ee33139512c9e8a8e015b87dc5dc31826ee2707";
        hash = "sha256-hb6um1BkHMvWiwiEtk9avsF+X3OdJFlNHJ1kVlu4dVI=";
      };
    };
  });
  meta = {
    description = "Grasp controller to close with a determined error on position only\n    so to skip overheating.";
  };
})
