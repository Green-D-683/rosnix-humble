{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gazebo-ros-pkgs,
  geometry-msgs,
  mkSourceSet,
  nav-msgs,
  rclcpp,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  tf2,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "turtlebot3_gazebo";
  version = "2.3.8-1";
  src = finalAttrs.passthru.sources."turtlebot3_gazebo";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ gazebo-ros-pkgs geometry-msgs nav-msgs rclcpp sensor-msgs tf2 ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ gazebo-ros-pkgs geometry-msgs nav-msgs rclcpp sensor-msgs tf2 ];
  passthru.sources = mkSourceSet (sources: {
    "turtlebot3_gazebo" = substituteSource {
      src = fetchgit {
        name = "turtlebot3_gazebo-source";
        url = "https://github.com/ros2-gbp/turtlebot3_simulations-release.git";
        rev = "7e51a7d7b4c0ca14e40dda0b413fcc3e650ace3a";
        hash = "sha256-X0j++4eXZoSHn5wyDro6Q744zVtoGfSuC+7S5zWWO8I=";
      };
    };
  });
  meta = {
    description = "\n    Gazebo simulation package for the TurtleBot3\n  ";
  };
})
