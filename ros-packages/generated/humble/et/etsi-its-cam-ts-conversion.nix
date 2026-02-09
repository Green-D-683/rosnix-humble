{
  ament-cmake,
  buildAmentCmakePackage,
  etsi-its-cam-ts-coding,
  etsi-its-cam-ts-msgs,
  etsi-its-primitives-conversion,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "etsi_its_cam_ts_conversion";
  version = "3.4.0-1";
  src = finalAttrs.passthru.sources."etsi_its_cam_ts_conversion";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ etsi-its-cam-ts-coding etsi-its-cam-ts-msgs etsi-its-primitives-conversion ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ etsi-its-cam-ts-coding etsi-its-cam-ts-msgs etsi-its-primitives-conversion ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_cam_ts_conversion" = substituteSource {
      src = fetchgit {
        name = "etsi_its_cam_ts_conversion-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "efe4b17437aece50ba5b413dc60fe704ee180971";
        hash = "sha256-8HUPCqtcHzfsIVqZelWHDm7SajtWnr0yvaZR2GL0174=";
      };
    };
  });
  meta = {
    description = "Conversion functions for converting ROS messages to and from ASN.1-encoded ETSI ITS CAMs (TS)";
  };
})
