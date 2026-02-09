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
  mkSourceSet,
  position-controllers,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "pal_gripper_controller_configuration";
  version = "3.6.0-1";
  src = finalAttrs.passthru.sources."pal_gripper_controller_configuration";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedNativeBuildInputs = [ controller-manager joint-trajectory-controller position-controllers ];
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ controller-manager joint-trajectory-controller position-controllers ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "pal_gripper_controller_configuration" = substituteSource {
      src = fetchgit {
        name = "pal_gripper_controller_configuration-source";
        url = "https://github.com/pal-gbp/pal_gripper-release.git";
        rev = "41bf069c77d76b275b791df7717ef196c5fa90e3";
        hash = "sha256-F3h6Ba0YqEkxq/l2oZIGzlKELOgLZGOp5O5NvtX3aNQ=";
      };
    };
  });
  meta = {
    description = "The pal_gripper_controller_configuration package";
  };
})
