{
  ament-cmake,
  buildAmentCmakePackage,
  ds-dbw-can,
  ds-dbw-msgs,
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
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ds_dbw_joystick_demo";
  version = "2.1.16-1";
  src = finalAttrs.passthru.sources."ds_dbw_joystick_demo";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ds-dbw-can ds-dbw-msgs joy rclcpp rclcpp-components sensor-msgs std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ds-dbw-can ds-dbw-msgs joy rclcpp rclcpp-components sensor-msgs std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "ds_dbw_joystick_demo" = substituteSource {
      src = fetchgit {
        name = "ds_dbw_joystick_demo-source";
        url = "https://github.com/DataspeedInc-release/dbw_ros-release.git";
        rev = "a33e59a9d856e266b181df5441ef656404d6772d";
        hash = "sha256-0a0K9avvM4RpKWvYtB9Kz+87fO5VzHm1vIr6Z/9vEm4=";
      };
    };
  });
  meta = {
    description = "\n    Demonstration of drive-by-wire with joystick\n  ";
  };
})
