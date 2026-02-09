{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gazebo-dev,
  gazebo-msgs,
  gazebo-plugins,
  gazebo-ros,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "gazebo_ros_pkgs";
  version = "3.9.0-1";
  src = finalAttrs.passthru.sources."gazebo_ros_pkgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ gazebo-dev gazebo-msgs gazebo-plugins gazebo-ros ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ gazebo-dev gazebo-msgs gazebo-plugins gazebo-ros ];
  passthru.sources = mkSourceSet (sources: {
    "gazebo_ros_pkgs" = substituteSource {
      src = fetchgit {
        name = "gazebo_ros_pkgs-source";
        url = "https://github.com/ros2-gbp/gazebo_ros_pkgs-release.git";
        rev = "9fb7ae556416e841320c2f59ff05f13889e880cf";
        hash = "sha256-geypp4Z+qTIjEll9AzHKJIe56RiUCTfODjL/RbdsY+0=";
      };
    };
  });
  meta = {
    description = "Interface for using ROS with the ";
  };
})
