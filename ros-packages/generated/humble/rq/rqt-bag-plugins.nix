{
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  rosbag2,
  rqt-bag,
  rqt-gui,
  rqt-gui-py,
  rqt-plot,
  sensor-msgs,
  std-msgs,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "rqt_bag_plugins";
  version = "1.1.5-1";
  src = finalAttrs.passthru.sources."rqt_bag_plugins";
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ geometry-msgs rclpy rosbag2 rqt-bag rqt-gui rqt-gui-py rqt-plot sensor-msgs std-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-cairo" "python3-pil" ]; };
  propagatedBuildInputs = [ geometry-msgs rclpy rosbag2 rqt-bag rqt-gui rqt-gui-py rqt-plot sensor-msgs std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-cairo" "python3-pil" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rqt_bag_plugins" = substituteSource {
      src = fetchgit {
        name = "rqt_bag_plugins-source";
        url = "https://github.com/ros2-gbp/rqt_bag-release.git";
        rev = "e540c82c7b02c96d01e35910f4f082400aab3b01";
        hash = "sha256-wH3Nt9Ah/SUETlV8jPl0w3SUZdFvugr6GDWfiXtpKiU=";
      };
    };
  });
  meta = {
    description = "rqt_bag provides a GUI plugin for displaying and replaying ROS bag files.";
  };
})
