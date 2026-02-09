{
  ament-cmake,
  ament-cmake-cpplint,
  ament-cmake-flake8,
  ament-cmake-gtest,
  ament-cmake-uncrustify,
  ament-lint-auto,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  interactive-markers,
  launch,
  launch-testing,
  message-filters,
  mkSourceSet,
  nav-msgs,
  nav2-map-server,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  rosidl-default-generators,
  rviz-common,
  rviz-default-plugins,
  rviz-ogre-vendor,
  rviz-rendering,
  sensor-msgs,
  std-msgs,
  std-srvs,
  substituteSource,
  tf2,
  tf2-geometry-msgs,
  tf2-ros,
  tf2-sensor-msgs,
  visualization-msgs,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "slam_toolbox";
  version = "2.6.10-1";
  src = finalAttrs.passthru.sources."slam_toolbox";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ builtin-interfaces interactive-markers message-filters nav2-map-server nav-msgs pluginlib rclcpp rosidl-default-generators rviz-common rviz-default-plugins rviz-ogre-vendor rviz-rendering sensor-msgs std-msgs std-srvs tf2 tf2-geometry-msgs tf2-ros tf2-sensor-msgs visualization-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "boost" "eigen" "libceres-dev" "liblapack-dev" "libqt5-core" "libqt5-gui" "libqt5-opengl" "libqt5-widgets" "qtbase5-dev" "suitesparse" "tbb" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ builtin-interfaces interactive-markers message-filters nav2-map-server nav-msgs pluginlib rclcpp rosidl-default-generators rviz-common rviz-default-plugins rviz-ogre-vendor rviz-rendering sensor-msgs std-msgs std-srvs tf2 tf2-geometry-msgs tf2-ros tf2-sensor-msgs visualization-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" "eigen" "libceres-dev" "liblapack-dev" "libqt5-core" "libqt5-gui" "libqt5-opengl" "libqt5-widgets" "qtbase5-dev" "suitesparse" "tbb" ]; };
  checkInputs = [ ament-cmake-cpplint ament-cmake-flake8 ament-cmake-gtest ament-cmake-uncrustify ament-lint-auto launch launch-testing ];
  passthru.sources = mkSourceSet (sources: {
    "slam_toolbox" = substituteSource {
      src = fetchgit {
        name = "slam_toolbox-source";
        url = "https://github.com/SteveMacenski/slam_toolbox-release.git";
        rev = "33c9f5a3ca94daa8b34c5bfb2a275a3036cc2079";
        hash = "sha256-q3p7uDpTZvepvUmBtOu2YrC8TAXXIm+oWmkiN6IH/1s=";
      };
    };
  });
  meta = {
    description = "\n     This package provides a sped up improved slam karto with updated SDK and visualization and modification toolsets\n  ";
  };
})
