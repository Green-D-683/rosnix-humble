{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  sensor-msgs,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "wrapyfi_ros2_interfaces";
  version = "0.4.30-1";
  src = finalAttrs.passthru.sources."wrapyfi_ros2_interfaces";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ builtin-interfaces rosidl-default-generators rosidl-default-runtime sensor-msgs std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-generators rosidl-default-runtime sensor-msgs std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "wrapyfi_ros2_interfaces" = substituteSource {
      src = fetchgit {
        name = "wrapyfi_ros2_interfaces-source";
        url = "https://github.com/modular-ml/wrapyfi_ros2_interfaces-release.git";
        rev = "0a1e569618e04ffe690abb47688d2d0bf6551673";
        hash = "sha256-4CRQXZV/6uoHxgAUdBP1LHb3TsZd4yNBCz8uUo2eZVk=";
      };
    };
  });
  meta = {
    description = "Wrapyfi ROS 2 interfaces";
  };
})
