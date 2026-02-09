{
  ament-cmake,
  ament-cmake-pytest,
  ament-cmake-python,
  ament-index-python,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  joint-state-publisher-gui,
  mkSourceSet,
  robot-state-publisher,
  ros2launch,
  rosSystemPackages,
  rviz2,
  substituteSource,
  wrapRosQtAppsHook,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "andino_description";
  version = "0.2.0-1";
  src = finalAttrs.passthru.sources."andino_description";
  nativeBuildInputs = [ ament-cmake ament-cmake-python wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ joint-state-publisher-gui robot-state-publisher ros2launch rviz2 xacro ];
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ joint-state-publisher-gui robot-state-publisher ros2launch rviz2 xacro ];
  checkInputs = [ ament-cmake-pytest ament-index-python ];
  passthru.sources = mkSourceSet (sources: {
    "andino_description" = substituteSource {
      src = fetchgit {
        name = "andino_description-source";
        url = "https://github.com/ros2-gbp/andino-release.git";
        rev = "2276fadc87074624c0a690f6606ced4406f2916d";
        hash = "sha256-qYvgGNghhZbMJWQmEn3t4e0gGRShqeQD10d+wriKIhc=";
      };
    };
  });
  meta = {
    description = "The andino_description package";
  };
})
