{
  ament-lint-auto,
  ament-lint-common,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  qt-gui,
  rosSystemPackages,
  rqt-gui,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "rqt_gui_py";
  version = "1.1.9-1";
  src = finalAttrs.passthru.sources."rqt_gui_py";
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ qt-gui rqt-gui ];
  propagatedBuildInputs = [ qt-gui rqt-gui ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rqt_gui_py" = substituteSource {
      src = fetchgit {
        name = "rqt_gui_py-source";
        url = "https://github.com/ros2-gbp/rqt-release.git";
        rev = "e38839745114b57bd550ed8cf21d1099759ec5fa";
        hash = "sha256-LeBeIwOflHHMCSv+5fiFWUEzU2OjpCw6Lusp0Ki7554=";
      };
    };
  });
  meta = {
    description = "rqt_gui_py enables GUI plugins to use the Python client library for ROS.";
  };
})
