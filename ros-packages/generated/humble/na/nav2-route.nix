{
  ament-cmake,
  ament-cmake-gtest,
  ament-cmake-pytest,
  ament-lint-auto,
  ament-lint-common,
  angles,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  launch,
  launch-testing,
  mkSourceSet,
  nav-msgs,
  nav2-common,
  nav2-core,
  nav2-costmap-2d,
  nav2-msgs,
  nav2-util,
  pluginlib,
  rclcpp,
  rclcpp-lifecycle,
  rosSystemPackages,
  std-msgs,
  substituteSource,
  tf2-ros,
  visualization-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nav2_route";
  version = "1.1.20-1";
  src = finalAttrs.passthru.sources."nav2_route";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ angles geometry-msgs nav2-common nav2-core nav2-costmap-2d nav2-msgs nav2-util nav-msgs pluginlib rclcpp rclcpp-lifecycle std-msgs tf2-ros visualization-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libnanoflann-dev" "nlohmann-json-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ angles geometry-msgs nav2-common nav2-core nav2-costmap-2d nav2-msgs nav2-util nav-msgs pluginlib rclcpp rclcpp-lifecycle std-msgs tf2-ros visualization-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libnanoflann-dev" "nlohmann-json-dev" ]; };
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common launch launch-testing ];
  passthru.sources = mkSourceSet (sources: {
    "nav2_route" = substituteSource {
      src = fetchgit {
        name = "nav2_route-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "45b2e5150f418425960f0136eb7bf991db797ede";
        hash = "sha256-8cJzoPyB8Yxh7WWfGE5VF1+UEKxiClLXSOu7a64d2+0=";
      };
    };
  });
  meta = {
    description = "A Route Graph planner to compliment the Planner Server";
  };
})
