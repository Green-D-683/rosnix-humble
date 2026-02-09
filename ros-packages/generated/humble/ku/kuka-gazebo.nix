{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  controller-manager,
  fetchgit,
  fetchurl,
  fetchzip,
  gz-ros2-control,
  mkSourceSet,
  moveit-ros-planning-interface,
  moveit-visual-tools,
  robot-state-publisher,
  ros-gz-bridge,
  ros-gz-sim,
  rosSystemPackages,
  substituteSource,
  urdf,
  wrapRosQtAppsHook,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "kuka_gazebo";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."kuka_gazebo";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ controller-manager gz-ros2-control moveit-ros-planning-interface moveit-visual-tools robot-state-publisher ros-gz-bridge ros-gz-sim urdf xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ controller-manager gz-ros2-control moveit-ros-planning-interface moveit-visual-tools robot-state-publisher ros-gz-bridge ros-gz-sim urdf xacro ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "kuka_gazebo" = substituteSource {
      src = fetchgit {
        name = "kuka_gazebo-source";
        url = "https://github.com/ros2-gbp/kuka_robot_descriptions-release.git";
        rev = "c41d46c7aac017461281f95f0848f93134149acb";
        hash = "sha256-G95fCrlnvX/gl3bzlXSrIVbeHYO7qzfi9dP3Tu++yW4=";
      };
    };
  });
  meta = {
    description = "A helper package for Gazebo support with KUKA robots";
  };
})
