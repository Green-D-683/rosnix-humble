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
  pname = "kuka_kr_moveit_config";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."kuka_kr_moveit_config";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ controller-manager kuka-resources moveit moveit-planners robot-state-publisher rviz2 urdf xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ controller-manager kuka-resources moveit moveit-planners robot-state-publisher rviz2 urdf xacro ];
  passthru.sources = mkSourceSet (sources: {
    "kuka_kr_moveit_config" = substituteSource {
      src = fetchgit {
        name = "kuka_kr_moveit_config-source";
        url = "https://github.com/ros2-gbp/kuka_robot_descriptions-release.git";
        rev = "10e22994cd30a84ada61241443ecbcd575c23f27";
        hash = "sha256-jSmVLB0DlrX92FNc52JbXu5gg8vRvFAegKbyJJbgjII=";
      };
    };
  });
  meta = {
    description = "Package containing moveit configurations for KUKA LBR iiwa family";
  };
})
