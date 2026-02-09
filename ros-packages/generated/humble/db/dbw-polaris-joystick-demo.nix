{
  ament-cmake,
  buildAmentCmakePackage,
  dataspeed-dbw-common,
  dbw-polaris-can,
  dbw-polaris-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  joy,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "dbw_polaris_joystick_demo";
  version = "2.1.16-1";
  src = finalAttrs.passthru.sources."dbw_polaris_joystick_demo";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ dataspeed-dbw-common dbw-polaris-can dbw-polaris-msgs joy rclcpp rclcpp-components sensor-msgs std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ dataspeed-dbw-common dbw-polaris-can dbw-polaris-msgs joy rclcpp rclcpp-components sensor-msgs std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "dbw_polaris_joystick_demo" = substituteSource {
      src = fetchgit {
        name = "dbw_polaris_joystick_demo-source";
        url = "https://github.com/DataspeedInc-release/dbw_ros-release.git";
        rev = "9716df50b9edcf908d56f3ca10ff561ec540abd4";
        hash = "sha256-nypSpr0DVaSJfwgj9CAYZp642A8x1yr7DC/7PqlbNGo=";
      };
    };
  });
  meta = {
    description = "\n    Demonstration of drive-by-wire with joystick\n  ";
  };
})
