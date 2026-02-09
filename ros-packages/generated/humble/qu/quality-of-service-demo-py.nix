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
  pname = "quality_of_service_demo_py";
  version = "0.20.8-1";
  src = finalAttrs.passthru.sources."quality_of_service_demo_py";
  propagatedNativeBuildInputs = [ rclpy std-msgs ];
  propagatedBuildInputs = [ rclpy std-msgs ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "quality_of_service_demo_py" = substituteSource {
      src = fetchgit {
        name = "quality_of_service_demo_py-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "33cef7733804ae2f68c287ddadb99aa7c871013b";
        hash = "sha256-ddbzV0qChuhHN3Jf9mJ5hzotOOSI0+6VY9KrOKKeAYs=";
      };
    };
  });
  meta = {
    description = "Python Demo applications for Quality of Service features";
  };
})
