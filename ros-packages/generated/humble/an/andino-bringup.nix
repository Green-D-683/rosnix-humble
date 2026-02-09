{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  andino-control,
  andino-description,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  joy-linux,
  laser-filters,
  mkSourceSet,
  rosSystemPackages,
  rosbag2-storage-mcap,
  rplidar-ros,
  substituteSource,
  teleop-twist-joy,
  v4l2-camera,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "andino_bringup";
  version = "0.2.0-1";
  src = finalAttrs.passthru.sources."andino_bringup";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ andino-control andino-description joy-linux laser-filters rosbag2-storage-mcap rplidar-ros teleop-twist-joy v4l2-camera ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "xterm" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ andino-control andino-description joy-linux laser-filters rosbag2-storage-mcap rplidar-ros teleop-twist-joy v4l2-camera ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "xterm" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "andino_bringup" = substituteSource {
      src = fetchgit {
        name = "andino_bringup-source";
        url = "https://github.com/ros2-gbp/andino-release.git";
        rev = "4da94ca9801b9efc5b01657184c740c4abad6789";
        hash = "sha256-SZPQlpDmtd1oKgNoXE6GV5ZLTNqO8yYqFj6CcIXV9Wg=";
      };
    };
  });
  meta = {
    description = "Contains launch files to bring up andinobot robot.";
  };
})
