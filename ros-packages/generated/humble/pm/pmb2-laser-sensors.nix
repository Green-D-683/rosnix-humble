{
  ament-cmake-auto,
  ament-index-python,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  diagnostic-aggregator,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "pmb2_laser_sensors";
  version = "4.18.2-1";
  src = finalAttrs.passthru.sources."pmb2_laser_sensors";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedNativeBuildInputs = [ ament-index-python diagnostic-aggregator ];
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ ament-index-python diagnostic-aggregator ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "pmb2_laser_sensors" = substituteSource {
      src = fetchgit {
        name = "pmb2_laser_sensors-source";
        url = "https://github.com/pal-gbp/pmb2_navigation-gbp.git";
        rev = "f6fe8ad6fc833644760b7a6b70e13d89a990d643";
        hash = "sha256-/UTO7QwXKIF7J672kbNPWC+yAL6dmu9TTOtV6qTfV9c=";
      };
    };
  });
  meta = {
    description = "Launch files and scripts needed to bring up the ROS nodes of a PMB2 robot.";
  };
})
