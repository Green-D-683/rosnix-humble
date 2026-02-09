{
  ament-cmake,
  ament-cmake-gtest,
  ament-index-cpp,
  ament-lint-auto,
  ament-lint-common,
  as2-core,
  as2-msgs,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  psdk-interfaces,
  rclcpp,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "as2_platform_dji_psdk";
  version = "1.1.0-1";
  src = finalAttrs.passthru.sources."as2_platform_dji_psdk";
  propagatedNativeBuildInputs = [ ament-cmake ament-index-cpp as2-core as2-msgs psdk-interfaces rclcpp std-msgs ];
  propagatedBuildInputs = [ ament-cmake ament-index-cpp as2-core as2-msgs psdk-interfaces rclcpp std-msgs ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "as2_platform_dji_psdk" = substituteSource {
      src = fetchgit {
        name = "as2_platform_dji_psdk-source";
        url = "https://github.com/ros2-gbp/as2_platform_dji_psdk-release.git";
        rev = "2bee91df71c75efb7a787918e1bc685605d25f24";
        hash = "sha256-8PNihHajZdQp13APfh+lH3FND78yEaUr1FWUJ6nmv6Y=";
      };
    };
  });
  meta = {
    description = "AS2 DJI PSDK aerial platform";
  };
})
