{
  ament-cmake-auto,
  ament-cmake-gmock,
  ament-cmake-gtest,
  ament-lint-auto,
  autoware-cmake,
  autoware-component-interface-specs,
  autoware-lanelet2-extension,
  autoware-lint-common,
  autoware-map-msgs,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  ros-testing,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_map_projection_loader";
  version = "1.4.0-1";
  src = finalAttrs.passthru.sources."autoware_map_projection_loader";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ autoware-component-interface-specs autoware-lanelet2-extension autoware-map-msgs rclcpp rclcpp-components ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "yaml-cpp" ]; };
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ autoware-component-interface-specs autoware-lanelet2-extension autoware-map-msgs rclcpp rclcpp-components ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "yaml-cpp" ]; };
  checkInputs = [ ament-cmake-gmock ament-cmake-gtest ament-lint-auto autoware-lint-common ros-testing ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_map_projection_loader" = substituteSource {
      src = fetchgit {
        name = "autoware_map_projection_loader-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "4700e87f85aba5d03b5a923dfe83227085b7d67f";
        hash = "sha256-yd0dlK8Y07jVFA/t+5L7Xh8el0AgBSwJhjczhCPqqE4=";
      };
    };
  });
  meta = {
    description = "autoware_map_projection_loader package as a ROS 2 node";
  };
})
