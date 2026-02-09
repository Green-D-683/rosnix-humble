{
  ament-cmake,
  ament-cmake-gtest,
  ament-cmake-python,
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
  rclcpp,
  rclcpp-action,
  rclpy,
  rosSystemPackages,
  std-msgs,
  std-srvs,
  substituteSource,
  trajectory-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "as2_motion_reference_handlers";
  version = "1.1.3-1";
  src = finalAttrs.passthru.sources."as2_motion_reference_handlers";
  nativeBuildInputs = [ ament-cmake-python ];
  propagatedNativeBuildInputs = [ ament-cmake as2-core as2-msgs geometry-msgs rclcpp rclcpp-action rclpy std-msgs std-srvs trajectory-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" ]; };
  buildInputs = [ ament-cmake-python ];
  propagatedBuildInputs = [ ament-cmake as2-core as2-msgs geometry-msgs rclcpp rclcpp-action rclpy std-msgs std-srvs trajectory-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "as2_motion_reference_handlers" = substituteSource {
      src = fetchgit {
        name = "as2_motion_reference_handlers-source";
        url = "https://github.com/ros2-gbp/aerostack2-release.git";
        rev = "39191bc69e8e64a2f221cb68266727f359f8a559";
        hash = "sha256-cVQZ9gP80xgSwsCUHaElmoXKlKX+ya0JcR2x8B78ewE=";
      };
    };
  });
  meta = {
    description = "Motion handlers to ease the control of the UAVs inside the Aerostack2 framework";
  };
})
