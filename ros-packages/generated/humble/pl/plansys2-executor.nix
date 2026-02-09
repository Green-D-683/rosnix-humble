{
  ament-cmake,
  ament-cmake-gtest,
  ament-index-cpp,
  ament-lint-auto,
  ament-lint-common,
  behaviortree-cpp-v3,
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
  plansys2-planner,
  plansys2-problem-expert,
  popf,
  rclcpp,
  rclcpp-action,
  rclcpp-cascade-lifecycle,
  rclcpp-lifecycle,
  rosSystemPackages,
  std-msgs,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "plansys2_executor";
  version = "2.0.9-1";
  src = finalAttrs.passthru.sources."plansys2_executor";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament-index-cpp behaviortree-cpp-v3 lifecycle-msgs plansys2-core plansys2-domain-expert plansys2-msgs plansys2-pddl-parser plansys2-planner plansys2-problem-expert popf rclcpp rclcpp-action rclcpp-cascade-lifecycle rclcpp-lifecycle std-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libzmq3-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-index-cpp behaviortree-cpp-v3 lifecycle-msgs plansys2-core plansys2-domain-expert plansys2-msgs plansys2-pddl-parser plansys2-planner plansys2-problem-expert popf rclcpp rclcpp-action rclcpp-cascade-lifecycle rclcpp-lifecycle std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libzmq3-dev" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "plansys2_executor" = substituteSource {
      src = fetchgit {
        name = "plansys2_executor-source";
        url = "https://github.com/IntelligentRoboticsLabs/ros2_planning_system-release.git";
        rev = "8322361513958237c53de9196f40d36f8be74198";
        hash = "sha256-PIXGUS56KSxVL/xAf8PCwz4A+UAK3BawEWcU5UM3A3s=";
      };
    };
  });
  meta = {
    description = "This package contains the Executor module for the ROS2 Planning System";
  };
})
