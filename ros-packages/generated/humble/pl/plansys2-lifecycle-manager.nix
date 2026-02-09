{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  lifecycle-msgs,
  mkSourceSet,
  rclcpp,
  rclcpp-lifecycle,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "plansys2_lifecycle_manager";
  version = "2.0.9-1";
  src = finalAttrs.passthru.sources."plansys2_lifecycle_manager";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ lifecycle-msgs rclcpp rclcpp-lifecycle ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ lifecycle-msgs rclcpp rclcpp-lifecycle ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "plansys2_lifecycle_manager" = substituteSource {
      src = fetchgit {
        name = "plansys2_lifecycle_manager-source";
        url = "https://github.com/IntelligentRoboticsLabs/ros2_planning_system-release.git";
        rev = "88aae5f03468c270e86ad374ba757ec6d1e7de19";
        hash = "sha256-iFKlj4o36CrEDrkvpL1zGUSMIQMu53oC3ea34NGHeX4=";
      };
    };
  });
  meta = {
    description = "A controller/manager for the lifecycle nodes of the ROS2 Planning System";
  };
})
