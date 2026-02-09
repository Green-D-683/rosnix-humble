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
  mkSourceSet,
  plansys2-msgs,
  plansys2-problem-expert,
  qt-gui-cpp,
  rclcpp,
  rclcpp-lifecycle,
  rosSystemPackages,
  rqt-gui,
  rqt-gui-cpp,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "plansys2_tools";
  version = "2.0.9-1";
  src = finalAttrs.passthru.sources."plansys2_tools";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ plansys2-msgs plansys2-problem-expert qt-gui-cpp rclcpp rclcpp-lifecycle rqt-gui rqt-gui-cpp ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "qtbase5-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ plansys2-msgs plansys2-problem-expert qt-gui-cpp rclcpp rclcpp-lifecycle rqt-gui rqt-gui-cpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "qtbase5-dev" ]; };
  checkInputs = [ ament-cmake-gtest ament-index-cpp ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "plansys2_tools" = substituteSource {
      src = fetchgit {
        name = "plansys2_tools-source";
        url = "https://github.com/IntelligentRoboticsLabs/ros2_planning_system-release.git";
        rev = "e84baa3a33414e1fde86682dd1eff35b0809fd60";
        hash = "sha256-1gwS2hf03VDOkmr6FhQ5m9Xqn+FpDwdzKMlhwC7vNZg=";
      };
    };
  });
  meta = {
    description = "A set of tools for monitoring ROS2 Planning System";
  };
})
