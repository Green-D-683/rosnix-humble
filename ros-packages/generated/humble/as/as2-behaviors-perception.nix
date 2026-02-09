{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  as2-behavior,
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
  pname = "as2_behaviors_perception";
  version = "1.1.3-1";
  src = finalAttrs.passthru.sources."as2_behaviors_perception";
  propagatedNativeBuildInputs = [ ament-cmake as2-behavior as2-core as2-msgs cv-bridge rclcpp sensor-msgs std-msgs std-srvs ];
  propagatedBuildInputs = [ ament-cmake as2-behavior as2-core as2-msgs cv-bridge rclcpp sensor-msgs std-msgs std-srvs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "as2_behaviors_perception" = substituteSource {
      src = fetchgit {
        name = "as2_behaviors_perception-source";
        url = "https://github.com/ros2-gbp/aerostack2-release.git";
        rev = "22e5598acb2117d77b6e107b6d21064ecd52fca9";
        hash = "sha256-UJ7WxrcOO+Pv8AwZyLmeAqxlLEbagf2MGOlb7/hZhWA=";
      };
    };
  });
  meta = {
    description = "ArUco detector behavior";
  };
})
