{
  ament-cmake-auto,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  omni-base-laser-sensors,
  pmb2-laser-sensors,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "tiago_laser_sensors";
  version = "4.11.0-1";
  src = finalAttrs.passthru.sources."tiago_laser_sensors";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedNativeBuildInputs = [ omni-base-laser-sensors pmb2-laser-sensors ];
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ omni-base-laser-sensors pmb2-laser-sensors ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "tiago_laser_sensors" = substituteSource {
      src = fetchgit {
        name = "tiago_laser_sensors-source";
        url = "https://github.com/pal-gbp/tiago_navigation-release.git";
        rev = "8bef1046631b9dc483fdaa6653418b2624f12659";
        hash = "sha256-XCxSsFZ126rLrIePDoGHPqsdpfSSE3m+Cf4wJwJzGNI=";
      };
    };
  });
  meta = {
    description = "Launch files and scripts needed to bring up the ROS nodes of a TIAGo robot.";
  };
})
