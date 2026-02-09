{
  ament-cmake,
  buildAmentCmakePackage,
  etsi-its-cam-coding,
  etsi-its-cam-msgs,
  etsi-its-primitives-conversion,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "etsi_its_cam_conversion";
  version = "3.4.0-1";
  src = finalAttrs.passthru.sources."etsi_its_cam_conversion";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ etsi-its-cam-coding etsi-its-cam-msgs etsi-its-primitives-conversion ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ etsi-its-cam-coding etsi-its-cam-msgs etsi-its-primitives-conversion ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_cam_conversion" = substituteSource {
      src = fetchgit {
        name = "etsi_its_cam_conversion-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "f55b0ed71e5379c0cde2d7709c480ab4013a0593";
        hash = "sha256-H1/Rfk1WUcilO9tiRFHhEO6SZ3Z+yZNtXiY08sk4CDE=";
      };
    };
  });
  meta = {
    description = "Conversion functions for converting ROS messages to and from ASN.1-encoded ETSI ITS CAMs";
  };
})
