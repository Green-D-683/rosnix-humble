{
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
  pname = "urdfdom_py";
  version = "1.2.1-1";
  src = finalAttrs.passthru.sources."urdfdom_py";
  propagatedNativeBuildInputs = [ rclpy ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-lxml" "python3-yaml" ]; };
  propagatedBuildInputs = [ rclpy ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-lxml" "python3-yaml" ]; };
  passthru.sources = mkSourceSet (sources: {
    "urdfdom_py" = substituteSource {
      src = fetchgit {
        name = "urdfdom_py-source";
        url = "https://github.com/ros2-gbp/urdfdom_py-release.git";
        rev = "80affbcf93bda40bc12a0d0cbf85d12e9095e5db";
        hash = "sha256-XIQzb/e4G8nvo/oqr/BKyEWW1LAFi2kvQhIdXhJHG+Q=";
      };
    };
  });
  meta = {
    description = "Python implementation of the URDF parser.";
  };
})
