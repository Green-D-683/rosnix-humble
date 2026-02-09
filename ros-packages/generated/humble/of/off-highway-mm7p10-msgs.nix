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
  pname = "off_highway_mm7p10_msgs";
  version = "0.11.0-1";
  src = finalAttrs.passthru.sources."off_highway_mm7p10_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "off_highway_mm7p10_msgs" = substituteSource {
      src = fetchgit {
        name = "off_highway_mm7p10_msgs-source";
        url = "https://github.com/ros2-gbp/off_highway_sensor_drivers-release.git";
        rev = "73720ddf05d762edfd21d4ae8946ebf8b97925bf";
        hash = "sha256-aYkAFnpuvmU7NEiy5miLvzb4SsuqylQRAOoNHn7kLaQ=";
      };
    };
  });
  meta = {
    description = "The off_highway_mm7p10_msgs package";
  };
})
