{
  buildCmakePackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  gtsam,
  libg2o,
  libpointmatcher,
  mkSourceSet,
  qt-gui-cpp,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildCmakePackage (finalAttrs: {
  pname = "rtabmap";
  version = "0.22.1-1";
  src = finalAttrs.passthru.sources."rtabmap";
  nativeBuildInputs = [ wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ cv-bridge gtsam libg2o libpointmatcher qt-gui-cpp ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "liboctomap-dev" "libpcl-all-dev" "libsqlite3-dev" "proj" "zlib" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ cv-bridge gtsam libg2o libpointmatcher qt-gui-cpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "liboctomap-dev" "libpcl-all-dev" "libsqlite3-dev" "proj" "zlib" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rtabmap" = substituteSource {
      src = fetchgit {
        name = "rtabmap-source";
        url = "https://github.com/ros2-gbp/rtabmap-release.git";
        rev = "fd70a14ba9ea2b3bde49db67bdba4aa86fa7210a";
        hash = "sha256-dayDzRA3t3xDkgtdGU60ccuYEKEaNIg08hL4Jp2zv9M=";
      };
    };
  });
  meta = {
    description = "RTAB-Map's standalone library. RTAB-Map is a RGB-D SLAM approach with real-time constraints.";
  };
})
