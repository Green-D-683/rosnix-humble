{
  ament-cmake-ros,
  ament-lint-auto,
  buildAmentCmakePackage,
  canopen-base-driver,
  canopen-core,
  canopen-interfaces,
  canopen-proxy-driver,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rclcpp-lifecycle,
  rosSystemPackages,
  sensor-msgs,
  std-srvs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "canopen_402_driver";
  version = "0.2.13-1";
  src = finalAttrs.passthru.sources."canopen_402_driver";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ canopen-base-driver canopen-core canopen-interfaces canopen-proxy-driver rclcpp rclcpp-components rclcpp-lifecycle sensor-msgs std-srvs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "boost" ]; };
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ canopen-base-driver canopen-core canopen-interfaces canopen-proxy-driver rclcpp rclcpp-components rclcpp-lifecycle sensor-msgs std-srvs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" ]; };
  checkInputs = [ ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "canopen_402_driver" = substituteSource {
      src = fetchgit {
        name = "canopen_402_driver-source";
        url = "https://github.com/ros2-gbp/ros2_canopen-release.git";
        rev = "350e787ddc7de00f4c07a41c82b38fe625495ae0";
        hash = "sha256-q+BA8y3JwfJ3BvkezNcbh86C8EwA90pV4jmz94Ee1/8=";
      };
    };
  });
  meta = {
    description = "Driiver for devices implementing CIA402 profile";
  };
})
