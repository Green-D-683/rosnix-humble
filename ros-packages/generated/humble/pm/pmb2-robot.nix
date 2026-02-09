{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  pmb2-bringup,
  pmb2-controller-configuration,
  pmb2-description,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "pmb2_robot";
  version = "5.10.2-1";
  src = finalAttrs.passthru.sources."pmb2_robot";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ pmb2-bringup pmb2-controller-configuration pmb2-description ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ pmb2-bringup pmb2-controller-configuration pmb2-description ];
  passthru.sources = mkSourceSet (sources: {
    "pmb2_robot" = substituteSource {
      src = fetchgit {
        name = "pmb2_robot-source";
        url = "https://github.com/pal-gbp/pmb2_robot-gbp.git";
        rev = "129e4d51fef80194b0f8527837bcf0c73a54845c";
        hash = "sha256-7d99g4Dco2umorCFK2xxXDslacmFEuY0nrzdMaH+zsA=";
      };
    };
  });
  meta = {
    description = "PMB2 robot description and launch files";
  };
})
