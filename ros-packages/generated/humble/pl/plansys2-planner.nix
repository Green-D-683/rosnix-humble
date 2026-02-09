{
  ament-cmake,
  ament-cmake-gtest,
  ament-index-cpp,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  lifecycle-msgs,
  mkSourceSet,
  plansys2-core,
  plansys2-domain-expert,
  plansys2-msgs,
  plansys2-pddl-parser,
  plansys2-popf-plan-solver,
  plansys2-problem-expert,
  pluginlib,
  rclcpp,
  rclcpp-action,
  rclcpp-lifecycle,
  ros2run,
  rosSystemPackages,
  std-msgs,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "plansys2_planner";
  version = "2.0.9-1";
  src = finalAttrs.passthru.sources."plansys2_planner";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament-index-cpp lifecycle-msgs plansys2-core plansys2-domain-expert plansys2-msgs plansys2-pddl-parser plansys2-popf-plan-solver plansys2-problem-expert pluginlib rclcpp rclcpp-action rclcpp-lifecycle std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-index-cpp lifecycle-msgs plansys2-core plansys2-domain-expert plansys2-msgs plansys2-pddl-parser plansys2-popf-plan-solver plansys2-problem-expert pluginlib rclcpp rclcpp-action rclcpp-lifecycle std-msgs ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ros2run ];
  passthru.sources = mkSourceSet (sources: {
    "plansys2_planner" = substituteSource {
      src = fetchgit {
        name = "plansys2_planner-source";
        url = "https://github.com/IntelligentRoboticsLabs/ros2_planning_system-release.git";
        rev = "e4dc0e3b25f8212be3dcf7cc52a0cb8979b9f898";
        hash = "sha256-/MFdbCG+U9shPC5/IipaM6Cn44x4PvsuaLcthGMA/1w=";
      };
    };
  });
  meta = {
    description = "This package contains the PDDL-based Planner module for the ROS2 Planning System";
  };
})
