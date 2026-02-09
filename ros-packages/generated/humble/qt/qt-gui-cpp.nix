{
  ament-cmake,
  ament-cmake-pytest,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  pluginlib,
  python-qt-binding,
  qt-gui,
  rcpputils,
  rosSystemPackages,
  substituteSource,
  tinyxml2-vendor,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "qt_gui_cpp";
  version = "2.2.4-1";
  src = finalAttrs.passthru.sources."qt_gui_cpp";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ pluginlib python-qt-binding qt-gui rcpputils tinyxml2-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" "qt5-qmake" "qtbase5-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ pluginlib python-qt-binding qt-gui rcpputils tinyxml2-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "pkg-config" "qt5-qmake" "qtbase5-dev" ]; };
  checkInputs = [ ament-cmake-pytest ];
  passthru.sources = mkSourceSet (sources: {
    "qt_gui_cpp" = substituteSource {
      src = fetchgit {
        name = "qt_gui_cpp-source";
        url = "https://github.com/ros2-gbp/qt_gui_core-release.git";
        rev = "844514ddfa9b7b076ea3a510e46b300eba53babe";
        hash = "sha256-fPXMWgTyKbJyYvKJl/h3TMUVDv51RTJyoCmGGLjKZWI=";
      };
    };
  });
  meta = {
    description = "\n    qt_gui_cpp provides the foundation for C++-bindings for qt_gui and creates bindings for every generator available.\n    At least one specific binding must be available in order to use C++-plugins.\n  ";
  };
})
