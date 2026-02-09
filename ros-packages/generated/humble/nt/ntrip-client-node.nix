{
  ament-cmake,
  ament-cmake-copyright,
  ament-cmake-cppcheck,
  ament-cmake-uncrustify,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  rtcm-msgs,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ntrip_client_node";
  version = "0.7.0-1";
  src = finalAttrs.passthru.sources."ntrip_client_node";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rclcpp rclcpp-components rtcm-msgs std-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libcurl-dev" "pkg-config" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp rclcpp-components rtcm-msgs std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libcurl-dev" "pkg-config" ]; };
  checkInputs = [ ament-cmake-copyright ament-cmake-cppcheck ament-cmake-uncrustify ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ntrip_client_node" = substituteSource {
      src = fetchgit {
        name = "ntrip_client_node-source";
        url = "https://github.com/ros2-gbp/ublox_dgnss-release.git";
        rev = "bf4d3e3a56d80436c8b84f3386169d209fe45669";
        hash = "sha256-sHiPyfDV1WBbvY/X3xpl6COr2izP9ZuMfhWxD9A2bEk=";
      };
    };
  });
  meta = {
    description = "Publishes RTCM ntrip messages from an external mountpoint";
  };
})
