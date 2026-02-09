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
  joint-state-broadcaster,
  launch,
  launch-pal,
  mkSourceSet,
  ros2controlcli,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "pmb2_controller_configuration";
  version = "5.10.2-1";
  src = finalAttrs.passthru.sources."pmb2_controller_configuration";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedNativeBuildInputs = [ controller-manager diff-drive-controller joint-state-broadcaster launch launch-pal ros2controlcli ];
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ controller-manager diff-drive-controller joint-state-broadcaster launch launch-pal ros2controlcli ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "pmb2_controller_configuration" = substituteSource {
      src = fetchgit {
        name = "pmb2_controller_configuration-source";
        url = "https://github.com/pal-gbp/pmb2_robot-gbp.git";
        rev = "19f159d289a1049a9f40b410f21de678e5da0966";
        hash = "sha256-riQUceB4c/sYndH9VV2GBk8zXEHLhvYOL79au9Abhjc=";
      };
    };
  });
  meta = {
    description = "Launch files and scripts needed to configure\n    the controllers of the PMB2 robot.";
  };
})
