{
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  canopen-core,
  canopen-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  lely-core-libraries,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rclcpp-lifecycle,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "canopen_master_driver";
  version = "0.2.13-1";
  src = finalAttrs.passthru.sources."canopen_master_driver";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ canopen-core canopen-interfaces lely-core-libraries rclcpp rclcpp-components rclcpp-lifecycle ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ canopen-core canopen-interfaces lely-core-libraries rclcpp rclcpp-components rclcpp-lifecycle ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "canopen_master_driver" = substituteSource {
      src = fetchgit {
        name = "canopen_master_driver-source";
        url = "https://github.com/ros2-gbp/ros2_canopen-release.git";
        rev = "2c1b682fde9ee3f3877482c20c875150bfdf8126";
        hash = "sha256-URPO3zEue58xWc/XH4BbtZYTmbQFLPhPtJSu2rnMToQ=";
      };
    };
  });
  meta = {
    description = "Basic canopen master implementation";
  };
})
