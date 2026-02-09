{
  ament-cmake-auto,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  omni-base-2dnav,
  pmb2-2dnav,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "tiago_2dnav";
  version = "4.11.0-1";
  src = finalAttrs.passthru.sources."tiago_2dnav";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedNativeBuildInputs = [ omni-base-2dnav pmb2-2dnav ];
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ omni-base-2dnav pmb2-2dnav ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "tiago_2dnav" = substituteSource {
      src = fetchgit {
        name = "tiago_2dnav-source";
        url = "https://github.com/pal-gbp/tiago_navigation-release.git";
        rev = "034bfa18839f8b3141213ebfc9ba7ee4533caeea";
        hash = "sha256-s1G5ANURWybhvEDX8eeq6vvyGvq40YJRBSWToSALWJg=";
      };
    };
  });
  meta = {
    description = "TIAGo-specific launch files needed to run navigation on a TIAGo robot.";
  };
})
