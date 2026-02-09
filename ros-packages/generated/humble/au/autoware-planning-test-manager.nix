{
  ament-cmake-auto,
  ament-cmake-ros,
  ament-lint-auto,
  autoware-cmake,
  autoware-component-interface-specs,
  autoware-lint-common,
  autoware-motion-utils,
  autoware-planning-msgs,
  autoware-test-utils,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  nav-msgs,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  tf2-msgs,
  tf2-ros,
  unique-identifier-msgs,
  yaml-cpp-vendor,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_planning_test_manager";
  version = "1.4.0-1";
  src = finalAttrs.passthru.sources."autoware_planning_test_manager";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ autoware-component-interface-specs autoware-motion-utils autoware-planning-msgs autoware-test-utils nav-msgs rclcpp tf2-msgs tf2-ros unique-identifier-msgs yaml-cpp-vendor ];
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ autoware-component-interface-specs autoware-motion-utils autoware-planning-msgs autoware-test-utils nav-msgs rclcpp tf2-msgs tf2-ros unique-identifier-msgs yaml-cpp-vendor ];
  checkInputs = [ ament-cmake-ros ament-lint-auto autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_planning_test_manager" = substituteSource {
      src = fetchgit {
        name = "autoware_planning_test_manager-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "064c0f63501933951ff259a8e992438e21ef8b88";
        hash = "sha256-HSgG0szY+1Y8zVve00t9Gi6U2562nTy24Hme6ItxKAs=";
      };
    };
  });
  meta = {
    description = "ROS 2 node for testing interface of the nodes in planning module";
  };
})
