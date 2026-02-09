{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ros2_control_test_assets";
  version = "2.53.1-1";
  src = finalAttrs.passthru.sources."ros2_control_test_assets";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "ros2_control_test_assets" = substituteSource {
      src = fetchgit {
        name = "ros2_control_test_assets-source";
        url = "https://github.com/ros2-gbp/ros2_control-release.git";
        rev = "7d41033c7f69088512c99b5c520db46cecbceec5";
        hash = "sha256-OrFlvT1nmE+BOt3L7BmFU16qE9LEmklpIrCERxrLSh4=";
      };
    };
  });
  meta = {
    description = "The package provides shared test resources for ros2_control stack\n  ";
  };
})
