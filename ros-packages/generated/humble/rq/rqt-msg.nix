{
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  python-qt-binding,
  rclpy,
  rosSystemPackages,
  rqt-console,
  rqt-gui,
  rqt-gui-py,
  rqt-py-common,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "rqt_msg";
  version = "1.2.0-1";
  src = finalAttrs.passthru.sources."rqt_msg";
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ python-qt-binding rclpy rqt-console rqt-gui rqt-gui-py rqt-py-common ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-catkin-pkg-modules" ]; };
  propagatedBuildInputs = [ python-qt-binding rclpy rqt-console rqt-gui rqt-gui-py rqt-py-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-catkin-pkg-modules" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rqt_msg" = substituteSource {
      src = fetchgit {
        name = "rqt_msg-source";
        url = "https://github.com/ros2-gbp/rqt_msg-release.git";
        rev = "de089c4bcaf5ad5ecbfc65cd387f526812330c08";
        hash = "sha256-FyLj4I2R0NF5DK+LFLMbZCOzhfm9D5wwkNzFC9odAgE=";
      };
    };
  });
  meta = {
    description = "A Python GUI plugin for introspecting available ROS message types.\n  Note that the msgs available through this plugin is the ones that are stored\n  on your machine, not on the ROS core your rqt instance connects to.\n  ";
  };
})
