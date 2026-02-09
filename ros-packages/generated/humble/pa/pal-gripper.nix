{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  pal-gripper-controller-configuration,
  pal-gripper-description,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "pal_gripper";
  version = "3.6.0-1";
  src = finalAttrs.passthru.sources."pal_gripper";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ pal-gripper-controller-configuration pal-gripper-description ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ pal-gripper-controller-configuration pal-gripper-description ];
  passthru.sources = mkSourceSet (sources: {
    "pal_gripper" = substituteSource {
      src = fetchgit {
        name = "pal_gripper-source";
        url = "https://github.com/pal-gbp/pal_gripper-release.git";
        rev = "e98f84edf76a2f23ead6088bdfc1aa2d7968e268";
        hash = "sha256-Qwm5b6GTlJAz9KC8jR2kEB3vgHgM1qcskOOd2+uScH0=";
      };
    };
  });
  meta = {
    description = "The pal_gripper package";
  };
})
