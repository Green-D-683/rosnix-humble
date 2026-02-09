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
  rclcpp,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "plansys2_pddl_parser";
  version = "2.0.9-1";
  src = finalAttrs.passthru.sources."plansys2_pddl_parser";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ plansys2-msgs rclcpp std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ plansys2-msgs rclcpp std-msgs ];
  checkInputs = [ ament-cmake-gtest ament-index-cpp ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "plansys2_pddl_parser" = substituteSource {
      src = fetchgit {
        name = "plansys2_pddl_parser-source";
        url = "https://github.com/IntelligentRoboticsLabs/ros2_planning_system-release.git";
        rev = "e9d5dbb3a43f07dc0c8a3ee3bef897fd2af1e732";
        hash = "sha256-WSbBpX07RJIpUVgHbCi2stYDooxVmNKDmt2qHg3LBaQ=";
      };
    };
  });
  meta = {
    description = "This package contains a library for parsing PDDL domains and problems.\n  \n    This package derives from the work of Anders Jonsson, contained in https://github.com/wisdompoet/universal-pddl-parser.git\n    with many modifications by Francisco Martin:\n      * ROS2 packaging\n      * Source code structure refactor\n      * CMakeLists.txt for cmake compilation\n      * Reading from String instead of files\n      * Licensing\n  ";
  };
})
