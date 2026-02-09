{
  ament-cmake-auto,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  joint-state-broadcaster,
  joint-trajectory-controller,
  launch,
  launch-pal,
  mkSourceSet,
  omni-base-controller-configuration,
  pal-pro-gripper-controller-configuration,
  pal-sea-arm-controller-configuration,
  ros2controlcli,
  rosSystemPackages,
  substituteSource,
  tiago-pro-head-controller-configuration,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "tiago_pro_controller_configuration";
  version = "1.32.1-1";
  src = finalAttrs.passthru.sources."tiago_pro_controller_configuration";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedNativeBuildInputs = [ joint-state-broadcaster joint-trajectory-controller launch launch-pal omni-base-controller-configuration pal-pro-gripper-controller-configuration pal-sea-arm-controller-configuration ros2controlcli tiago-pro-head-controller-configuration ];
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ joint-state-broadcaster joint-trajectory-controller launch launch-pal omni-base-controller-configuration pal-pro-gripper-controller-configuration pal-sea-arm-controller-configuration ros2controlcli tiago-pro-head-controller-configuration ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "tiago_pro_controller_configuration" = substituteSource {
      src = fetchgit {
        name = "tiago_pro_controller_configuration-source";
        url = "https://github.com/ros2-gbp/tiago_pro_robot-release.git";
        rev = "09cf88edbf29ba939e52510fe76218409ab673a2";
        hash = "sha256-Vg9Cr8ICPB+qZSSU/6dTzGmYwyrL9jELr9uItwZriGE=";
      };
    };
  });
  meta = {
    description = "The tiago_pro_controller_configuration package";
  };
})
