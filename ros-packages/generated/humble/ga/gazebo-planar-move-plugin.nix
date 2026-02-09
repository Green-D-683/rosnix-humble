{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gazebo-dev,
  gazebo-ros,
  geometry-msgs,
  launch-testing-ament-cmake,
  mkSourceSet,
  nav-msgs,
  rclcpp,
  robot-state-publisher,
  ros2launch,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  tf2-geometry-msgs,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "gazebo_planar_move_plugin";
  version = "1.0.2-1";
  src = finalAttrs.passthru.sources."gazebo_planar_move_plugin";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ gazebo-dev gazebo-ros geometry-msgs nav-msgs rclcpp sensor-msgs tf2-geometry-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "boost" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ gazebo-dev gazebo-ros geometry-msgs nav-msgs rclcpp sensor-msgs tf2-geometry-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" ]; };
  checkInputs = [ launch-testing-ament-cmake robot-state-publisher ros2launch ];
  passthru.sources = mkSourceSet (sources: {
    "gazebo_planar_move_plugin" = substituteSource {
      src = fetchgit {
        name = "gazebo_planar_move_plugin-source";
        url = "https://github.com/ros2-gbp/gazebo_planar_move_plugin-release.git";
        rev = "ac085156b2eb749d0f0e771d7f0d3c36abb2492f";
        hash = "sha256-yRmP/kg25x7GTVueWKKQ5hQPD1yt50pJMVSh9MBRuLo=";
      };
    };
  });
  meta = {
    description = "Planar move of objects in gazebo";
  };
})
