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
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "tiago_rgbd_sensors";
  version = "4.11.0-1";
  src = finalAttrs.passthru.sources."tiago_rgbd_sensors";
  nativeBuildInputs = [ ament-cmake-auto ];
  buildInputs = [ ament-cmake-auto ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "tiago_rgbd_sensors" = substituteSource {
      src = fetchgit {
        name = "tiago_rgbd_sensors-source";
        url = "https://github.com/pal-gbp/tiago_navigation-release.git";
        rev = "aa04fd1a81dcb94f095d8aa73b5cce2573e74c9d";
        hash = "sha256-BJjwaLynirpRfaD3PcOkLZxfuHlj4G2VvcrIE8OXfNY=";
      };
    };
  });
  meta = {
    description = "Launch files and scripts needed to bring up the ROS nodes of a TIAGo robot.";
  };
})
