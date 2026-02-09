{
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  rqt-gui,
  rqt-gui-py,
  rqt-msg,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "rqt_srv";
  version = "1.0.3-3";
  src = finalAttrs.passthru.sources."rqt_srv";
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ rclpy rqt-gui rqt-gui-py rqt-msg ];
  propagatedBuildInputs = [ rclpy rqt-gui rqt-gui-py rqt-msg ];
  passthru.sources = mkSourceSet (sources: {
    "rqt_srv" = substituteSource {
      src = fetchgit {
        name = "rqt_srv-source";
        url = "https://github.com/ros2-gbp/rqt_srv-release.git";
        rev = "468338c8c97e91432b70a954f4d8531373897bc6";
        hash = "sha256-q6xLT+in38OgaER7EjAFQvGQIqlXCP85eR4andyqu8g=";
      };
    };
  });
  meta = {
    description = "A Python GUI plugin for introspecting available ROS message types.\n  Note that the srvs available through this plugin is the ones that are stored\n  on your machine, not on the ROS core your rqt instance connects to.";
  };
})
