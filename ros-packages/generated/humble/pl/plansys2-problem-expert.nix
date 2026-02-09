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
  plansys2-msgs,
  plansys2-pddl-parser,
  rclcpp,
  rclcpp-action,
  rclcpp-lifecycle,
  rosSystemPackages,
  std-msgs,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "plansys2_problem_expert";
  version = "2.0.9-1";
  src = finalAttrs.passthru.sources."plansys2_problem_expert";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament-index-cpp lifecycle-msgs plansys2-domain-expert plansys2-msgs plansys2-pddl-parser rclcpp rclcpp-action rclcpp-lifecycle std-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libqt5-core" "libqt5-gui" "libqt5-widgets" "qtbase5-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-index-cpp lifecycle-msgs plansys2-domain-expert plansys2-msgs plansys2-pddl-parser rclcpp rclcpp-action rclcpp-lifecycle std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libqt5-core" "libqt5-gui" "libqt5-widgets" "qtbase5-dev" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "plansys2_problem_expert" = substituteSource {
      src = fetchgit {
        name = "plansys2_problem_expert-source";
        url = "https://github.com/IntelligentRoboticsLabs/ros2_planning_system-release.git";
        rev = "31c3b1bf0d46de5b7988a7a1de3df1586cebf813";
        hash = "sha256-wqWvaR8zT85jowKvU6lzFURs4sSO9UUup/bePFu6/vA=";
      };
    };
  });
  meta = {
    description = "This package contains the Problem Expert module for the ROS2 Planning System";
  };
})
