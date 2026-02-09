{
  ament-cmake-auto,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  controller-manager,
  fetchgit,
  fetchurl,
  fetchzip,
  joint-state-broadcaster,
  joint-trajectory-controller,
  launch,
  launch-pal,
  launch-ros,
  mkSourceSet,
  pal-pro-gripper-wrapper,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "pal_pro_gripper_controller_configuration";
  version = "1.8.0-1";
  src = finalAttrs.passthru.sources."pal_pro_gripper_controller_configuration";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedNativeBuildInputs = [ controller-manager joint-state-broadcaster joint-trajectory-controller launch launch-pal launch-ros pal-pro-gripper-wrapper ];
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ controller-manager joint-state-broadcaster joint-trajectory-controller launch launch-pal launch-ros pal-pro-gripper-wrapper ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "pal_pro_gripper_controller_configuration" = substituteSource {
      src = fetchgit {
        name = "pal_pro_gripper_controller_configuration-source";
        url = "https://github.com/ros2-gbp/pal_pro_gripper-release.git";
        rev = "dcd2843209d2e936167c0af28d1cf7b45dd9cd79";
        hash = "sha256-tX1oHV9JSkzHQDAeSICqVXm1hgqLF3XMULk6F6zxMEw=";
      };
    };
  });
  meta = {
    description = "The pal_pro_gripper_controller_configuration package";
  };
})
