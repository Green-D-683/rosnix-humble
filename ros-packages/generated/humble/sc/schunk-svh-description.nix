{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "schunk_svh_description";
  version = "2.1.1-1";
  src = finalAttrs.passthru.sources."schunk_svh_description";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "schunk_svh_description" = substituteSource {
      src = fetchgit {
        name = "schunk_svh_description-source";
        url = "https://github.com/ros2-gbp/schunk_svh_ros_driver-release.git";
        rev = "85f4ed9a3a249097bba6baf98a9c4f7e8cf225b3";
        hash = "sha256-4N10izt0TwDo+3URnpQhoTsQlxdGczrItB3ZVf/opWk=";
      };
    };
  });
  meta = {
    description = "Kinematic and visual descriptions of the Schunk SVH";
  };
})
