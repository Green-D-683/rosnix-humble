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
  geometry-msgs,
  mkSourceSet,
  mocap4r2-msgs,
  rclcpp,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  std-srvs,
  substituteSource,
  tf2,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "as2_external_object_to_tf";
  version = "1.1.3-1";
  src = finalAttrs.passthru.sources."as2_external_object_to_tf";
  propagatedNativeBuildInputs = [ ament-cmake as2-core as2-msgs geometry-msgs mocap4r2-msgs rclcpp sensor-msgs std-msgs std-srvs tf2 tf2-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "yaml-cpp" ]; };
  propagatedBuildInputs = [ ament-cmake as2-core as2-msgs geometry-msgs mocap4r2-msgs rclcpp sensor-msgs std-msgs std-srvs tf2 tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "yaml-cpp" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "as2_external_object_to_tf" = substituteSource {
      src = fetchgit {
        name = "as2_external_object_to_tf-source";
        url = "https://github.com/ros2-gbp/aerostack2-release.git";
        rev = "0d53cce167ecd7bbf8e2ce232ffbe13aa988ce15";
        hash = "sha256-d1L0Rupcyj5LJJWWvRFGgLfJgYK6ECJaIB6STCNFmcY=";
      };
    };
  });
  meta = {
    description = "Adds external objects pose to tf";
  };
})
