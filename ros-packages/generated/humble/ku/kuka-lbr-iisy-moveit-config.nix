{
  ament-cmake,
  buildAmentCmakePackage,
  controller-manager,
  fetchgit,
  fetchurl,
  fetchzip,
  kuka-resources,
  mkSourceSet,
  moveit,
  moveit-planners,
  robot-state-publisher,
  rosSystemPackages,
  rviz2,
  substituteSource,
  urdf,
  wrapRosQtAppsHook,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "kuka_lbr_iisy_moveit_config";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."kuka_lbr_iisy_moveit_config";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ controller-manager kuka-resources moveit moveit-planners robot-state-publisher rviz2 urdf xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ controller-manager kuka-resources moveit moveit-planners robot-state-publisher rviz2 urdf xacro ];
  passthru.sources = mkSourceSet (sources: {
    "kuka_lbr_iisy_moveit_config" = substituteSource {
      src = fetchgit {
        name = "kuka_lbr_iisy_moveit_config-source";
        url = "https://github.com/ros2-gbp/kuka_robot_descriptions-release.git";
        rev = "d10265b0b457861920036f07cd3adbc27dd06b3f";
        hash = "sha256-0jZqSYgcV5kZsedQZp07+XCZ8WuPrK54tSXdZJz7/PY=";
      };
    };
  });
  meta = {
    description = "Package containing moveit configurations for KUKA LBR iisy family";
  };
})
