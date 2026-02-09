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
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "tiago_pro_2dnav";
  version = "2.13.3-1";
  src = finalAttrs.passthru.sources."tiago_pro_2dnav";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedNativeBuildInputs = [ omni-base-2dnav ];
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ omni-base-2dnav ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "tiago_pro_2dnav" = substituteSource {
      src = fetchgit {
        name = "tiago_pro_2dnav-source";
        url = "https://github.com/ros2-gbp/tiago_pro_navigation-release.git";
        rev = "9d8f71f6b5288c5144511e2fa2357193a471b81f";
        hash = "sha256-1rZiWI22i6o7WFC/Tadj1BRn2Xppr/tHvI3Ys1UNmF0=";
      };
    };
  });
  meta = {
    description = "tiago pro-specific launch files needed to run navigation on the tiago_pro robot.";
  };
})
