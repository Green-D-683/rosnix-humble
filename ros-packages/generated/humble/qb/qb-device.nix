{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  qb-device-bringup,
  qb-device-driver,
  qb-device-msgs,
  qb-device-ros2-control,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "qb_device";
  version = "4.1.3-1";
  src = finalAttrs.passthru.sources."qb_device";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ qb-device-bringup qb-device-driver qb-device-msgs qb-device-ros2-control ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ qb-device-bringup qb-device-driver qb-device-msgs qb-device-ros2-control ];
  passthru.sources = mkSourceSet (sources: {
    "qb_device" = substituteSource {
      src = fetchgit {
        name = "qb_device-source";
        url = "https://bitbucket.org/qbrobotics/qbdevice-ros2-release.git";
        rev = "9a7604b5a2dd6b2a1866f757a97d2311e8cbb0a5";
        hash = "sha256-RbnIDJEyhkIy5MBulyiaUcb1K/fTuTVacgSAuLzWFEE=";
      };
    };
  });
  meta = {
    description = "\n    This package contains a device-independent ROS interface for qbrobotics® devices.\n  ";
  };
})
