{
  ament-cmake,
  ament-cmake-auto,
  ament-cmake-gtest,
  ament-lint-auto,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  ouxt-lint-common,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "quaternion_operation";
  version = "0.0.11-1";
  src = finalAttrs.passthru.sources."quaternion_operation";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-cmake-auto geometry-msgs rclcpp tf2-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-cmake-auto geometry-msgs rclcpp tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ouxt-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "quaternion_operation" = substituteSource {
      src = fetchgit {
        name = "quaternion_operation-source";
        url = "https://github.com/ros2-gbp/quaternion_operation-release.git";
        rev = "49cc6236dfd05529bbfe792c9b4569999cb398a8";
        hash = "sha256-XFIOq/J1ybBjdR5TFUumOgHlYUH5o2Mcm9zh1zPijKo=";
      };
    };
  });
  meta = {
    description = "The quaternion_operation package";
  };
})
