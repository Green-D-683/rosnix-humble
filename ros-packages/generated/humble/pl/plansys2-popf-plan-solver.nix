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
  plansys2-core,
  pluginlib,
  popf,
  rclcpp,
  ros2run,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "plansys2_popf_plan_solver";
  version = "2.0.9-1";
  src = finalAttrs.passthru.sources."plansys2_popf_plan_solver";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-index-cpp plansys2-core pluginlib popf rclcpp ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-index-cpp plansys2-core pluginlib popf rclcpp ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ros2run ];
  passthru.sources = mkSourceSet (sources: {
    "plansys2_popf_plan_solver" = substituteSource {
      src = fetchgit {
        name = "plansys2_popf_plan_solver-source";
        url = "https://github.com/IntelligentRoboticsLabs/ros2_planning_system-release.git";
        rev = "a8e83668182da5ae95fbbc18e23b55dbed161c21";
        hash = "sha256-JNKrxUKjBX0T0F/FWBwomH8ZHSyZfCvo8iz3OTJ0nYw=";
      };
    };
  });
  meta = {
    description = "This package contains the PDDL-based Planner module for the ROS2 Planning System";
  };
})
