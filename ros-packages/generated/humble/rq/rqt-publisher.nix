{
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  python-qt-binding,
  qt-gui-py-common,
  rosSystemPackages,
  rqt-gui,
  rqt-gui-py,
  rqt-py-common,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "rqt_publisher";
  version = "1.5.0-1";
  src = finalAttrs.passthru.sources."rqt_publisher";
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ python-qt-binding qt-gui-py-common rqt-gui rqt-gui-py rqt-py-common ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-catkin-pkg-modules" ]; };
  propagatedBuildInputs = [ python-qt-binding qt-gui-py-common rqt-gui rqt-gui-py rqt-py-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-catkin-pkg-modules" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rqt_publisher" = substituteSource {
      src = fetchgit {
        name = "rqt_publisher-source";
        url = "https://github.com/ros2-gbp/rqt_publisher-release.git";
        rev = "6891e03f3e201796e5d5db9067b4801b52afae9b";
        hash = "sha256-TUzzaAtuC8QQpggWr5+VS4qa+8q3Ni6gYYSszPAOxv0=";
      };
    };
  });
  meta = {
    description = "rqt_publisher provides a GUI plugin for publishing arbitrary messages with fixed or computed field values.";
  };
})
