{
  ament-cmake-auto,
  ament-cmake-ros,
  ament-lint-auto,
  autoware-cmake,
  autoware-internal-debug-msgs,
  autoware-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav-msgs,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  substituteSource,
  tf2,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_stop_filter";
  version = "1.4.0-1";
  src = finalAttrs.passthru.sources."autoware_stop_filter";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ autoware-internal-debug-msgs geometry-msgs nav-msgs rclcpp rclcpp-components tf2 ];
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ autoware-internal-debug-msgs geometry-msgs nav-msgs rclcpp rclcpp-components tf2 ];
  checkInputs = [ ament-cmake-ros ament-lint-auto autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_stop_filter" = substituteSource {
      src = fetchgit {
        name = "autoware_stop_filter-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "6855eb03762a11f68f5868eda96f77008dad39c0";
        hash = "sha256-vmUlWnrALtBdIDtnPkiswZIZwTvofIf8o6B15udSh6s=";
      };
    };
  });
  meta = {
    description = "The stop filter package";
  };
})
