{
  ament-cmake,
  ament-cmake-python,
  buildAmentCmakePackage,
  controller-manager,
  fetchgit,
  fetchurl,
  fetchzip,
  gazebo-ros2-control,
  gripper-controllers,
  joint-state-broadcaster,
  joint-state-publisher,
  joint-trajectory-controller,
  kortex-description,
  kortex-driver,
  launch,
  launch-ros,
  mkSourceSet,
  rclpy,
  robotiq-description,
  rosSystemPackages,
  rviz2,
  substituteSource,
  urdf,
  wrapRosQtAppsHook,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "kortex_bringup";
  version = "0.2.3-1";
  src = finalAttrs.passthru.sources."kortex_bringup";
  nativeBuildInputs = [ ament-cmake ament-cmake-python wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ controller-manager gazebo-ros2-control gripper-controllers joint-state-broadcaster joint-state-publisher joint-trajectory-controller kortex-description kortex-driver launch launch-ros rclpy robotiq-description rviz2 urdf xacro ];
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ controller-manager gazebo-ros2-control gripper-controllers joint-state-broadcaster joint-state-publisher joint-trajectory-controller kortex-description kortex-driver launch launch-ros rclpy robotiq-description rviz2 urdf xacro ];
  passthru.sources = mkSourceSet (sources: {
    "kortex_bringup" = substituteSource {
      src = fetchgit {
        name = "kortex_bringup-source";
        url = "https://github.com/ros2-gbp/ros2_kortex-release.git";
        rev = "4cfa54883395f7444d1015586a6fbdf0367f94fe";
        hash = "sha256-tGLW4mvh4IGyXOqTQ2cqFj86wXUdj6yd2v3BoW8xZBQ=";
      };
    };
  });
  meta = {
    description = "Launch file and run-time configurations, e.g. controllers.";
  };
})
