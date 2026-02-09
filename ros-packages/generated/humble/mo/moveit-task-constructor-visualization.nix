{
  ament-cmake,
  ament-cmake-gmock,
  ament-cmake-gtest,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch-testing,
  launch-testing-ament-cmake,
  launch-testing-ros,
  mkSourceSet,
  moveit-core,
  moveit-ros-visualization,
  moveit-task-constructor-core,
  moveit-task-constructor-msgs,
  rclcpp,
  rosSystemPackages,
  rviz2,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "moveit_task_constructor_visualization";
  version = "0.1.3-1";
  src = finalAttrs.passthru.sources."moveit_task_constructor_visualization";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ moveit-core moveit-ros-visualization moveit-task-constructor-core moveit-task-constructor-msgs rclcpp rviz2 ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "fmt" "qtbase5-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ moveit-core moveit-ros-visualization moveit-task-constructor-core moveit-task-constructor-msgs rclcpp rviz2 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "fmt" "qtbase5-dev" ]; };
  checkInputs = [ ament-cmake-gmock ament-cmake-gtest launch launch-testing launch-testing-ament-cmake launch-testing-ros ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_task_constructor_visualization" = substituteSource {
      src = fetchgit {
        name = "moveit_task_constructor_visualization-source";
        url = "https://github.com/ros2-gbp/moveit_task_constructor-release.git";
        rev = "c14ba08d51f9819473ffd7a7af64a48d362f62a3";
        hash = "sha256-rlKy782t5IofhPb8CSb5Rwb2/0haADF2W7WrQQOrjKQ=";
      };
    };
  });
  meta = {
    description = "Visualization tools for MoveIt Task Pipeline";
  };
})
