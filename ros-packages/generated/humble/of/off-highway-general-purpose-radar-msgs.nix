{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "off_highway_general_purpose_radar_msgs";
  version = "0.11.0-1";
  src = finalAttrs.passthru.sources."off_highway_general_purpose_radar_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "off_highway_general_purpose_radar_msgs" = substituteSource {
      src = fetchgit {
        name = "off_highway_general_purpose_radar_msgs-source";
        url = "https://github.com/ros2-gbp/off_highway_sensor_drivers-release.git";
        rev = "fdb17ad3fe7a4827e10a3246fde07124cb4e0881";
        hash = "sha256-dbAXN+zGVxs1XGFw2V9u6dTc2wWqoRBx9ne0EXho5bo=";
      };
    };
  });
  meta = {
    description = "The off_highway_general_purpose_radar_msgs package";
  };
})
