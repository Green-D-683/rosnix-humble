{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rclcpp,
  roadmap-explorer-msgs,
  ros-environment,
  rosSystemPackages,
  rviz-common,
  rviz-rendering,
  sensor-msgs,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "roadmap_explorer_rviz_plugins";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."roadmap_explorer_rviz_plugins";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ geometry-msgs rclcpp roadmap-explorer-msgs ros-environment rviz-common rviz-rendering sensor-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libqt5-core" "libqt5-gui" "libqt5-widgets" "qtbase5-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs rclcpp roadmap-explorer-msgs ros-environment rviz-common rviz-rendering sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libqt5-core" "libqt5-gui" "libqt5-widgets" "qtbase5-dev" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "roadmap_explorer_rviz_plugins" = substituteSource {
      src = fetchgit {
        name = "roadmap_explorer_rviz_plugins-source";
        url = "https://github.com/ros2-gbp/roadmap_explorer-release.git";
        rev = "794c822432f5d5929a03f77e0f4ae43b1a617e30";
        hash = "sha256-YGiFDKNZ0tmBP7Kcv2pqywGFTY93rDb2tUHdDKIywkQ=";
      };
    };
  });
  meta = {
    description = "A package that contains an RViz plugins for roadmap_explorer";
  };
})
