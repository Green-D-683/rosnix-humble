{
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav-msgs,
  rclpy,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "turtlebot3_automatic_parking";
  version = "1.3.3-2";
  src = finalAttrs.passthru.sources."turtlebot3_automatic_parking";
  propagatedNativeBuildInputs = [ geometry-msgs nav-msgs rclpy sensor-msgs std-msgs ];
  propagatedBuildInputs = [ geometry-msgs nav-msgs rclpy sensor-msgs std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "turtlebot3_automatic_parking" = substituteSource {
      src = fetchgit {
        name = "turtlebot3_automatic_parking-source";
        url = "https://github.com/ros2-gbp/turtlebot3_applications-release.git";
        rev = "ed1259d6bdadfd40bdd5c68923887ce93909c4d5";
        hash = "sha256-GHkOyAeN+JYYicmvpjBl/1t3dXZTxi+CsHpiGKsP86s=";
      };
    };
  });
  meta = {
    description = "\n	  Package for turtlebot3 automatic_parking.\n  ";
  };
})
