{
  ament-cmake,
  ament-cmake-gtest,
  ament-cmake-pytest,
  ament-lint-auto,
  ament-lint-common,
  angles,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav-msgs,
  nav2-graceful-controller,
  nav2-msgs,
  nav2-util,
  opennav-docking-core,
  opennav-docking-msgs,
  pluginlib,
  rclcpp,
  rclcpp-action,
  rclcpp-lifecycle,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  tf2-ros,
  yaml-cpp-vendor,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "opennav_docking";
  version = "0.0.2-4";
  src = finalAttrs.passthru.sources."opennav_docking";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ angles builtin-interfaces geometry-msgs nav2-graceful-controller nav2-msgs nav2-util nav-msgs opennav-docking-core opennav-docking-msgs pluginlib rclcpp rclcpp-action rclcpp-lifecycle sensor-msgs tf2-ros yaml-cpp-vendor ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ angles builtin-interfaces geometry-msgs nav2-graceful-controller nav2-msgs nav2-util nav-msgs opennav-docking-core opennav-docking-msgs pluginlib rclcpp rclcpp-action rclcpp-lifecycle sensor-msgs tf2-ros yaml-cpp-vendor ];
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "opennav_docking" = substituteSource {
      src = fetchgit {
        name = "opennav_docking-source";
        url = "https://github.com/open-navigation/opennav_docking-release.git";
        rev = "f20f53a505249d6e11c72478dd39a6c2694d9886";
        hash = "sha256-DgIRsXDpPDDMnNKyAxlTdxXBsQIjPA0lZJOOCFdmUiA=";
      };
    };
  });
  meta = {
    description = "A Task Server for robot charger docking";
  };
})
