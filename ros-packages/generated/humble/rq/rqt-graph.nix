{
  ament-index-python,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  python-qt-binding,
  qt-dotgraph,
  rosSystemPackages,
  rqt-gui,
  rqt-gui-py,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "rqt_graph";
  version = "1.3.1-1";
  src = finalAttrs.passthru.sources."rqt_graph";
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament-index-python python-qt-binding qt-dotgraph rqt-gui rqt-gui-py ];
  propagatedBuildInputs = [ ament-index-python python-qt-binding qt-dotgraph rqt-gui rqt-gui-py ];
  passthru.sources = mkSourceSet (sources: {
    "rqt_graph" = substituteSource {
      src = fetchgit {
        name = "rqt_graph-source";
        url = "https://github.com/ros2-gbp/rqt_graph-release.git";
        rev = "7e917fa7b8777491b727bf1c21c636314e7eb4b2";
        hash = "sha256-CHctqUN41fi65Rm1W2uGlb/HQKeUYoFN4V5P1mhpbCg=";
      };
    };
  });
  meta = {
    description = "rqt_graph provides a GUI plugin for visualizing the ROS\n      computation graph.";
  };
})
