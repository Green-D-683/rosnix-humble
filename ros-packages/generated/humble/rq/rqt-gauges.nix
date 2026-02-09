{
  ament-flake8,
  ament-index-python,
  ament-xmllint,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
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
  pname = "rqt_gauges";
  version = "0.0.3-1";
  src = finalAttrs.passthru.sources."rqt_gauges";
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament-index-python qt-gui qt-gui-py-common rclpy rqt-gui rqt-gui-py ];
  propagatedBuildInputs = [ ament-index-python qt-gui qt-gui-py-common rclpy rqt-gui rqt-gui-py ];
  checkInputs = [ ament-flake8 ament-xmllint ];
  passthru.sources = mkSourceSet (sources: {
    "rqt_gauges" = substituteSource {
      src = fetchgit {
        name = "rqt_gauges-source";
        url = "https://github.com/ros2-gbp/rqt_gauges-release.git";
        rev = "4f4c29b2a7353f8d50df650d7c5425cde8b8cf7f";
        hash = "sha256-ie5l6SHrK6cQczLp2R3MdzrJRVZGAxGnuO7NzFIwbJY=";
      };
    };
  });
  meta = {
    description = "Visualization plugin for several sensors.";
  };
})
