{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  pluginlib,
  qt-gui,
  qt-gui-cpp,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rqt_gui_cpp";
  version = "1.1.9-1";
  src = finalAttrs.passthru.sources."rqt_gui_cpp";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ pluginlib qt-gui qt-gui-cpp rclcpp ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "qtbase5-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ pluginlib qt-gui qt-gui-cpp rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "qtbase5-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rqt_gui_cpp" = substituteSource {
      src = fetchgit {
        name = "rqt_gui_cpp-source";
        url = "https://github.com/ros2-gbp/rqt-release.git";
        rev = "de8eb5bc886ca20b1ec7d01693b6ffb8a4b3d41b";
        hash = "sha256-vnx6M5kqtK5belF811ZRSe2yuk78fGZHlxhfP2JTr7k=";
      };
    };
  });
  meta = {
    description = "rqt_gui_cpp enables GUI plugins to use the C++ client library for ROS.";
  };
})
