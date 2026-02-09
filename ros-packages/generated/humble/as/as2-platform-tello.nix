{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  as2-core,
  as2-msgs,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav-msgs,
  rclcpp,
  rclpy,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  substituteSource,
  tf2,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "as2_platform_tello";
  version = "1.1.0-4";
  src = finalAttrs.passthru.sources."as2_platform_tello";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ as2-core as2-msgs geometry-msgs nav-msgs rclcpp rclpy sensor-msgs std-msgs tf2 tf2-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "std_srvs " ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ as2-core as2-msgs geometry-msgs nav-msgs rclcpp rclpy sensor-msgs std-msgs tf2 tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "std_srvs " ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "as2_platform_tello" = substituteSource {
      src = fetchgit {
        name = "as2_platform_tello-source";
        url = "https://github.com/ros2-gbp/as2_platform_tello-release.git";
        rev = "a1a29764969587e0442d0f7242a7b97ba1b68317";
        hash = "sha256-nbFf8Km68Jn07PZeJZXWDyfnA2GUX6OmJ9SV1gmI4kQ=";
      };
    };
  });
  meta = {
    description = "Package to communicate DJI Tello drones with Aerostack2 framework";
  };
})
