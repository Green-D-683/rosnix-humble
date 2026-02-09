{
  ament-cmake-auto,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  tiago-2dnav,
  tiago-laser-sensors,
  tiago-rgbd-sensors,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "tiago_navigation";
  version = "4.11.0-1";
  src = finalAttrs.passthru.sources."tiago_navigation";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedNativeBuildInputs = [ tiago-2dnav tiago-laser-sensors tiago-rgbd-sensors ];
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ tiago-2dnav tiago-laser-sensors tiago-rgbd-sensors ];
  passthru.sources = mkSourceSet (sources: {
    "tiago_navigation" = substituteSource {
      src = fetchgit {
        name = "tiago_navigation-source";
        url = "https://github.com/pal-gbp/tiago_navigation-release.git";
        rev = "4fe6b69a75e96fc04c3f40e560db425992e60bde";
        hash = "sha256-1XXEYK35bC7MgZ4Ew/00uIMpKivx399s0fQujhvN7YE=";
      };
    };
  });
  meta = {
    description = "TIAGo navigation metapackage";
  };
})
