{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  qb-device-msgs,
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "qb_device_driver";
  version = "4.1.3-1";
  src = finalAttrs.passthru.sources."qb_device_driver";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ qb-device-msgs rclcpp ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ qb-device-msgs rclcpp ];
  passthru.sources = mkSourceSet (sources: {
    "qb_device_driver" = substituteSource {
      src = fetchgit {
        name = "qb_device_driver-source";
        url = "https://bitbucket.org/qbrobotics/qbdevice-ros2-release.git";
        rev = "f8dc00d97b37cd0973245eeb4396f5e1cada2efe";
        hash = "sha256-wKNzkrrw66vacMpqWNS9oaioWP0UAgYEYylzAP2QUdE=";
      };
    };
  });
  meta = {
    description = "\n    This package contains a device-independent API wrapper for qbrobotics® devices.\n  ";
  };
})
