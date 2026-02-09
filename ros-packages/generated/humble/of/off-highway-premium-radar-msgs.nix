{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "off_highway_premium_radar_msgs";
  version = "0.11.0-1";
  src = finalAttrs.passthru.sources."off_highway_premium_radar_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-generators rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-generators rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "off_highway_premium_radar_msgs" = substituteSource {
      src = fetchgit {
        name = "off_highway_premium_radar_msgs-source";
        url = "https://github.com/ros2-gbp/off_highway_sensor_drivers-release.git";
        rev = "1baab3a403aa9f1a1dd6aa5719c9bcfcc4386ef3";
        hash = "sha256-ACzLvnZJ/m4gV7E4kGtvJVQcAoTCwvENWRf7V+79ykg=";
      };
    };
  });
  meta = {
    description = "The off_highway_premium_radar_msgs package";
  };
})
