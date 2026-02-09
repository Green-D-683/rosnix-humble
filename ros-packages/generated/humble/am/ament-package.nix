{
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "ament_package";
  version = "0.14.1-1";
  src = finalAttrs.passthru.sources."ament_package";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-importlib-metadata" "python3-importlib-resources" "python3-setuptools" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3-importlib-metadata" "python3-importlib-resources" "python3-setuptools" ]; };
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3-flake8" "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ament_package" = substituteSource {
      src = fetchgit {
        name = "ament_package-source";
        url = "https://github.com/ros2-gbp/ament_package-release.git";
        rev = "827cce4383e20c30e2774d32330762a29e7ab184";
        hash = "sha256-k6CgVNusAly2iBZUUHMlKv7U30Ho3hi3MgvwDjPqBLQ=";
      };
    };
  });
  meta = {
    description = "The parser for the manifest files in the ament buildsystem.";
  };
})
