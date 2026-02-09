{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  andino-control,
  andino-description,
  buildAmentCmakePackage,
  control-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  gazebo-ros,
  gazebo-ros-pkgs,
  gazebo-ros2-control,
  mkSourceSet,
  robot-state-publisher,
  ros2launch,
  rosSystemPackages,
  rviz2,
  substituteSource,
  wrapRosQtAppsHook,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "andino_gz_classic";
  version = "0.2.0-1";
  src = finalAttrs.passthru.sources."andino_gz_classic";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ andino-control andino-description control-msgs gazebo-ros gazebo-ros2-control gazebo-ros-pkgs robot-state-publisher ros2launch rviz2 xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ andino-control andino-description control-msgs gazebo-ros gazebo-ros2-control gazebo-ros-pkgs robot-state-publisher ros2launch rviz2 xacro ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "andino_gz_classic" = substituteSource {
      src = fetchgit {
        name = "andino_gz_classic-source";
        url = "https://github.com/ros2-gbp/andino-release.git";
        rev = "0c01919d0df4bdd91341973bf463a05fe1d4d587";
        hash = "sha256-hkL+5usSeon/qS0kf34B8kIZeX95Im+zu8Rsy3KJeFo=";
      };
    };
  });
  meta = {
    description = "\n    Launch Gazebo simulation with Andino\n  ";
  };
})
