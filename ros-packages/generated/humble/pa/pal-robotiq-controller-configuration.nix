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
  pname = "pal_robotiq_controller_configuration";
  version = "2.2.0-1";
  src = finalAttrs.passthru.sources."pal_robotiq_controller_configuration";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedNativeBuildInputs = [ controller-manager joint-trajectory-controller position-controllers ];
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ controller-manager joint-trajectory-controller position-controllers ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "pal_robotiq_controller_configuration" = substituteSource {
      src = fetchgit {
        name = "pal_robotiq_controller_configuration-source";
        url = "https://github.com/pal-gbp/pal_robotiq_gripper-release.git";
        rev = "b957ed5f4107df7530293463c384ce85194b3c1d";
        hash = "sha256-RfDxirZ3X8UNwfYOYMsyCR7nFRf0K5TzY12qSXlSN1c=";
      };
    };
  });
  meta = {
    description = "The pal_robotiq_controller_configuration package";
  };
})
