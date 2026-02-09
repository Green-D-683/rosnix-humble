{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  angles,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rcpputils,
  rosSystemPackages,
  rviz-common,
  rviz-default-plugins,
  sensor-msgs,
  substituteSource,
  tf2-ros,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rviz_satellite";
  version = "4.0.0-1";
  src = finalAttrs.passthru.sources."rviz_satellite";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ angles rclcpp rcpputils rviz-common rviz-default-plugins sensor-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "qtbase5-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ angles rclcpp rcpputils rviz-common rviz-default-plugins sensor-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "qtbase5-dev" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rviz_satellite" = substituteSource {
      src = fetchgit {
        name = "rviz_satellite-source";
        url = "https://github.com/nobleo/rviz_satellite-release.git";
        rev = "27be29b75833cdf374618513376fdf02bc7d494c";
        hash = "sha256-1btiDvrU9NYm/CgsMa3Vwu6Fv4zgHc7A7OhZgKy8MBU=";
      };
    };
  });
  meta = {
    description = "Display satellite map tiles in RViz";
  };
})
