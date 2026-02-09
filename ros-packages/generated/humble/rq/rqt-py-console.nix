{
  ament-index-python,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  python-qt-binding,
  qt-gui,
  qt-gui-py-common,
  rclpy,
  rosSystemPackages,
  rqt-gui,
  rqt-gui-py,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "rqt_py_console";
  version = "1.0.2-3";
  src = finalAttrs.passthru.sources."rqt_py_console";
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament-index-python python-qt-binding qt-gui qt-gui-py-common rclpy rqt-gui rqt-gui-py ];
  propagatedBuildInputs = [ ament-index-python python-qt-binding qt-gui qt-gui-py-common rclpy rqt-gui rqt-gui-py ];
  passthru.sources = mkSourceSet (sources: {
    "rqt_py_console" = substituteSource {
      src = fetchgit {
        name = "rqt_py_console-source";
        url = "https://github.com/ros2-gbp/rqt_py_console-release.git";
        rev = "80f13cff986e5163f7f7a0d8656b6b5efbf044a1";
        hash = "sha256-yLjOc2LoQeh7Yx+T6GKB+Xbdm3NG47pMTU2gIzn+uZY=";
      };
    };
  });
  meta = {
    description = "rqt_py_console is a Python GUI plugin providing an interactive Python console.";
  };
})
