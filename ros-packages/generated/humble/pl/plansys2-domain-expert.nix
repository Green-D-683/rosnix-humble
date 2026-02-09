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
  plansys2-core,
  plansys2-msgs,
  plansys2-pddl-parser,
  plansys2-popf-plan-solver,
  rclcpp,
  rclcpp-action,
  rclcpp-lifecycle,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "plansys2_domain_expert";
  version = "2.0.9-1";
  src = finalAttrs.passthru.sources."plansys2_domain_expert";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-index-cpp lifecycle-msgs plansys2-core plansys2-msgs plansys2-pddl-parser plansys2-popf-plan-solver rclcpp rclcpp-action rclcpp-lifecycle std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-index-cpp lifecycle-msgs plansys2-core plansys2-msgs plansys2-pddl-parser plansys2-popf-plan-solver rclcpp rclcpp-action rclcpp-lifecycle std-msgs ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "plansys2_domain_expert" = substituteSource {
      src = fetchgit {
        name = "plansys2_domain_expert-source";
        url = "https://github.com/IntelligentRoboticsLabs/ros2_planning_system-release.git";
        rev = "544bb45457b3ca06a0cfb4e088320f6f7e2dfa50";
        hash = "sha256-3hFJ0/KeAou4FCpsxO5jeiissA+fPNGMbGhQGGWuoLE=";
      };
    };
  });
  meta = {
    description = "This package contains the Domain Expert module for the ROS2 Planning System";
  };
})
