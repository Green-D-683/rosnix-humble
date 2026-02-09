{
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  python-qt-binding,
  qt-gui,
  qt-gui-py-common,
  rosSystemPackages,
  rqt-gui,
  rqt-gui-py,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "rqt_shell";
  version = "1.0.2-3";
  src = finalAttrs.passthru.sources."rqt_shell";
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ python-qt-binding qt-gui qt-gui-py-common rqt-gui rqt-gui-py ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-catkin-pkg-modules" ]; };
  propagatedBuildInputs = [ python-qt-binding qt-gui qt-gui-py-common rqt-gui rqt-gui-py ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-catkin-pkg-modules" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rqt_shell" = substituteSource {
      src = fetchgit {
        name = "rqt_shell-source";
        url = "https://github.com/ros2-gbp/rqt_shell-release.git";
        rev = "9606e0924b9ca71a69dcc802e6aa2248876577cc";
        hash = "sha256-TQTnT4NLOyyBYWKjB+/sJ7oGIkAG3FXQezqxdFXUGQc=";
      };
    };
  });
  meta = {
    description = "rqt_shell is a Python GUI plugin providing an interactive shell.";
  };
})
