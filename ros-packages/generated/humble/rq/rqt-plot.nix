{
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  python-qt-binding,
  qt-gui-py-common,
  rclpy,
  rosSystemPackages,
  rqt-gui,
  rqt-gui-py,
  rqt-py-common,
  std-msgs,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "rqt_plot";
  version = "1.1.5-1";
  src = finalAttrs.passthru.sources."rqt_plot";
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ python-qt-binding qt-gui-py-common rclpy rqt-gui rqt-gui-py rqt-py-common std-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-catkin-pkg-modules" "python3-matplotlib" "python3-numpy" ]; };
  propagatedBuildInputs = [ python-qt-binding qt-gui-py-common rclpy rqt-gui rqt-gui-py rqt-py-common std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-catkin-pkg-modules" "python3-matplotlib" "python3-numpy" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rqt_plot" = substituteSource {
      src = fetchgit {
        name = "rqt_plot-source";
        url = "https://github.com/ros2-gbp/rqt_plot-release.git";
        rev = "1016dcacbc03d8f452ca99fd9ba56153abdc7cc5";
        hash = "sha256-/WUZKlKADc1Oxy8+heFykRK3d3bEUeEquC317ni4Q0g=";
      };
    };
  });
  meta = {
    description = "rqt_plot provides a GUI plugin visualizing numeric values in a 2D plot using different plotting backends.";
  };
})
