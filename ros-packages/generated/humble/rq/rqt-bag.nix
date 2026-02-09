{
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  python-qt-binding,
  rclpy,
  rosSystemPackages,
  rosbag2-py,
  rqt-gui,
  rqt-gui-py,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "rqt_bag";
  version = "1.1.5-1";
  src = finalAttrs.passthru.sources."rqt_bag";
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ python-qt-binding rclpy rosbag2-py rqt-gui rqt-gui-py ];
  propagatedBuildInputs = [ python-qt-binding rclpy rosbag2-py rqt-gui rqt-gui-py ];
  passthru.sources = mkSourceSet (sources: {
    "rqt_bag" = substituteSource {
      src = fetchgit {
        name = "rqt_bag-source";
        url = "https://github.com/ros2-gbp/rqt_bag-release.git";
        rev = "ee0d949aebdac7427f942152d28e72c2231f7661";
        hash = "sha256-71gax766cB4IsjNKRFhLO8+jlVNAVfpcJB0z3qDZaH0=";
      };
    };
  });
  meta = {
    description = "rqt_bag provides a GUI plugin for displaying and replaying ROS bag files.";
  };
})
