{
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  nmea-msgs,
  rclpy,
  rosSystemPackages,
  rtcm-msgs,
  sensor-msgs,
  std-msgs,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "ntrip_client";
  version = "1.4.1-1";
  src = finalAttrs.passthru.sources."ntrip_client";
  propagatedNativeBuildInputs = [ nmea-msgs rclpy rtcm-msgs sensor-msgs std-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-serial" ]; };
  propagatedBuildInputs = [ nmea-msgs rclpy rtcm-msgs sensor-msgs std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-serial" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ntrip_client" = substituteSource {
      src = fetchgit {
        name = "ntrip_client-source";
        url = "https://github.com/ros2-gbp/ntrip_client-release.git";
        rev = "2118372769a0b09b8e27694bd42b453deb170b5b";
        hash = "sha256-baBmRfB8U2r2GQsjFg9naaGaqtg1Iv3l080W10IXZM0=";
      };
    };
  });
  meta = {
    description = "NTRIP client that will publish RTCM corrections to a ROS topic, and optionally subscribe to NMEA messages to send to an NTRIP server";
  };
})
