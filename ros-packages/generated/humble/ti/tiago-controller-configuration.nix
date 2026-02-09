{
  ament-cmake-auto,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  controller-manager,
  diff-drive-controller,
  fetchgit,
  fetchurl,
  fetchzip,
  force-torque-sensor-broadcaster,
  joint-state-broadcaster,
  joint-trajectory-controller,
  launch,
  launch-pal,
  mkSourceSet,
  omni-base-controller-configuration,
  pal-gripper-controller-configuration,
  pal-hey5-controller-configuration,
  pal-robotiq-controller-configuration,
  pmb2-controller-configuration,
  ros2controlcli,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "tiago_controller_configuration";
  version = "4.22.0-1";
  src = finalAttrs.passthru.sources."tiago_controller_configuration";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedNativeBuildInputs = [ controller-manager diff-drive-controller force-torque-sensor-broadcaster joint-state-broadcaster joint-trajectory-controller launch launch-pal omni-base-controller-configuration pal-gripper-controller-configuration pal-hey5-controller-configuration pal-robotiq-controller-configuration pmb2-controller-configuration ros2controlcli ];
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ controller-manager diff-drive-controller force-torque-sensor-broadcaster joint-state-broadcaster joint-trajectory-controller launch launch-pal omni-base-controller-configuration pal-gripper-controller-configuration pal-hey5-controller-configuration pal-robotiq-controller-configuration pmb2-controller-configuration ros2controlcli ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "tiago_controller_configuration" = substituteSource {
      src = fetchgit {
        name = "tiago_controller_configuration-source";
        url = "https://github.com/pal-gbp/tiago_robot-release.git";
        rev = "607418de1a2eb4315bc05bfa0a62932d6b1ff8fb";
        hash = "sha256-xB8z3bMYvsjdoP5jfqXEcj4iRP3+aFQT/rgwwhn+w6E=";
      };
    };
  });
  meta = {
    description = "Configuration and launch files of TIAGo's controllers";
  };
})
