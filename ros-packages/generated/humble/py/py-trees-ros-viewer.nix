{
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  py-trees-js,
  py-trees-ros-interfaces,
  rclpy,
  rosSystemPackages,
  substituteSource,
  unique-identifier-msgs,
  wrapRosQtAppsHook,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "py_trees_ros_viewer";
  version = "0.2.5-1";
  src = finalAttrs.passthru.sources."py_trees_ros_viewer";
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ py-trees-js py-trees-ros-interfaces rclpy unique-identifier-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pyqt5-dev-tools" "python3-pyqt5.qtwebengine" "python3-qt5-bindings" "python3-setuptools" "qttools5-dev-tools" ]; };
  propagatedBuildInputs = [ py-trees-js py-trees-ros-interfaces rclpy unique-identifier-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "pyqt5-dev-tools" "python3-pyqt5.qtwebengine" "python3-qt5-bindings" "python3-setuptools" "qttools5-dev-tools" ]; };
  passthru.sources = mkSourceSet (sources: {
    "py_trees_ros_viewer" = substituteSource {
      src = fetchgit {
        name = "py_trees_ros_viewer-source";
        url = "https://github.com/ros2-gbp/py_trees_ros_viewer-release.git";
        rev = "67669dc3a57d3c16295c641b91322ad40a57f36b";
        hash = "sha256-HWfDcBXRA8OAXtmKl5NwUvRRQFB0tghQCUpyXIkTBLM=";
      };
    };
  });
  meta = {
    description = "\n    A Qt-JS application for visualisation of executing/log-replayed behaviour trees in a ROS2 ecosystem.\n  ";
  };
})
