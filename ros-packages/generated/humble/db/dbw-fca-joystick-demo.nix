{
  ament-cmake,
  buildAmentCmakePackage,
  dataspeed-dbw-common,
  dbw-fca-can,
  dbw-fca-msgs,
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
  pname = "dbw_fca_joystick_demo";
  version = "2.1.16-1";
  src = finalAttrs.passthru.sources."dbw_fca_joystick_demo";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ dataspeed-dbw-common dbw-fca-can dbw-fca-msgs joy rclcpp rclcpp-components sensor-msgs std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ dataspeed-dbw-common dbw-fca-can dbw-fca-msgs joy rclcpp rclcpp-components sensor-msgs std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "dbw_fca_joystick_demo" = substituteSource {
      src = fetchgit {
        name = "dbw_fca_joystick_demo-source";
        url = "https://github.com/DataspeedInc-release/dbw_ros-release.git";
        rev = "1df78c20ba71c5c6b3bac7e6407f646fd13854b9";
        hash = "sha256-WDZmtDf/suFuG1qUw5LwYAzM4KgxpWYRykOldY7MBWw=";
      };
    };
  });
  meta = {
    description = "\n    Demonstration of drive-by-wire with joystick\n  ";
  };
})
