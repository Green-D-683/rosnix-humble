{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "gazebo_dev";
  version = "3.9.0-1";
  src = finalAttrs.passthru.sources."gazebo_dev";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "gazebo11" "libgazebo11-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "gazebo11" "libgazebo11-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "gazebo_dev" = substituteSource {
      src = fetchgit {
        name = "gazebo_dev-source";
        url = "https://github.com/ros2-gbp/gazebo_ros_pkgs-release.git";
        rev = "2bc3a3fb269561123bc25feb2dc2f84c363858bb";
        hash = "sha256-e/nNnu0jFfPGZh+hNgG5L/LCQqhIkbA1taZhU90f73Q=";
      };
    };
  });
  meta = {
    description = "\n    Provides a cmake config for the default version of Gazebo for the ROS distribution.\n  ";
  };
})
