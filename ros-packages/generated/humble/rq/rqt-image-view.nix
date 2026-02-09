{
  ament-cmake,
  buildAmentCmakePackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  image-transport,
  mkSourceSet,
  qt-gui-cpp,
  rclcpp,
  rosSystemPackages,
  rqt-gui,
  rqt-gui-cpp,
  sensor-msgs,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rqt_image_view";
  version = "1.2.0-2";
  src = finalAttrs.passthru.sources."rqt_image_view";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ cv-bridge geometry-msgs image-transport qt-gui-cpp rclcpp rqt-gui rqt-gui-cpp sensor-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "qtbase5-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ cv-bridge geometry-msgs image-transport qt-gui-cpp rclcpp rqt-gui rqt-gui-cpp sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "qtbase5-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rqt_image_view" = substituteSource {
      src = fetchgit {
        name = "rqt_image_view-source";
        url = "https://github.com/ros2-gbp/rqt_image_view-release.git";
        rev = "8d874dec7aef192be9b0dfa87875944782bfbc92";
        hash = "sha256-X3GHcEegbG/Z45tA1fhYO3xlE1Fr0WKRaNpZRXYhF2Y=";
      };
    };
  });
  meta = {
    description = "rqt_image_view provides a GUI plugin for displaying images using image_transport.";
  };
})
