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
  splsm-8-conversion,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "r2r_spl_8";
  version = "2.1.0-1";
  src = finalAttrs.passthru.sources."r2r_spl_8";
  propagatedNativeBuildInputs = [ rclpy splsm-8-conversion ];
  propagatedBuildInputs = [ rclpy splsm-8-conversion ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "r2r_spl_8" = substituteSource {
      src = fetchgit {
        name = "r2r_spl_8-source";
        url = "https://github.com/ros2-gbp/r2r_spl-release.git";
        rev = "e12a8ebc320c23340a7f8b8e17def9cf9b741447";
        hash = "sha256-e8OpqJ2Rwci2mKW+H9SWoUnOyPpZzRmprV6QdMUekWE=";
      };
    };
  });
  meta = {
    description = "Robot-To-Robot communication in RoboCup SPL";
  };
})
