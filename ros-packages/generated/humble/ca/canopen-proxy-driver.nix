{
  ament-cmake-ros,
  ament-lint-auto,
  buildAmentCmakePackage,
  canopen-base-driver,
  canopen-core,
  canopen-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rclcpp-lifecycle,
  rosSystemPackages,
  std-msgs,
  std-srvs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "canopen_proxy_driver";
  version = "0.2.13-1";
  src = finalAttrs.passthru.sources."canopen_proxy_driver";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ canopen-base-driver canopen-core canopen-interfaces rclcpp rclcpp-components rclcpp-lifecycle std-msgs std-srvs ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ canopen-base-driver canopen-core canopen-interfaces rclcpp rclcpp-components rclcpp-lifecycle std-msgs std-srvs ];
  checkInputs = [ ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "canopen_proxy_driver" = substituteSource {
      src = fetchgit {
        name = "canopen_proxy_driver-source";
        url = "https://github.com/ros2-gbp/ros2_canopen-release.git";
        rev = "1ef6d2afa02a5605542f28f318b3c59b9dbbc5a2";
        hash = "sha256-fQjShvGrAKuo2r9M6qz+/Pe0EDD76qovjmAcf989lng=";
      };
    };
  });
  meta = {
    description = "Simple proxy driver for the ros2_canopen stack";
  };
})
