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
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  std-msgs,
  std-srvs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "as2_behavior";
  version = "1.1.3-1";
  src = finalAttrs.passthru.sources."as2_behavior";
  propagatedNativeBuildInputs = [ ament-cmake as2-core as2-msgs rclcpp std-msgs std-srvs ];
  propagatedBuildInputs = [ ament-cmake as2-core as2-msgs rclcpp std-msgs std-srvs ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "as2_behavior" = substituteSource {
      src = fetchgit {
        name = "as2_behavior-source";
        url = "https://github.com/ros2-gbp/aerostack2-release.git";
        rev = "703b88effe1b5ae493218be94ab7f105b332bcf7";
        hash = "sha256-LKFUhRRsKhYYr1juO6MiZnkVCg45UaKTXA2U5tAatwk=";
      };
    };
  });
  meta = {
    description = "Aerostack2 Behavior Class";
  };
})
