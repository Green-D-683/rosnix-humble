{
  ament-cmake-auto,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  controller-manager,
  fetchgit,
  fetchurl,
  fetchzip,
  joint-trajectory-controller,
  launch,
  launch-pal,
  mkSourceSet,
  pal-pro-gripper-controller-configuration,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "pal_sea_arm_controller_configuration";
  version = "1.21.0-1";
  src = finalAttrs.passthru.sources."pal_sea_arm_controller_configuration";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedNativeBuildInputs = [ controller-manager joint-trajectory-controller launch launch-pal pal-pro-gripper-controller-configuration ];
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ controller-manager joint-trajectory-controller launch launch-pal pal-pro-gripper-controller-configuration ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "pal_sea_arm_controller_configuration" = substituteSource {
      src = fetchgit {
        name = "pal_sea_arm_controller_configuration-source";
        url = "https://github.com/ros2-gbp/pal_sea_arm-release.git";
        rev = "562dd5ed5b1d18cc975e92601d143ba669970d36";
        hash = "sha256-E1soaRp67BgwKEvz7F9ghRWlAYyY2XL3j9CmxkGw6a8=";
      };
    };
  });
  meta = {
    description = "The pal_sea_arm_controller_configuration package";
  };
})
