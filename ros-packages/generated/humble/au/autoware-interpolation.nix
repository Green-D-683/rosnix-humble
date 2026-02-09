{
  ament-cmake-auto,
  ament-cmake-ros,
  ament-lint-auto,
  autoware-cmake,
  autoware-lint-common,
  autoware-utils-geometry,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  tf2,
  tf2-geometry-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_interpolation";
  version = "1.4.0-1";
  src = finalAttrs.passthru.sources."autoware_interpolation";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ autoware-utils-geometry geometry-msgs tf2 tf2-geometry-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" ]; };
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ autoware-utils-geometry geometry-msgs tf2 tf2-geometry-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" ]; };
  checkInputs = [ ament-cmake-ros ament-lint-auto autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_interpolation" = substituteSource {
      src = fetchgit {
        name = "autoware_interpolation-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "244a2586866ffc7a3610c599ea8adc829bf5e00e";
        hash = "sha256-4LXuVTpI9bkkS/mdMgBBAkWZ4qPPdgH9Gw7NlC/FfkA=";
      };
    };
  });
  meta = {
    description = "The spline interpolation package";
  };
})
