{
  ament-cmake-auto,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  omni-base-bringup,
  omni-base-controller-configuration,
  omni-base-description,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "omni_base_robot";
  version = "2.14.1-1";
  src = finalAttrs.passthru.sources."omni_base_robot";
  nativeBuildInputs = [ ament-cmake-auto wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ omni-base-bringup omni-base-controller-configuration omni-base-description ];
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ omni-base-bringup omni-base-controller-configuration omni-base-description ];
  passthru.sources = mkSourceSet (sources: {
    "omni_base_robot" = substituteSource {
      src = fetchgit {
        name = "omni_base_robot-source";
        url = "https://github.com/pal-gbp/omni_base_robot-release.git";
        rev = "a97d41df9d15417d85e32aa7e8c6f9ddef376fe5";
        hash = "sha256-zkaxZkhzS0qa41BB6gNnic++TZzFU/2rCFWwULn94JY=";
      };
    };
  });
  meta = {
    description = "The omni_base_robot package";
  };
})
