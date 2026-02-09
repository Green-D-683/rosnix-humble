{
  ament-cmake,
  ament-cmake-python,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch-ros,
  mkSourceSet,
  moveit-kinematics,
  moveit-planners-ompl,
  moveit-ros-move-group,
  moveit-ros-visualization,
  moveit-servo,
  moveit-simple-controller-manager,
  rosSystemPackages,
  rviz2,
  substituteSource,
  ur-description,
  urdf,
  warehouse-ros-sqlite,
  wrapRosQtAppsHook,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ur_moveit_config";
  version = "2.12.0-1";
  src = finalAttrs.passthru.sources."ur_moveit_config";
  nativeBuildInputs = [ ament-cmake ament-cmake-python wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ launch launch-ros moveit-kinematics moveit-planners-ompl moveit-ros-move-group moveit-ros-visualization moveit-servo moveit-simple-controller-manager rviz2 ur-description urdf warehouse-ros-sqlite xacro ];
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ launch launch-ros moveit-kinematics moveit-planners-ompl moveit-ros-move-group moveit-ros-visualization moveit-servo moveit-simple-controller-manager rviz2 ur-description urdf warehouse-ros-sqlite xacro ];
  passthru.sources = mkSourceSet (sources: {
    "ur_moveit_config" = substituteSource {
      src = fetchgit {
        name = "ur_moveit_config-source";
        url = "https://github.com/ros2-gbp/Universal_Robots_ROS2_Driver-release.git";
        rev = "4c84f17347d832bf554165ba290afad7cc353982";
        hash = "sha256-qQcMV/li2QdweW1PrKfJfTTz6wJI+XcqGP6eSBUGozc=";
      };
    };
  });
  meta = {
    description = "\n     An example package with MoveIt2 configurations for UR robots.\n  ";
  };
})
