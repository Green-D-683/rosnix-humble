{
  ament-cmake,
  ament-cmake-gtest,
  ament-cmake-pytest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gazebo-ros-pkgs,
  geometry-msgs,
  launch,
  launch-ros,
  launch-testing,
  mkSourceSet,
  nav-msgs,
  nav2-amcl,
  nav2-behavior-tree,
  nav2-bringup,
  nav2-common,
  nav2-lifecycle-manager,
  nav2-map-server,
  nav2-msgs,
  nav2-navfn-planner,
  nav2-planner,
  nav2-util,
  navigation2,
  rclcpp,
  rclpy,
  robot-state-publisher,
  rosSystemPackages,
  std-msgs,
  substituteSource,
  tf2-geometry-msgs,
  visualization-msgs,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nav2_system_tests";
  version = "1.1.20-1";
  src = finalAttrs.passthru.sources."nav2_system_tests";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ gazebo-ros-pkgs geometry-msgs launch-ros launch-testing nav2-amcl nav2-behavior-tree nav2-bringup nav2-common nav2-lifecycle-manager nav2-map-server nav2-msgs nav2-navfn-planner nav2-planner nav2-util nav-msgs navigation2 rclcpp rclpy robot-state-publisher std-msgs tf2-geometry-msgs visualization-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "lcov" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ gazebo-ros-pkgs geometry-msgs launch-ros launch-testing nav2-amcl nav2-behavior-tree nav2-bringup nav2-common nav2-lifecycle-manager nav2-map-server nav2-msgs nav2-navfn-planner nav2-planner nav2-util nav-msgs navigation2 rclcpp rclpy robot-state-publisher std-msgs tf2-geometry-msgs visualization-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "lcov" ]; };
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common launch launch-ros launch-testing ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-zmq" ]; };
  passthru.sources = mkSourceSet (sources: {
    "nav2_system_tests" = substituteSource {
      src = fetchgit {
        name = "nav2_system_tests-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "5d91ff6d54514f9138174ecfa089476120f5942f";
        hash = "sha256-FZoyPRqA0CiQHA9UysYmg+MsJvURoQmjEwjypjH0bww=";
      };
    };
  });
  meta = {
    description = "TODO";
  };
})
