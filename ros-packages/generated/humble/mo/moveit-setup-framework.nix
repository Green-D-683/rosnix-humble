{
  ament-clang-format,
  ament-cmake,
  ament-cmake-lint-cmake,
  ament-cmake-xmllint,
  ament-index-cpp,
  ament-lint-auto,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  moveit-common,
  moveit-core,
  moveit-ros-planning,
  moveit-ros-visualization,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  rviz-common,
  rviz-rendering,
  srdfdom,
  substituteSource,
  urdf,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "moveit_setup_framework";
  version = "2.5.9-1";
  src = finalAttrs.passthru.sources."moveit_setup_framework";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament-index-cpp moveit-common moveit-core moveit-ros-planning moveit-ros-visualization pluginlib rclcpp rviz-common rviz-rendering srdfdom urdf ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-index-cpp moveit-common moveit-core moveit-ros-planning moveit-ros-visualization pluginlib rclcpp rviz-common rviz-rendering srdfdom urdf ];
  checkInputs = [ ament-clang-format ament-cmake-lint-cmake ament-cmake-xmllint ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_setup_framework" = substituteSource {
      src = fetchgit {
        name = "moveit_setup_framework-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "2c0c60610469ad075508005322b6e3c96d1acde1";
        hash = "sha256-2+DDpf882tV//MMcYYAPTAa3LCvnXD7Z5CSy6JHKCpg=";
      };
    };
  });
  meta = {
    description = "C++ Interface for defining setup steps for MoveIt Setup Assistant";
  };
})
