{
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  python-qt-binding,
  rclpy,
  rosSystemPackages,
  rqt-gui,
  rqt-gui-py,
  rqt-msg,
  rqt-py-common,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "rqt_action";
  version = "2.0.1-3";
  src = finalAttrs.passthru.sources."rqt_action";
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ python-qt-binding rclpy rqt-gui rqt-gui-py rqt-msg rqt-py-common ];
  propagatedBuildInputs = [ python-qt-binding rclpy rqt-gui rqt-gui-py rqt-msg rqt-py-common ];
  passthru.sources = mkSourceSet (sources: {
    "rqt_action" = substituteSource {
      src = fetchgit {
        name = "rqt_action-source";
        url = "https://github.com/ros2-gbp/rqt_action-release.git";
        rev = "35ec0c7a5a48e96905cf10359886ad6032a3b356";
        hash = "sha256-YE20Hf//2FHYnbnCI5YOD9PWfHDi8xkZwtt5cRkz1io=";
      };
    };
  });
  meta = {
    description = "rqt_action provides a feature to introspect all available ROS\n  action types. By utilizing rqt_msg, the output format is\n  unified with it and rqt_srv. Note that the actions shown on this plugin\n  is the ones that are stored on your machine, not on the ROS core your rqt\n  instance connects to.";
  };
})
