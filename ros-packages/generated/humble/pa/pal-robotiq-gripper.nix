{
  ament-cmake-auto,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  pal-robotiq-controller-configuration,
  pal-robotiq-description,
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "pal_robotiq_gripper";
  version = "2.2.0-1";
  src = finalAttrs.passthru.sources."pal_robotiq_gripper";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedNativeBuildInputs = [ pal-robotiq-controller-configuration pal-robotiq-description rclcpp ];
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ pal-robotiq-controller-configuration pal-robotiq-description rclcpp ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "pal_robotiq_gripper" = substituteSource {
      src = fetchgit {
        name = "pal_robotiq_gripper-source";
        url = "https://github.com/pal-gbp/pal_robotiq_gripper-release.git";
        rev = "2a572a4e23e76fcacf747555d2d55e2b6d90d505";
        hash = "sha256-Kol8mUbegX8VHaachk1SxKvBBl6sqTCDH6xIQ2SYaTA=";
      };
    };
  });
  meta = {
    description = "Robotiq Gripper Definition Packages";
  };
})
