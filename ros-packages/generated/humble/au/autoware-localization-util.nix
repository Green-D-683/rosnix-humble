{
  ament-cmake-auto,
  ament-cmake-cppcheck,
  ament-index-cpp,
  ament-lint-auto,
  autoware-cmake,
  buildAmentCmakePackage,
  diagnostic-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rcl-yaml-param-parser,
  rclcpp,
  rosSystemPackages,
  std-msgs,
  substituteSource,
  tf2,
  tf2-eigen,
  tf2-geometry-msgs,
  visualization-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_localization_util";
  version = "1.4.0-1";
  src = finalAttrs.passthru.sources."autoware_localization_util";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ diagnostic-msgs geometry-msgs rclcpp std-msgs tf2 tf2-eigen tf2-geometry-msgs visualization-msgs ];
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ diagnostic-msgs geometry-msgs rclcpp std-msgs tf2 tf2-eigen tf2-geometry-msgs visualization-msgs ];
  checkInputs = [ ament-cmake-cppcheck ament-index-cpp ament-lint-auto rcl-yaml-param-parser ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_localization_util" = substituteSource {
      src = fetchgit {
        name = "autoware_localization_util-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "1cd27ccdcc1ea920c8ad4be205bec8e4a0d9a7af";
        hash = "sha256-fDix1478L09TYKbK321Isulil6uxTBu2hAkbw45xlMM=";
      };
    };
  });
  meta = {
    description = "The autoware_localization_util package";
  };
})
