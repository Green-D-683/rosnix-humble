{
  ament-cmake-auto,
  ament-cmake-gtest,
  ament-lint-auto,
  autoware-cmake,
  autoware-lanelet2-extension,
  autoware-lint-common,
  autoware-map-loader,
  autoware-map-msgs,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch-testing-ament-cmake,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  substituteSource,
  visualization-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_lanelet2_map_visualizer";
  version = "1.4.0-1";
  src = finalAttrs.passthru.sources."autoware_lanelet2_map_visualizer";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ autoware-lanelet2-extension autoware-map-msgs rclcpp rclcpp-components visualization-msgs ];
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ autoware-lanelet2-extension autoware-map-msgs rclcpp rclcpp-components visualization-msgs ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto autoware-lint-common autoware-map-loader launch-testing-ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_lanelet2_map_visualizer" = substituteSource {
      src = fetchgit {
        name = "autoware_lanelet2_map_visualizer-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "e1f2e474e1c17e38b1939c5a42648ed120753618";
        hash = "sha256-IfHxO2vw16CS0cSInDWv4A04WkGDnXR2/Duvez2bgfU=";
      };
    };
  });
  meta = {
    description = "The autoware_lanelet2_map_visualizer package";
  };
})
