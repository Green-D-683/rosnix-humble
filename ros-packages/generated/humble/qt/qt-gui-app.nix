{
  ament-cmake,
  ament-index-python,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  qt-gui,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "qt_gui_app";
  version = "2.2.4-1";
  src = finalAttrs.passthru.sources."qt_gui_app";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament-index-python qt-gui ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-index-python qt-gui ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "qt_gui_app" = substituteSource {
      src = fetchgit {
        name = "qt_gui_app-source";
        url = "https://github.com/ros2-gbp/qt_gui_core-release.git";
        rev = "1522a4cc17b99ec9a533876ed6d77572717454b1";
        hash = "sha256-PAi206BN3j4W2B4olK5BMRfFOAjwsY0He6izBI5nAB8=";
      };
    };
  });
  meta = {
    description = "\n    qt_gui_app provides the main to start an instance of the integrated graphical user interface provided by qt_gui.\n  ";
  };
})
