{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
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
  pname = "off_highway_uss_msgs";
  version = "0.11.0-1";
  src = finalAttrs.passthru.sources."off_highway_uss_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ geometry-msgs rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ geometry-msgs rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "off_highway_uss_msgs" = substituteSource {
      src = fetchgit {
        name = "off_highway_uss_msgs-source";
        url = "https://github.com/ros2-gbp/off_highway_sensor_drivers-release.git";
        rev = "bdc99b71c688c859d958f1d551e7bfc4c371b7cd";
        hash = "sha256-mB2CwErqmGMtvm3GSCm2l/nb6OisyvJZDeI12zpHkKk=";
      };
    };
  });
  meta = {
    description = "The off_highway_uss_msgs package";
  };
})
