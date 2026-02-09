{
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  octomap,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildCmakePackage (finalAttrs: {
  pname = "octovis";
  version = "1.9.8-1";
  src = finalAttrs.passthru.sources."octovis";
  nativeBuildInputs = [ wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ octomap ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libqglviewer-dev-qt5" "libqglviewer2-qt5" "libqt5-core" "libqt5-gui" "libqt5-opengl" "libqt5-opengl-dev" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ octomap ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libqglviewer-dev-qt5" "libqglviewer2-qt5" "libqt5-core" "libqt5-gui" "libqt5-opengl" "libqt5-opengl-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "octovis" = substituteSource {
      src = fetchgit {
        name = "octovis-source";
        url = "https://github.com/ros2-gbp/octomap-release.git";
        rev = "55c571b77872f5b0747f694dffc5d3449a70adb3";
        hash = "sha256-B3o5qIG2TXL7n4EG8EOfFE/k4yEj6kdYAtRPXbUfB6s=";
      };
    };
  });
  meta = {
    description = "octovis is visualization tool for the OctoMap library based on Qt and libQGLViewer. See\n  http://octomap.github.io for details.";
  };
})
