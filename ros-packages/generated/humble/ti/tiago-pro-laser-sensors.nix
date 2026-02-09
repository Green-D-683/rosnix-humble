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
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "tiago_pro_laser_sensors";
  version = "2.13.3-1";
  src = finalAttrs.passthru.sources."tiago_pro_laser_sensors";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedNativeBuildInputs = [ omni-base-laser-sensors ];
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ omni-base-laser-sensors ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "tiago_pro_laser_sensors" = substituteSource {
      src = fetchgit {
        name = "tiago_pro_laser_sensors-source";
        url = "https://github.com/ros2-gbp/tiago_pro_navigation-release.git";
        rev = "78b168cf966c9a11ddcc12531a1b44ff666e33f6";
        hash = "sha256-k2UeVuDFqmZ4ocR9ELbDovcTo4BI14UR44WdYi2SRdI=";
      };
    };
  });
  meta = {
    description = "tiago_pro-specific laser sensors launch and config files.";
  };
})
