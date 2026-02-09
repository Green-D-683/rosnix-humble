{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  moveit-common,
  moveit-core,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  trajectory-msgs,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "chomp_motion_planner";
  version = "2.5.9-1";
  src = finalAttrs.passthru.sources."chomp_motion_planner";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ moveit-common moveit-core rclcpp trajectory-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ moveit-common moveit-core rclcpp trajectory-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "chomp_motion_planner" = substituteSource {
      src = fetchgit {
        name = "chomp_motion_planner-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "33cf5da5fe5635ee3705895bbaf2631676e28ebb";
        hash = "sha256-8x5V3ME5BuVwOetoYzienwJ7+m+r/NJm9QGSegLALWM=";
      };
    };
  });
  meta = {
    description = "chomp_motion_planner";
  };
})
