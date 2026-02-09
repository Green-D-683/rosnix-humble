{
  ament-cmake-auto,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "pal_robotiq_description";
  version = "2.2.0-1";
  src = finalAttrs.passthru.sources."pal_robotiq_description";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedNativeBuildInputs = [ xacro ];
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ xacro ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "pal_robotiq_description" = substituteSource {
      src = fetchgit {
        name = "pal_robotiq_description-source";
        url = "https://github.com/pal-gbp/pal_robotiq_gripper-release.git";
        rev = "46c1a1a1b5b37c0d497431874d7eb2978acc357d";
        hash = "sha256-PeuKFUIZDqQu/95EnWMiJ4EC8n87FPkp0o0l+e6VR5k=";
      };
    };
  });
  meta = {
    description = "The pal_robotiq_description package";
  };
})
