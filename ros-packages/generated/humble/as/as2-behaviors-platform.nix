{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  as2-behavior,
  as2-core,
  as2-msgs,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rclcpp-action,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "as2_behaviors_platform";
  version = "1.1.3-1";
  src = finalAttrs.passthru.sources."as2_behaviors_platform";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ as2-behavior as2-core as2-msgs rclcpp rclcpp-action ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ as2-behavior as2-core as2-msgs rclcpp rclcpp-action ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "as2_behaviors_platform" = substituteSource {
      src = fetchgit {
        name = "as2_behaviors_platform-source";
        url = "https://github.com/ros2-gbp/aerostack2-release.git";
        rev = "3765c5dc505747946205087e07515c4792a143eb";
        hash = "sha256-/7sELfv/iAEELM3muIvcdA6CzpOs46Kbdw/ff2tSL3s=";
      };
    };
  });
  meta = {
    description = "Aerostack2 core package which contains launchers for the basic behaviors";
  };
})
