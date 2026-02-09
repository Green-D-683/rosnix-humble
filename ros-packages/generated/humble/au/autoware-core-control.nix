{
  ament-cmake-auto,
  ament-lint-auto,
  autoware-cmake,
  autoware-lint-common,
  autoware-simple-pure-pursuit,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_core_control";
  version = "1.4.0-1";
  src = finalAttrs.passthru.sources."autoware_core_control";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ autoware-simple-pure-pursuit ];
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ autoware-simple-pure-pursuit ];
  checkInputs = [ ament-lint-auto autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_core_control" = substituteSource {
      src = fetchgit {
        name = "autoware_core_control-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "ade81282c2e1d9e7421ebddbd208ee9c4d4386b9";
        hash = "sha256-JZfWtymzBNr1sj4h4AbVcyLYzzyxJmu0xGP3zSFeP/U=";
      };
    };
  });
  meta = {
    description = "The autoware_core_control package";
  };
})
