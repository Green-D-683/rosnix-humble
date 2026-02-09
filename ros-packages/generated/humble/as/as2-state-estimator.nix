{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  as2-core,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  mocap4r2-msgs,
  nav-msgs,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  tf2,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "as2_state_estimator";
  version = "1.1.3-1";
  src = finalAttrs.passthru.sources."as2_state_estimator";
  propagatedNativeBuildInputs = [ ament-cmake as2-core geometry-msgs mocap4r2-msgs nav-msgs rclcpp tf2 tf2-ros ];
  propagatedBuildInputs = [ ament-cmake as2-core geometry-msgs mocap4r2-msgs nav-msgs rclcpp tf2 tf2-ros ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "as2_state_estimator" = substituteSource {
      src = fetchgit {
        name = "as2_state_estimator-source";
        url = "https://github.com/ros2-gbp/aerostack2-release.git";
        rev = "dc132ef405ca509bd755244e74dc6a080da9aeb5";
        hash = "sha256-yA+Qisd/1yMQvx7vDIvdV4UPw7CpfWsq4zEOSmbNGQ8=";
      };
    };
  });
  meta = {
    description = "Basic state estimator for AeroStack2";
  };
})
