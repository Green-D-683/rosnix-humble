{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  as2-core,
  as2-msgs,
  buildAmentCmakePackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  std-srvs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "as2_usb_camera_interface";
  version = "1.1.3-1";
  src = finalAttrs.passthru.sources."as2_usb_camera_interface";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ as2-core as2-msgs cv-bridge rclcpp sensor-msgs std-msgs std-srvs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ as2-core as2-msgs cv-bridge rclcpp sensor-msgs std-msgs std-srvs ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "as2_usb_camera_interface" = substituteSource {
      src = fetchgit {
        name = "as2_usb_camera_interface-source";
        url = "https://github.com/ros2-gbp/aerostack2-release.git";
        rev = "fbf579f91f671bc365822992726fade19ee6ae04";
        hash = "sha256-e9Zfn0fbP0gWv0QmV7N8xHWaELrwFn+hEfV5F6Rqb08=";
      };
    };
  });
  meta = {
    description = "USB camera driver";
  };
})
