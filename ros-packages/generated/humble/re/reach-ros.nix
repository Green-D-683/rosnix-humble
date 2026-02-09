{
  ament-cmake,
  ament-cmake-python,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  interactive-markers,
  joint-state-publisher,
  mkSourceSet,
  moveit-core,
  moveit-msgs,
  moveit-ros-planning-interface,
  reach,
  robot-state-publisher,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  tf2-eigen,
  visualization-msgs,
  wrapRosQtAppsHook,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "reach_ros";
  version = "1.4.0-1";
  src = finalAttrs.passthru.sources."reach_ros";
  nativeBuildInputs = [ ament-cmake ament-cmake-python wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ interactive-markers joint-state-publisher moveit-core moveit-msgs moveit-ros-planning-interface reach robot-state-publisher sensor-msgs tf2-eigen visualization-msgs xacro ];
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ interactive-markers joint-state-publisher moveit-core moveit-msgs moveit-ros-planning-interface reach robot-state-publisher sensor-msgs tf2-eigen visualization-msgs xacro ];
  passthru.sources = mkSourceSet (sources: {
    "reach_ros" = substituteSource {
      src = fetchgit {
        name = "reach_ros-source";
        url = "https://github.com/ros2-gbp/reach_ros2-release.git";
        rev = "2f39a8e1d313463e22dcf957b464888521c9ecbb";
        hash = "sha256-epVFA/T2c4S+kEWTcNBcTlLZP43z28ktxJgzsPgOQUY=";
      };
    };
  });
  meta = {
    description = "The reach_ros package";
  };
})
