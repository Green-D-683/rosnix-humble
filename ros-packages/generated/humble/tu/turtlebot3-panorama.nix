{
  ament-cmake,
  buildAmentCmakePackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  image-transport,
  mkSourceSet,
  nav-msgs,
  rclcpp,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  tf2,
  tf2-geometry-msgs,
  turtlebot3-applications-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "turtlebot3_panorama";
  version = "1.3.3-2";
  src = finalAttrs.passthru.sources."turtlebot3_panorama";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ cv-bridge geometry-msgs image-transport nav-msgs rclcpp sensor-msgs tf2 tf2-geometry-msgs turtlebot3-applications-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libboost-system-dev" "libopencv-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ cv-bridge geometry-msgs image-transport nav-msgs rclcpp sensor-msgs tf2 tf2-geometry-msgs turtlebot3-applications-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libboost-system-dev" "libopencv-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "turtlebot3_panorama" = substituteSource {
      src = fetchgit {
        name = "turtlebot3_panorama-source";
        url = "https://github.com/ros2-gbp/turtlebot3_applications-release.git";
        rev = "b7994b5861a054775e6e81c12b4d2ccdc8b13c37";
        hash = "sha256-oXpFjyMOQ7oARApUTiu62bze33ACeLUtRL20xdtL2rs=";
      };
    };
  });
  meta = {
    description = "\n	  Package for turtlebot3 panorama.\n  ";
  };
})
