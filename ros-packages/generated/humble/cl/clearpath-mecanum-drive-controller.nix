{
  ament-cmake,
  ament-cmake-gmock,
  buildAmentCmakePackage,
  control-msgs,
  controller-interface,
  controller-manager,
  fetchgit,
  fetchurl,
  fetchzip,
  generate-parameter-library,
  geometry-msgs,
  hardware-interface,
  hardware-interface-testing,
  mkSourceSet,
  nav-msgs,
  pluginlib,
  rclcpp,
  rclcpp-lifecycle,
  rcpputils,
  realtime-tools,
  ros2-control-test-assets,
  rosSystemPackages,
  std-srvs,
  substituteSource,
  tf2,
  tf2-geometry-msgs,
  tf2-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "clearpath_mecanum_drive_controller";
  version = "0.1.1-1";
  src = finalAttrs.passthru.sources."clearpath_mecanum_drive_controller";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ control-msgs controller-interface generate-parameter-library geometry-msgs hardware-interface nav-msgs pluginlib rclcpp rclcpp-lifecycle rcpputils realtime-tools std-srvs tf2 tf2-geometry-msgs tf2-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ control-msgs controller-interface generate-parameter-library geometry-msgs hardware-interface nav-msgs pluginlib rclcpp rclcpp-lifecycle rcpputils realtime-tools std-srvs tf2 tf2-geometry-msgs tf2-msgs ];
  checkInputs = [ ament-cmake-gmock controller-manager hardware-interface-testing ros2-control-test-assets ];
  passthru.sources = mkSourceSet (sources: {
    "clearpath_mecanum_drive_controller" = substituteSource {
      src = fetchgit {
        name = "clearpath_mecanum_drive_controller-source";
        url = "https://github.com/clearpath-gbp/clearpath_mecanum_drive_controller-release.git";
        rev = "8e1387cc494a09e18a72a76805824e9956abbe85";
        hash = "sha256-0ihhQTmQdoRf8WvbuLaktbgsBzFTP0/8wFlM22uaROI=";
      };
    };
  });
  meta = {
    description = " Clearpath fork of mecanum drive controller for 4 wheel drive.\n  ";
  };
})
