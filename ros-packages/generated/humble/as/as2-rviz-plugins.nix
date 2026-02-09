{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  as2-core,
  as2-motion-reference-handlers,
  as2-msgs,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  rviz-common,
  rviz-rendering,
  sensor-msgs,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "as2_rviz_plugins";
  version = "1.1.3-1";
  src = finalAttrs.passthru.sources."as2_rviz_plugins";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ as2-core as2-motion-reference-handlers as2-msgs geometry-msgs rclcpp rviz-common rviz-rendering sensor-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libqt5-core" "libqt5-gui" "libqt5-widgets" "qtbase5-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ as2-core as2-motion-reference-handlers as2-msgs geometry-msgs rclcpp rviz-common rviz-rendering sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libqt5-core" "libqt5-gui" "libqt5-widgets" "qtbase5-dev" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "as2_rviz_plugins" = substituteSource {
      src = fetchgit {
        name = "as2_rviz_plugins-source";
        url = "https://github.com/ros2-gbp/aerostack2-release.git";
        rev = "a8024d471da5f6f42e9ec40bb98aecb13d3e903d";
        hash = "sha256-M0+rOsKngm9FsiSz2a4Mv4FCSeH85l9Hj+cOf2r9ME0=";
      };
    };
  });
  meta = {
    description = "A very simple plugin for RViz.";
  };
})
