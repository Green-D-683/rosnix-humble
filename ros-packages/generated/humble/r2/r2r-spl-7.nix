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
  splsm-7-conversion,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "r2r_spl_7";
  version = "2.1.0-1";
  src = finalAttrs.passthru.sources."r2r_spl_7";
  propagatedNativeBuildInputs = [ rclpy splsm-7-conversion ];
  propagatedBuildInputs = [ rclpy splsm-7-conversion ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "r2r_spl_7" = substituteSource {
      src = fetchgit {
        name = "r2r_spl_7-source";
        url = "https://github.com/ros2-gbp/r2r_spl-release.git";
        rev = "d0ddd7090299e091b34b628d908e306c39e64769";
        hash = "sha256-PULIJQT9JZzidgOHXZQ+4TUWyn7QggX+Nb/ozhHxU9g=";
      };
    };
  });
  meta = {
    description = "Robot-To-Robot communication in RoboCup SPL using SPLSM V7";
  };
})
