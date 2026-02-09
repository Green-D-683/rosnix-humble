{
  action-msgs,
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  behaviortree-cpp-v3,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  plansys2-executor,
  plansys2-msgs,
  rclcpp,
  rclcpp-action,
  rclcpp-lifecycle,
  rosSystemPackages,
  substituteSource,
  test-msgs,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "plansys2_bt_actions";
  version = "2.0.9-1";
  src = finalAttrs.passthru.sources."plansys2_bt_actions";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ action-msgs behaviortree-cpp-v3 plansys2-executor rclcpp rclcpp-action rclcpp-lifecycle ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libzmq3-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ action-msgs behaviortree-cpp-v3 plansys2-executor rclcpp rclcpp-action rclcpp-lifecycle ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libzmq3-dev" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common geometry-msgs plansys2-msgs test-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "plansys2_bt_actions" = substituteSource {
      src = fetchgit {
        name = "plansys2_bt_actions-source";
        url = "https://github.com/IntelligentRoboticsLabs/ros2_planning_system-release.git";
        rev = "afca1ff03afef25d31bcdf113b5559f29f8b3ed4";
        hash = "sha256-sxx9toerSZCE/jtNwb63cMJHROjAiCAKUi6N377rDdo=";
      };
    };
  });
  meta = {
    description = "This package contains the Problem Expert module for the ROS2 Planning System";
  };
})
