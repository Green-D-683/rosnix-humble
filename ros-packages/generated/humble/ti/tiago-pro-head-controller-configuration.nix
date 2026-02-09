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
  ros2controlcli,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "tiago_pro_head_controller_configuration";
  version = "1.7.0-1";
  src = finalAttrs.passthru.sources."tiago_pro_head_controller_configuration";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedNativeBuildInputs = [ joint-state-broadcaster joint-trajectory-controller launch launch-pal ros2controlcli ];
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ joint-state-broadcaster joint-trajectory-controller launch launch-pal ros2controlcli ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "tiago_pro_head_controller_configuration" = substituteSource {
      src = fetchgit {
        name = "tiago_pro_head_controller_configuration-source";
        url = "https://github.com/ros2-gbp/tiago_pro_head_robot-release.git";
        rev = "969044fd50fe4935a1a86da99bbcca500ff04e6d";
        hash = "sha256-oJbIwU26hBduEuEJeDk+sbacd40KiZp7+LDYQr2q+OI=";
      };
    };
  });
  meta = {
    description = "The tiago_pro_head_controller_configuration package";
  };
})
