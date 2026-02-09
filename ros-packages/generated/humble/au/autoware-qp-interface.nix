{
  ament-cmake-auto,
  ament-cmake-ros,
  ament-lint-auto,
  autoware-cmake,
  autoware-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  osqp-vendor,
  proxsuite,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_qp_interface";
  version = "1.4.0-1";
  src = finalAttrs.passthru.sources."autoware_qp_interface";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ osqp-vendor proxsuite rclcpp rclcpp-components ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" ]; };
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ osqp-vendor proxsuite rclcpp rclcpp-components ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" ]; };
  checkInputs = [ ament-cmake-ros ament-lint-auto autoware-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" ]; };
  passthru.sources = mkSourceSet (sources: {
    "autoware_qp_interface" = substituteSource {
      src = fetchgit {
        name = "autoware_qp_interface-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "de0b4f65ce1cc65d2ca0e21b51cd78d7b27cbf2c";
        hash = "sha256-PSiGjiq2SuCBg4+5Rd2bJMwINg0qPwgL1ju2wrTuJfY=";
      };
    };
  });
  meta = {
    description = "Interface for the QP solvers";
  };
})
