{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "qt_gui_core";
  version = "2.2.4-1";
  src = finalAttrs.passthru.sources."qt_gui_core";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "qt_gui_core" = substituteSource {
      src = fetchgit {
        name = "qt_gui_core-source";
        url = "https://github.com/ros2-gbp/qt_gui_core-release.git";
        rev = "bf5b9033b5481d983ccaa4d09f7778938e217668";
        hash = "sha256-X/LebPzrOmNxBRV80jIV/Y+7BYZM+UoURgvDhv3XIEI=";
      };
    };
  });
  meta = {
    description = "\n    Integration of the ROS package system and ROS-specific plugins for a Qt-based GUI.\n  ";
  };
})
