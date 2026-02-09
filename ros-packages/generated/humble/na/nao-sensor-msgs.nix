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
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nao_sensor_msgs";
  version = "0.0.5-1";
  src = finalAttrs.passthru.sources."nao_sensor_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators rosidl-default-runtime ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rosidl-default-generators rosidl-default-runtime ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "nao_sensor_msgs" = substituteSource {
      src = fetchgit {
        name = "nao_sensor_msgs-source";
        url = "https://github.com/ros2-gbp/nao_interfaces-release.git";
        rev = "49b38dc041758a1e9adb51c108267631493fef0e";
        hash = "sha256-voblmIZEbFn+LhZA1F3qn0v2jO6Jgj7uOi9/OaDhQkE=";
      };
    };
  });
  meta = {
    description = "Package defining sensor msgs to be received from NAO robot.";
  };
})
