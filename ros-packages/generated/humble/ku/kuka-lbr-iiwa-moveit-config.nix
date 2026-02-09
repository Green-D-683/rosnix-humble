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
  pname = "kuka_lbr_iiwa_moveit_config";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."kuka_lbr_iiwa_moveit_config";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ controller-manager kuka-resources moveit moveit-planners robot-state-publisher rviz2 urdf xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ controller-manager kuka-resources moveit moveit-planners robot-state-publisher rviz2 urdf xacro ];
  passthru.sources = mkSourceSet (sources: {
    "kuka_lbr_iiwa_moveit_config" = substituteSource {
      src = fetchgit {
        name = "kuka_lbr_iiwa_moveit_config-source";
        url = "https://github.com/ros2-gbp/kuka_robot_descriptions-release.git";
        rev = "1ab09feb3d6f792f3c3b2b2041570d65a35e9e03";
        hash = "sha256-hTBXxvmkgMLdtDEKOMFnIUP7QCf3/G8mjiDh/jdTEQY=";
      };
    };
  });
  meta = {
    description = "Package containing moveit configurations for KUKA LBR iiwa family";
  };
})
