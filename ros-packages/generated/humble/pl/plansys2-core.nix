{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  plansys2-msgs,
  plansys2-pddl-parser,
  pluginlib,
  rclcpp,
  rclcpp-lifecycle,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "plansys2_core";
  version = "2.0.9-1";
  src = finalAttrs.passthru.sources."plansys2_core";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ plansys2-msgs plansys2-pddl-parser pluginlib rclcpp rclcpp-lifecycle ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ plansys2-msgs plansys2-pddl-parser pluginlib rclcpp rclcpp-lifecycle ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "plansys2_core" = substituteSource {
      src = fetchgit {
        name = "plansys2_core-source";
        url = "https://github.com/IntelligentRoboticsLabs/ros2_planning_system-release.git";
        rev = "73b7917736941f7ee2e61c9511e33c6980b3ae3e";
        hash = "sha256-oy9zs0MjcQ6svbFOZgZNi7HHX5YbMy9PC0TikcBITtM=";
      };
    };
  });
  meta = {
    description = "This package contains the PDDL-based core  for the ROS2 Planning System";
  };
})
