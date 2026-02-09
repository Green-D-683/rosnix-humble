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
  geographic-msgs,
  geometry-msgs,
  mkSourceSet,
  nav-msgs,
  rclcpp,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "as2_geozones";
  version = "1.1.3-1";
  src = finalAttrs.passthru.sources."as2_geozones";
  propagatedNativeBuildInputs = [ ament-cmake as2-core as2-msgs geographic-msgs geometry-msgs nav-msgs rclcpp sensor-msgs ];
  propagatedBuildInputs = [ ament-cmake as2-core as2-msgs geographic-msgs geometry-msgs nav-msgs rclcpp sensor-msgs ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "as2_geozones" = substituteSource {
      src = fetchgit {
        name = "as2_geozones-source";
        url = "https://github.com/ros2-gbp/aerostack2-release.git";
        rev = "98feef62618ab44de5f36c75b8c2727a9b97cf27";
        hash = "sha256-BwmE4xn7qK5H3hzxAr9YLVgqmZTAHvkDwkUTYv9FA6o=";
      };
    };
  });
  meta = {
    description = "Geozones for AeroStack2";
  };
})
