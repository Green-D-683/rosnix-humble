{
  ament-cmake,
  buildAmentCmakePackage,
  dataspeed-dbw-common,
  dbw-ford-can,
  dbw-ford-msgs,
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
  pname = "dbw_ford_joystick_demo";
  version = "2.1.16-1";
  src = finalAttrs.passthru.sources."dbw_ford_joystick_demo";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ dataspeed-dbw-common dbw-ford-can dbw-ford-msgs joy rclcpp rclcpp-components sensor-msgs std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ dataspeed-dbw-common dbw-ford-can dbw-ford-msgs joy rclcpp rclcpp-components sensor-msgs std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "dbw_ford_joystick_demo" = substituteSource {
      src = fetchgit {
        name = "dbw_ford_joystick_demo-source";
        url = "https://github.com/DataspeedInc-release/dbw_ros-release.git";
        rev = "cef8ede82afeb2525ff1b0f79673c258d4bd25b5";
        hash = "sha256-ODY/NhEZYQZxQMl5aUr76mkwa1xOyKcvDd523SFSSOk=";
      };
    };
  });
  meta = {
    description = "\n    Demonstration of drive-by-wire with joystick\n  ";
  };
})
