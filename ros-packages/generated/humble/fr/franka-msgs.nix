{
  action-msgs,
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
  sensor-msgs,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "franka_msgs";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."franka_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ action-msgs builtin-interfaces geometry-msgs rosidl-default-generators rosidl-default-runtime sensor-msgs std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ action-msgs builtin-interfaces geometry-msgs rosidl-default-generators rosidl-default-runtime sensor-msgs std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "franka_msgs" = substituteSource {
      src = fetchgit {
        name = "franka_msgs-source";
        url = "https://github.com/ros2-gbp/franka_ros2-release.git";
        rev = "d36e94200f42a6aab66c16ae93d5472337f05115";
        hash = "sha256-8gydpch2K18f6YbBuj5JFj851cGyDBZhqIhz2jcGBok=";
      };
    };
  });
  meta = {
    description = "franka_msgs provides messages and actions specific to Franka Robotics research robots";
  };
})
