{
  ament-cmake,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nmea_msgs";
  version = "2.0.0-4";
  src = finalAttrs.passthru.sources."nmea_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ builtin-interfaces rosidl-default-generators rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-generators rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "nmea_msgs" = substituteSource {
      src = fetchgit {
        name = "nmea_msgs-source";
        url = "https://github.com/ros2-gbp/nmea_msgs-release.git";
        rev = "76db6bd9dc2ad52c0ad45de27871f22c64ba03b1";
        hash = "sha256-bswqgESVo01rxSNhUMSl4dZwBC88WoKlS55Dn0U5CQc=";
      };
    };
  });
  meta = {
    description = "The nmea_msgs package contains messages related to data in the NMEA format.";
  };
})
