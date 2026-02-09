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
  plansys2-domain-expert,
  plansys2-executor,
  plansys2-msgs,
  plansys2-pddl-parser,
  plansys2-planner,
  plansys2-problem-expert,
  rclcpp,
  rclcpp-action,
  rclcpp-lifecycle,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "plansys2_terminal";
  version = "2.0.9-1";
  src = finalAttrs.passthru.sources."plansys2_terminal";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ plansys2-domain-expert plansys2-executor plansys2-msgs plansys2-pddl-parser plansys2-planner plansys2-problem-expert rclcpp rclcpp-action rclcpp-lifecycle ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libreadline" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ plansys2-domain-expert plansys2-executor plansys2-msgs plansys2-pddl-parser plansys2-planner plansys2-problem-expert rclcpp rclcpp-action rclcpp-lifecycle ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libreadline" ]; };
  checkInputs = [ ament-cmake-gtest ament-index-cpp ament-lint-auto ament-lint-common lifecycle-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "plansys2_terminal" = substituteSource {
      src = fetchgit {
        name = "plansys2_terminal-source";
        url = "https://github.com/IntelligentRoboticsLabs/ros2_planning_system-release.git";
        rev = "81382ac50fdef209c211c1e18fbb1d512d8a2217";
        hash = "sha256-7doouNzL80UICDY7j2Ly9WNyaY3Zk2VU9Pp/FGT6CoE=";
      };
    };
  });
  meta = {
    description = "A terminal tool for monitor and manage the ROS2 Planning System";
  };
})
