{
  ament-cmake,
  ament-cmake-pytest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "python_qt_binding";
  version = "1.1.3-1";
  src = finalAttrs.passthru.sources."python_qt_binding";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-qt5-bindings" "qtbase5-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3-qt5-bindings" "qtbase5-dev" ]; };
  checkInputs = [ ament-cmake-pytest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "python_qt_binding" = substituteSource {
      src = fetchgit {
        name = "python_qt_binding-source";
        url = "https://github.com/ros2-gbp/python_qt_binding-release.git";
        rev = "50d4dad5832a2333c0e9a8cbacf4ba9cdbd39c88";
        hash = "sha256-DrnFzVx8EGy9V73efA8grB2WVnS99qhB2NmPM3gm4KM=";
      };
    };
  });
  meta = {
    description = "\n    This stack provides Python bindings for Qt.\n    There are two providers: pyside and pyqt.  PySide2 is available under\n    the GPL, LGPL and a commercial license.  PyQt is released under the GPL.\n\n    Both the bindings and tools to build bindings are included from each\n    available provider.  For PySide, it is called \"Shiboken\".  For PyQt,\n    this is called \"SIP\".\n\n    Also provided is adapter code to make the user's Python code\n    independent of which binding provider was actually used which makes\n    it very easy to switch between these.\n  ";
  };
})
